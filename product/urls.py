
from django.conf.urls import url,include
from django.contrib import admin
from django.views.generic import RedirectView
from product import views


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^idc/list/$', views.IdcListView.as_view(),name='idc_list'),
    url(r'^add/idc/$', views.AddIdcView.as_view(),name='add_idc'),
    url(r'^update/idc/$', views.updateView.as_view(),name='update_idc'),



]