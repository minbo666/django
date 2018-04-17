#--*coding:utf-8*--
from django import forms
from myadmin.models import MyBlogUser

class UserCreationForm(forms.ModelForm):


	error_messages = {
		'duplicate_username': u"此用户已存在.",
		'password_mismatch': u"两次密码不相等.",
		'duplicate_email': u'此邮箱已经存在.'
	}

	username = forms.RegexField(
		max_length=30,
		regex=r'^[\w.@+-]+$',
		error_messages={
			'invalid':  u"该值只能包含字母、数字和字符@/./+/-/_",
			'required': u"用户名未填"
		}
	)

	email = forms.EmailField(
		error_messages={
			'invalid':  u"邮箱格式错误",
			'required': u'邮箱未填'
		}
	)

	nickname = forms.CharField(
		max_length=50,
		required=False,
	)

	desc = forms.CharField(
		max_length=200,
		required=False,
	)

	password1 = forms.CharField(
		widget=forms.PasswordInput,
		error_messages={
			'required': u"密码未填"
		}
	)
	password2 = forms.CharField(
		widget=forms.PasswordInput,
		error_messages={
			'required': u"确认密码未填"
		}
	)

	class Meta:
		model = MyBlogUser
		fields = ("username", "nickname","email","desc")

	def clean_username(self):
		username = self.cleaned_data["username"]
		try:
			MyBlogUser._default_manager.get(username=username)
		except MyBlogUser.DoesNotExist:
			return username
		raise forms.ValidationError(
		self.error_messages["duplicate_username"]
	)

	def clean_password2(self):
		password1 = self.cleaned_data.get("password1")
		password2 = self.cleaned_data.get("password2")
		if password1 and password2 and password1 != password2:
			raise forms.ValidationError(
				self.error_messages["password_mismatch"]
			)
		return password2

	def clean_email(self):
		email = self.cleaned_data["email"]
		try:
			MyBlogUser._default_manager.get(email=email)
		except MyBlogUser.DoesNotExist:
			return email
		raise forms.ValidationError(
			self.error_messages["duplicate_email"]
		)

	def save(self, commit=True):
		user = super(UserCreationForm, self).save(commit=False)
		user.set_password(self.cleaned_data["password1"])
		if commit:
			user.save()
		return user

