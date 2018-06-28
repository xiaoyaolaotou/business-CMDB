from django.db import models
from django.contrib.auth.models import AbstractUser


class UserInfo(AbstractUser):
    """用户表信息"""
    name   = models.CharField('中文名',max_length=32,null=True,blank=True)
    phone  = models.CharField('联系方式',max_length=32,null=True,blank=True)

    class Meta:
        permissions = (
            ('view_userinfo','访问用户列表'),
        )

