from django.shortcuts import render
from django.http import HttpResponse
import os
# Create your views here.

def upload_img(request):
	if request.method == 'POST':
		myFile = request.FILES.get("file", 'file')
		print myFile.name
		if not myFile:
			return HttpResponse("no files for upload!")
		with open(os.path.join('/home/minbo/python/images/',myFile.name), 'wb+') as destination:
			for chunk in myFile.chunks():
				destination.write(chunk)
			return HttpResponse("ok")
	else:
		return HttpResponse("filed")