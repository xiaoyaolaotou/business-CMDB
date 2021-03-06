# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-06-11 03:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0003_auto_20180611_0945'),
    ]

    operations = [
        migrations.AlterField(
            model_name='idc',
            name='physicalIP',
            field=models.GenericIPAddressField(null=True, protocol='IPV4', verbose_name='对应物理IP'),
        ),
        migrations.AlterField(
            model_name='idc',
            name='virIP',
            field=models.GenericIPAddressField(db_index=True, protocol='IPV4', verbose_name='虚拟IP'),
        ),
    ]
