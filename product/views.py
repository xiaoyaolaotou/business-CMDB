from django.shortcuts import render,redirect,reverse
from django.views.generic import View,TemplateView,ListView
from django.http import QueryDict,HttpResponse,JsonResponse,HttpResponseRedirect
from product import models
from .forms import CreateIdcForm
from django.db.models import Q
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required,permission_required
from django.contrib.auth.mixins import LoginRequiredMixin,PermissionRequiredMixin

# class IdcListView(ListView):
#     """业务线IDC列表展示"""
#     template_name = 'idc_list.html'
#     model = models.Idc
#     ordering = '-id'
#     paginate_by = 10
#
#
#     def get_queryset(self):
#         """查询IP地址与业务用途"""
#         queryset = super(IdcListView,self).get_queryset()
#         search = self.request.GET.get('search')
#         print(search)
#         if search:
#             """模糊匹配"""
#             queryset = queryset.filter(Q(virIP__icontains=search) | Q(application__icontains=search))
#         return queryset

class IdcListView(LoginRequiredMixin,View):
    """展示业务系统模板"""
    """处理业务搜索"""
    def get(self,request,*args,**kwargs):
        object_list = models.Idc.objects.all().order_by('-id')#获取所有数据对象
        search = request.GET.get('search','') #处理搜索
        if search:
            object_list = object_list.filter(Q(virIP__icontains=search) | Q(application__icontains=search))

        """处理分页"""
        try:
            page_num = request.GET.get('page',1)#获取URL上第几页
            print(page_num)
        except:
            page_num = 1 #如果出错默认page等一1


        paginator = Paginator(object_list,10) #每页显示多少条
        page_obj = paginator.page(page_num)
        object_list = page_obj.object_list #当前页面的所有对象列表

        return render(request,'idc_list.html',{'object_list':object_list,'page_obj':page_obj})


class AddIdcView(LoginRequiredMixin,View):
    """添加业务系统"""

    @method_decorator(permission_required("product.add_bussiness", login_url="/dashboard/error/"))  # 为app名称点codename
    def get(self,request,*args,**kwargs):
        # nid = request.GET.get('id')
        # updateid = models.Idc.objects.filter(id=nid).first()
        # print(updateid)
        obj = CreateIdcForm()

        return  render(request, 'add_idc.html', {'obj':obj})

    def post(self,request):
        """添加业务线"""
        ret = {'status':0}
        obj = CreateIdcForm(request.POST)
        if obj.is_valid():
            virIP = obj.cleaned_data.get('virIP')

            physicalIP = obj.cleaned_data.get('physicalIP')
            application = obj.cleaned_data.get('application')
            port = obj.cleaned_data.get('port')
            print(port)
            component = obj.cleaned_data.get('component')
            principal = obj.cleaned_data.get('principal')
            note = obj.cleaned_data.get('note')
            Bussiness_idc = obj.cleaned_data.get('Bussiness_idc')
            fuzai = obj.cleaned_data.get('fuzai')

            yewu = models.Idc.objects.create(
                virIP=virIP,
                physicalIP=physicalIP,
                application=application,
                port=port,
                component=component,
                principal=principal,
                note=note,
                lalancing_choices=fuzai,
                Bussiness_idc_id=Bussiness_idc
            )
            if yewu:
                return HttpResponseRedirect(reverse('idc_list'))


        else:
            # print(obj.errors.as_json())
            # print(obj.errors['virIP'][0])
            return render(request, 'add_idc.html', {'obj': obj})
        obj = CreateIdcForm()
        return render(request,'add_idc.html',{'obj':obj})


    def delete(self,request):
        """删除业务线"""
        ret = {'status':0}
        data = QueryDict(request.body).get('dataid')
        print(data)

        try:
            models.Idc.objects.filter(id=int(data)).delete()
        except Exception as e:
            ret['status'] = 1
            ret['errmsg'] = '删除用户不存在'

        return JsonResponse(ret)


    """
    def put(self,request,*args,**kwargs):
        

        nid = request.GET.get('id')
        updateid = models.Idc.objects.filter(id=nid).first()
        print(updateid)
        obj = CreateIdcForm(initial={'virIP':updateid.virIP})
        return render(request, 'add_idc.html', {'obj': obj})
      
        if obj.is_valid():
            print(obj.cleaned_data)
            virIP = obj.cleaned_data.get('virIP')
            physicalIP = obj.cleaned_data.get('physicalIP')
            application = obj.cleaned_data.get('application')
            port = obj.cleaned_data.get('port')
            component = obj.cleaned_data.get('component')
            principal = obj.cleaned_data.get('principal')
            note = obj.cleaned_data.get('note')
            Bussiness_idc = obj.cleaned_data.get('Bussiness_idc')
            fuzai = obj.cleaned_data.get('fuzai')

            models.Idc.objects.filter(id=number).update(
                virIP=virIP,
                physicalIP=physicalIP,
                application=application,
                port=port,
                component=component,
                principal=principal,
                note=note,
                lalancing_choices=fuzai,
                Bussiness_idc_id=Bussiness_idc
            )
        else:

            return render(request, 'add_idc.html', {'obj': obj})
       
        # obj = CreateIdcForm()
        # return render(request, 'add_idc.html', {'obj': obj})
    """


class updateView(LoginRequiredMixin,View):
    """更新业务线"""
    def get(self,request,*args,**kwargs):
        """获取历史数据展示到相应的框中"""
        nid = request.GET.get('id',"")#获取URL上的ID
        updateid = models.Idc.objects.filter(id=nid).first()
        obj = CreateIdcForm(initial={'virIP':updateid.virIP,'physicalIP':updateid.physicalIP,
                                     'application':updateid.application,
                                     'port':updateid.port,
                                     'component':updateid.component,
                                     'Bussiness_idc':updateid.Bussiness_idc_id,
                                     'fuzai':updateid.lalancing_choices,
                                     'principal':updateid.principal,
                                     'note':updateid.note
                                     })
        return render(request,'update_idc.html',{'obj':obj})

    def post(self,request):
        """更新业务数据"""
        nid = request.GET.get('id', "")
        print(nid)
        obj = CreateIdcForm(request.POST)
        if obj.is_valid():
            #校验成功
            virIP = obj.cleaned_data.get('virIP')
            physicalIP = obj.cleaned_data.get('physicalIP')
            application = obj.cleaned_data.get('application')
            port = obj.cleaned_data.get('port')
            component = obj.cleaned_data.get('component')
            principal = obj.cleaned_data.get('principal')
            note = obj.cleaned_data.get('note')
            Bussiness_idc = obj.cleaned_data.get('Bussiness_idc')
            fuzai = obj.cleaned_data.get('fuzai')
            try:
                update = models.Idc.objects.filter(id=int(nid)).update(
                    virIP=virIP,
                    physicalIP=physicalIP,
                    application=application,
                    port=port,
                    component=component,
                    principal=principal,
                    note=note,
                    lalancing_choices=fuzai,
                    Bussiness_idc_id=Bussiness_idc
                )
                if update:
                    return HttpResponseRedirect(reverse('idc_list'))
            except Exception as e:
                return HttpResponseRedirect(reverse('update_list'))


        else:

            return render(request, 'add_idc.html', {'obj': obj})
        obj = CreateIdcForm()
        return render(request, 'add_idc.html', {'obj': obj})










