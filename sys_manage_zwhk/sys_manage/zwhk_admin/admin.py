from django.contrib import admin
from zwhk_admin.models import Zwhk_User
from django.contrib.auth.models import Group
# Register your models here.
class Zwhk_User_Admin(admin.ModelAdmin):
    list_display = ['username', 'nickname', 'email', 'img','notes','experience','location','skills']
    search_fields = ['username']

admin.site.unregister(Group)
admin.site.register(Zwhk_User,Zwhk_User_Admin)

