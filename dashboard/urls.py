
from django.conf.urls import url,include
from django.contrib import admin
from dashboard import views

urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    url(r'^index/', views.index),
    #url(r'^error/(?P<next>[\s\S]*)/(?P<msg>[\s\S\\u4e00-\\u9fa5]*)/$', views.ErrorView.as_view(),name='error'),
    url(r'^error/$', views.ErrorView.as_view(),name='error'),
]
