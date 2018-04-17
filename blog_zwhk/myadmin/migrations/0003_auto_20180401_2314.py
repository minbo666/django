# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0002_auto_20180331_1428'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mybloguser',
            name='desc',
            field=models.CharField(max_length=200, null=True, verbose_name='\u5907\u6ce8', blank=True),
        ),
        migrations.AlterField(
            model_name='mybloguser',
            name='nickname',
            field=models.CharField(max_length=50, null=True, verbose_name='\u6635\u79f0', blank=True),
        ),
    ]
