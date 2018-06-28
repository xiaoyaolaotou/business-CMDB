
from django.conf.urls import url,include
#from django.contrib import admin
from accounts import views,permission
from django.views.generic import RedirectView

urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    url(r'^$', views.UseindexView.as_view(),name='user_index'),
    url(r'^login/$', views.UserLoginView.as_view(),name='user_login'),
    url(r'^logout/$', views.UserLogoutView.as_view(),name='user_logout'),
    url(r'^userlist/$', views.user_list_view.as_view(),name='user_list'),
    url(r'^group/$', views.GroupListView.as_view(),name='group_list'),
    url(r'^group/deleted/$', views.GroupDeleteView.as_view(),name='group_deleted'),
    url(r'^group/select/$', views.GroupselectView.as_view(),name='group_select'),
    url(r'^create/$', views.GroupCreateView.as_view(),name='group_create'),
    url(r'^user_add_group/$', views.ModifyUserGroupView.as_view(),name='user_modify_group'),
    url(r'^modify/user/status/$', views.ModifyUserStatusView.as_view(),name='user_modify_status'),
    #url(r'^create/user/$', views.CreateUserView.as_view(),name='create_user'),
    url(r'^create/user/$', views.CreateUserView.as_view(),name='create_user'),
    url(r'^delete/user/$', views.DeleteUserView.as_view(),name='delete_user'),
    url(r'^permission/list/$', permission.PermissionListView.as_view(),name='permission_list'),
    url(r'^permission/add/$', permission.PermissionCreateView.as_view(),name='permission_create'),
    url(r'^permission/modify/$', permission.GroupPermissionModify.as_view(),name='permission_modify'),

]
