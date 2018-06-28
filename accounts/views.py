from django.shortcuts import render,redirect,reverse
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect,QueryDict
from django.views.generic import TemplateView,ListView,View
from .forms import LoginForm
from accounts import forms,models
from django.contrib.auth import login, logout,authenticate
from django.contrib.auth.decorators import login_required,permission_required
from django.utils.decorators import method_decorator
from django.contrib.auth.mixins import LoginRequiredMixin,PermissionRequiredMixin
from django.contrib.auth.models import Group
import json



class UserLoginView(View):
    """
    用户登录
    """
    def get(self,request):

        return render(request,'user/login.html')

    def post(self,request):
        res = {'code':0}
        login_form = forms.LoginForm(request.POST)

        if login_form.is_valid():
            username = request.POST.get('username', '')

            password = request.POST.get('password', '')

            user = authenticate(username=username, password=password)


            if user is not None:
                if user.is_active:
                    login(request, user)
                    res['next_url'] = '/'
                else:
                    res['code'] = 1
                    res['errmsg'] = '用户被禁用'
            else:
                res['code'] = 1
                res['errmsg'] = '用户名或密码错误'
        else:
            res['code'] = 1
            res['errmsg'] = "用户名或密码不能为空"
        return JsonResponse(res,safe=True)


class UseindexView(View):

    """Dashboard首页"""


    def get(self,request,*args,**kwargs):
        return render(request,'user/index.html')


class CreateUserView(View):
    """添加用户"""


    def get(self,request,*args,**kwargs):
        obj = forms.RegisterCreateUser()
        return render(request,'user/createuser.html',{'obj':obj})

    def post(self,request):
        print(request.POST)
        ret = {'status':0}
        obj = forms.RegisterCreateUser(request.POST)
        if obj.is_valid():
            username = obj.cleaned_data.get('username')
            print(username)
            username_zh = obj.cleaned_data.get('username_zh')
            password = obj.cleaned_data.get('password')
            re_password = obj.cleaned_data.get('re_password')
            email = obj.cleaned_data.get('email')

            userlogin = models.UserInfo.objects.create_user(username=username,
                                           name = username_zh,
                                           password = password,
                                           email = email)

            if userlogin:
                return HttpResponseRedirect(reverse("user_list"))

        else:
            print(obj.errors)

            return render(request, 'user/createuser.html', {'obj': obj})
        obj = forms.RegisterCreateUser()
        return render(request, 'user/createuser.html',{'obj': obj})


class DeleteUserView(LoginRequiredMixin,View):
    """删除用户"""

    def delete(self,request):
        ret = {'status':0}
        data = QueryDict(request.body).get('iddelete')
        #del_num = data.get('iddelete')
        try:
            models.UserInfo.objects.filter(id=int(data)).delete()
        except models.UserInfo.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '用户名不存在'

        return JsonResponse(ret)


class ModifyUserStatusView(View):
    """修改用户状态"""
    def post(self,request):
        ret = {'status':0}
        uid = request.POST.get("uid",'')
        try:
            user_obj = models.UserInfo.objects.get(id=uid)
            # user_obj.is_active = False if user_obj.is_active else True
            if user_obj.is_active:
                user_obj.is_active = False
            else:
                user_obj.is_active = True
            user_obj.save() #保存
            print(user_obj.is_active)

        except user_obj.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '用户不存在'
        return JsonResponse(ret)


class UserLogoutView(View):
    """退出登录"""
    def get(self,request):
        logout(request)
        return HttpResponseRedirect(reverse("user_login"))


