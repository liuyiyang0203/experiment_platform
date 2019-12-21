from django.shortcuts import render,redirect
from django.http import HttpResponse, HttpResponseRedirect
from .models import Comment, Response
from experimentapp.models import Post
import time
from django.contrib.auth.decorators import login_required
# Create your views here.


@login_required
def comment(request):
    a = Post.objects.filter().order_by('-id')
    all = Comment.objects.all().order_by('-time')
    if request.method == 'POST':
        name = request.POST.get('name', None)
        text = request.POST.get('text', None)
        if name == '':
            error_msg = '请填写名字,名字不能为空！'
        elif text == '':
            error_msg = '请填写评论，评论不能为空！'
        else:
            a = Comment.objects.create(comment=text, author=name)
            a.save()
            all = Comment.objects.all().order_by('-time')
            return render(request, 'comment/comment.html', {'all': all, 'views': a[0].views})
        return render(request, 'comment/comment.html', {'all': all, 'error_msg': error_msg, 'views': a[0].views})
    return render(request, 'comment/comment.html', {'all': all, 'views': a[0].views})


@login_required
def response(request):
    if request.method == 'POST':
        text = request.POST.get('text', None)
        name = request.POST.get('name', None)
        if name == '':
            error_msg = '请填写名字,名字不能为空！'
        elif text == '':
            error_msg = '请填写回复，回复不能为空！'
        else:
            a = Response.objects.create(response=text, reviewers=name)
            a.save()
            all = Comment.objects.all().order_by('-time')
            b = Response.objects.get(response=text, reviewers=name)
            return HttpResponseRedirect('/comment', {'all': all, 'b': b})
        return render(request, 'comment/response.html', {'error_msg': error_msg})
    return render(request, 'comment/response.html')
