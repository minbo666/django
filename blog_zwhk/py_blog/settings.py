# -*- coding:UTF-8 -*-

import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SECRET_KEY = 'c_&4z(91kj01n5c_y(3c@qm!5tyi5-xag%n3ssjosfcx+=pylc'

DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = (
    'suit',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # 'ckeditor',  
    # 'ckeditor_uploader',
    'simditor',
    'myblog',
    'comments',
    'myadmin',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
)

ROOT_URLCONF = 'py_blog.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'py_blog.wsgi.application'

#使用自己的user模型
AUTH_USER_MODEL = "myadmin.MyBlogUser"

# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases

#使用mysql数据库
import pymysql
pymysql.install_as_MySQLdb()

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'pyblog',
        'UESR':'root',
        'PASSWORD':'minbo888',
        'HOST':'127.0.0.1',
        'PORT':'3306'
    }
}


# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'

USE_I18N = True

USE_L10N = True

USE_TZ = False




STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, "static/")
#STATICFILES_DIRS = (
#    os.path.join(BASE_DIR,'static'),
#)

FILE_CHARSET='utf-8'
DEFAULT_CHARSET='utf-8'

# 我的系统配置

PAGE_NUM = 3
WEBSITE_TITLE = u'只为花开的博客'
WEBSITE_DESC = u'a python-django blog by zwhk'


# 后台管理bootstrap-suit模板

# DATETIME_FORMAT = 'Y-m-d H:i:s'
# DATE_FORMAT = 'Y-m-d'
SUIT_CONFIG = {
    'ADMIN_NAME': '只为花开的博客',
    'LIST_PER_PAGE': 20,
}



#simditor 配置
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media_cdn')
SIMDITOR_UPLOAD_PATH = 'uploads/'
SIMDITOR_IMAGE_BACKEND = 'pillow'

SIMDITOR_TOOLBAR = [
    'title', 
    'bold', 
    'italic', 
    'underline', 
    'strikethrough', 
    'fontScale',
    'color', 
    '|', 
    'ol', 
    'ul', 
    'blockquote', 
    'code', 
    'table', 
    '|', 
    'link',
    'image', 
    'hr', 
    '|', 
    'indent', 
    'outdent', 
    'alignment', 
    'fullscreen',
    'markdown', 
    'emoji'
]

SIMDITOR_CONFIGS = {
    'toolbar': SIMDITOR_TOOLBAR,
    'upload': {
        'url': '/admin/upload/',
        'fileKey': 'upload'
    },
    'emoji': {
        'imagePath': '/static/simditor/images/emoji/'
    }
}
