# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myadmin', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mybloguser',
            name='nickname',
            field=models.CharField(max_length=50, null=True, verbose_name='\u6635\u79f0'),
        ),
    ]
