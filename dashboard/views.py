from django.shortcuts import render
from django.views.generic import View

def index(request):
    return render(request,'index.html')


class ErrorView(View):

    def get(self,request):
        return render(request,'master/error.html')

