
from django.conf.urls import url,include
from django.contrib import admin
from django.views.generic import RedirectView

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    # url(r'^$', RedirectView.as_view(url="/accounts/")),
    url(r'^dashboard/', include('dashboard.urls')),
    url(r'^accounts/', include('accounts.urls')),
    url(r'^product/', include('product.urls')),
    url(r'^error/', include('product.urls')),
    url(r'^$', include('accounts.urls')),
]