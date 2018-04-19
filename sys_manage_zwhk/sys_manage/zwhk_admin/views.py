from django.shortcuts import render
from django.views.generic import View, ListView
# Create your views here.


class BaseMixin(object):

	def get_context_data(self, **kwargs):
		context = super(self, BaseMixin).get_context_data(**kwargs)