class user_list_view(LoginRequiredMixin,ListView):
    """
    用户列表展示
    """
    template_name = 'user/userlist.html'
    model = models.UserInfo
    ordering = '-id'
    paginate_by = 8
    #permission_required = "accounts.add_userinfo"


    def get_queryset(self):
        """用户搜索"""
        queryset = super(user_list_view,self).get_queryset()
        username = self.request.GET.get('search_username',"")
        if username:
            queryset = queryset.filter(username=username)
        return queryset

    def get_context_data(self, **kwargs):
        """展示组下拉组"""
        context = super(user_list_view,self).get_context_data(**kwargs)
        context['group_dd'] = Group.objects.all()
        return context

    def put(self,request):
        """将用户添加至指定组"""
        ret = {'status':0}
        data = QueryDict(request.body)
        #获取前端ajax传过来的uid  gid
        uid = data.get('uid','')

        gid = data.get('gid','')

        try:
            userobj = models.UserInfo.objects.get(id=uid)
        except userobj.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '用户不存在'
            return JsonResponse(ret)
        try:
            groupobj = Group.objects.get(id=gid)
        except groupobj.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '用户组不存在'
            return JsonResponse(ret)
        #将用户添加至用户组
        g = Group.objects.get(id=gid)
        u = models.UserInfo.objects.get(id=uid)
        #判断用户是否存在这个组里，如果存在则报错
        for i in list(g.user_set.all()):
            if i == u:
                ret['status'] = 1
                ret['errmsg'] = '用户已在这个组里面'
        else:
            #否则，添加用户到组里
            userobj.groups.add(groupobj)

        return JsonResponse(ret)

    @method_decorator(permission_required("accounts.view_userinfo",login_url="/dashboard/error/"))#为app名称点codename
    def get(self,request,*args,**kwargs):
        return super(user_list_view,self).get(request,*args,**kwargs)


class GroupListView(LoginRequiredMixin,ListView):
    """显示用户组信息"""
    model = Group
    template_name = "user/grouplist.html"


class GroupCreateView(LoginRequiredMixin,View):
    """创建用户组"""
    def post(self,request):

        ret = {'status':0}
        group_name = request.POST.get('name','')
        print(group_name)
        if not group_name:
            ret['status'] = 1
            ret['errmsg'] = '用户组不能为空'
        try:
            g = Group(name=group_name)
            g.save()
        except Exception as e:
            ret['status'] =1
            ret['errmsg'] = '组已存在'
        return JsonResponse(ret)


class ModifyUserGroupView(LoginRequiredMixin,View):
    """添加用户到指定线"""
    def get(self,request):
        groups = Group.objects.all()

        return JsonResponse(list(groups.values('id','name')),safe=False)




    # def put(self,request):
    #     ret = {'status':0}
    #     group_dd = Group.objects.all()
    #
    #     return JsonResponse(ret,{'group':group_dd})


class GroupDeleteView(LoginRequiredMixin,View):
    """删除组"""
    def delete(self,request):
        ret = {'status':0}
        data = QueryDict(request.body)
        pk = data.get('id')
        try:
            group_obj = Group.objects.get(id=pk)
            if len(group_obj.user_set.all())>0:
                ret['status'] = 1
                ret['errmsg'] = '删除组失败,组里有成员无法删除'
            else:
                group = Group.objects.filter(id=pk)
                group.delete()

        except Exception as e:
            pass

        return JsonResponse(ret)



class GroupselectView(LoginRequiredMixin,View):

    def get(self,request):
        """获取组的成员"""
        group_id = request.GET.get('gid')
        g = Group.objects.get(id=group_id)
        groupid = g.user_set.all()
        return render(request,'user/group_popple.html',locals())

    def delete(self,request):
        """删除组内成员"""
        ret= {'status':0}

        data = QueryDict(request.body)#通过前端获取用户ID与组ID
        gid = data.get('gid',None)
        uid = data.get('uid',None)

        try:
            user = models.UserInfo.objects.get(id=uid)
            group = Group.objects.get(id=gid)
            group.user_set.remove(user)#用户操作组，删除组内用户
        except models.UserInfo.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '用户不存在'
        except Group.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '组不存在'
        except Exception as e:
            ret['errmsg'] =  e.args

        return JsonResponse(ret)



