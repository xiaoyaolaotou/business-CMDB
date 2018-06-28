from django.db import models


class Bussiness(models.Model):
    """业务线"""

    name = models.CharField(max_length=32,null=True)

    def __str__(self):
        return self.name


class Idc(models.Model):
    """业务详细信息列表"""


    virIP       = models.GenericIPAddressField(verbose_name='虚拟IP',db_index=True,protocol='IPV4')
    physicalIP  = models.GenericIPAddressField(verbose_name='对应物理IP',null=True,protocol='IPV4')
    application = models.CharField(verbose_name='应用名称',max_length=200,db_index=True)
    port        = models.IntegerField(verbose_name='应用端口',max_length=100,null=True)
    component   = models.CharField(verbose_name='组件用途',max_length=100)
    principal   = models.CharField(verbose_name='开发负责人',max_length=32)
    ctime       = models.DateTimeField(verbose_name="创建时间",auto_now_add=True)
    uptime       = models.DateTimeField(verbose_name="更新时间",auto_now=True)
    note        = models.CharField(verbose_name='备注',max_length=100,null=True)
    Bussiness_idc = models.ForeignKey(verbose_name='关联业务线',to='Bussiness',to_field='id')


    type_Lalancing = (
        (1,'无'),
        (2,'有')
    )
    lalancing_choices = models.IntegerField(choices=type_Lalancing,null=True)

    """是否有负载均衡"""
    def __str__(self):
        return self.lalancing_choices


