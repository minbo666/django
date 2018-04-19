# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.auth.models
import django.utils.timezone
from django.conf import settings
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
        ('auth', '0006_require_contenttypes_0002'),
    ]

    operations = [
        migrations.CreateModel(
            name='Zwhk_User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(null=True, verbose_name='last login', blank=True)),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, max_length=30, validators=[django.core.validators.RegexValidator('^[\\w.@+-]+$', 'Enter a valid username. This value may contain only letters, numbers and @/./+/-/_ characters.', 'invalid')], help_text='Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.', unique=True, verbose_name='username')),
                ('first_name', models.CharField(max_length=30, verbose_name='first name', blank=True)),
                ('last_name', models.CharField(max_length=30, verbose_name='last name', blank=True)),
                ('email', models.EmailField(max_length=254, verbose_name='email address', blank=True)),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('nickname', models.CharField(max_length=50, null=True, verbose_name='\u6635\u79f0', blank=True)),
                ('img', models.CharField(default=b'/static/dist/img/default.png', max_length=200, verbose_name='\u5934\u50cf\u5730\u5740')),
                ('notes', models.CharField(max_length=200, null=True, verbose_name='\u5907\u6ce8', blank=True)),
                ('experience', models.CharField(max_length=500, null=True, verbose_name='\u7ecf\u5386', blank=True)),
                ('location', models.CharField(max_length=20, null=True, verbose_name='\u5730\u5740', blank=True)),
                ('skills', models.CharField(max_length=500, verbose_name='\u6280\u80fd\u540d\u79f0')),
                ('groups', models.ManyToManyField(related_query_name='user', related_name='user_set', to='auth.Group', blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(related_query_name='user', related_name='user_set', to='auth.Permission', blank=True, help_text='Specific permissions for this user.', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('acti_name', models.CharField(max_length=50, verbose_name='\u6d3b\u52a8\u540d\u79f0')),
                ('acti_time', models.DateTimeField(verbose_name='\u6d3b\u52a8\u65f6\u95f4')),
                ('acti_owner', models.ForeignKey(related_name='acti', verbose_name='\u6240\u5c5e\u8005', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Task_Process',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('task_name', models.CharField(max_length=50, verbose_name='\u4efb\u52a1\u540d\u79f0')),
                ('task_speed', models.IntegerField(default=0, null=True, verbose_name='\u4efb\u52a1\u8fdb\u5ea6')),
                ('task_owner', models.ForeignKey(related_name='task', verbose_name='\u6240\u5c5e\u8005', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
