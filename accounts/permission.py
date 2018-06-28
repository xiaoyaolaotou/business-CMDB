from django.views.generic import ListView,View
from django.contrib.auth.models import Permission,ContentType,Group
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render,redirect,reverse
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect,QueryDict


class PermissionListView(LoginRequiredMixin,ListView):
    model = Permission
    template_name = 'user/permission_list.html'
    paginate_by = 8



class PermissionCreateView(View):
    """添加权限"""
    def get(self,request):
        contenttypes = ContentType.objects.all()
        return render(request,'user/add_permission.html',{'contenttypes':contenttypes})

    def post(self,request):
        ret = {'status':0}
        print(request.POST)
        content_type = request.POST.get('content_type')
        codename = request.POST.get('codename')
        name = request.POST.get('name')
        print(content_type,codename,name)
        try:
            content_type = ContentType.objects.get(id=content_type)
        except ContentType.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '模型不存在'
        if not codename or codename.find(" ")>=0:
            ret['status'] = 1
            ret['errmsg'] = 'codename不合法,不能包含空格'

        try:
            Permission.objects.create(codename=codename,
                                      content_type=content_type,
                                      name=name)
        except Exception as e:
            ret['status'] = 1
            ret['errmsg'] = "添加失败"
        return JsonResponse(ret)


class GroupPermissionModify(View):
    """修改权限"""
    def get(self,request):
        contenttypes = ContentType.objects.all()
        group = request.GET.get('gid')
        group_obj = Group.objects.get(id=group)
        group_permissions = [p.id for p in group_obj.permissions.all()]

        return render(request,'user/modify_group_permissions.html',locals())

    def post(self,request):
        print(request.POST)
        permission_id_list = request.POST.getlist('permission')
        groupid = request.POST.get('groupid')
        try:
            group_obj = Group.objects.get(id=groupid)
        except Group.DoesNotExist:
            pass

        if len(permission_id_list) > 0:
            permission_obj = Permission.objects.filter(id__in=permission_id_list)
            group_obj.permissions.set(permission_obj)
            return HttpResponse('修改成功')

        else:
            group_obj.permissions.clear()
            return HttpResponse('修改成功')
        return HttpResponse('')


