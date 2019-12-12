from django.contrib import auth
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import logout
from django.contrib.auth import login as auth_login
from .models import RUser
from django.contrib.auth.decorators import login_required
import os
# Create your views here.
from django.views.decorators.csrf import csrf_exempt


def index(request):
    error_msg = ''
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return HttpResponseRedirect('/purpose')
        else:
            error_msg = '用户名密码错误'
            return render(request, 'experimentapp/index.html',{'error_msg': error_msg})
    return render(request, 'experimentapp/index.html')


def register(request):
    error_msg = ''
    if request.method == 'POST':
        username = request.POST.get('username', None)
        password = request.POST.get('password', None)
        a = RUser.objects.filter(username=username)
        if username == '':
            error_msg = '用户名不能为空'
        elif password == '':
            error_msg = '密码不能为空'
        else:
            if a.count() == 0:
                b = RUser.objects.create_user(username=username, password=password, email='1@1.com')
                b.save()
                error_msg = '注册成功，请点击右上角返回首页'
                return render(request, 'experimentapp/register.html', {'error_msg': error_msg})
            else:
                error_msg = '用户名已存在，请重新注册'
                return render(request, 'experimentapp/register.html', {'error_msg': error_msg})
        return render(request, 'experimentapp/register.html', {'error_msg': error_msg})
    return render(request, 'experimentapp/register.html')


@login_required
def purpose(request):
    return render(request, 'experimentapp/purpose.html')


@login_required
def content(request):
    return render(request, 'experimentapp/content.html')


@login_required
def step(request):
    global error_msg1
    if request.method == 'POST':
        peijian1 = request.POST.get('peijian1', None)
        peijian2 = request.POST.get('peijian2', None)
        peijian3 = request.POST.get('peijian3', None)
        peijian4 = request.POST.get('peijian4', None)
        peijian5 = request.POST.get('peijian5', None)
        peijian6 = request.POST.get('peijian6', None)
        peijian7 = request.POST.get('peijian7', None)
        if (peijian1 is not None) and (peijian2 is not None) and (peijian3 is None) and (peijian4 is not None) and (
                peijian5 is not None) and (peijian6 is not None) and (peijian7 is not None):
            error_msg1 = '恭喜你，第一题选择正确！'
        else:
            error_msg1 = '对不起，第一题选择错误，正确选项为传声器、噪声仪主机、5号电池、螺丝刀、防风罩、三脚架底座。'
        # return render(request, 'experimentapp/result1.html')
        return HttpResponseRedirect('/result1')
    return render(request, 'experimentapp/step.html')


@login_required
def result1(request):
    global error_msg2
    if request.method == 'POST':
        shifou = request.POST.get('shifou', None)
        if (shifou is not None) and (int(shifou) == 1):
            error_msg2 = '恭喜你，第二题选择正确！'
        else:
            error_msg2 = '对不起，第二题选择错误，应该装置电池，开机后检验电池电压。'
        return HttpResponseRedirect('/result2')
    return render(request, 'experimentapp/result1.html')


@login_required
def result2(request):
    global error_msg3
    if request.method == 'POST':
        charge = request.POST.get('charge', None)
        if (charge is not None) and (int(charge) == 1):
            error_msg3 = '恭喜你，第三题选择正确！'
        else:
            error_msg3 = '对不起，第三题选择错误，此时需要更换电池。'
        return HttpResponseRedirect('/result3')
    return render(request, 'experimentapp/result2.html')


@login_required
def result3(request):
    global error_msg4
    if request.method == 'POST':
        jiajian = request.POST.get('jiajian', None)
        if (jiajian is not None) and (float(jiajian) == 98.3):
            error_msg4 = '恭喜你，第四题选择正确！'
        else:
            error_msg4 = '对不起，第四题选择错误，应该校准到98.3dB。'
        return HttpResponseRedirect('/result4')
    return render(request, 'experimentapp/result3.html')


@login_required
def result4(request):
    global error_msg5
    if request.method == 'POST':
        liangcheng1 = request.POST.get('liangcheng1', None)
        liangcheng2 = request.POST.get('liangcheng2', None)
        liangcheng3 = request.POST.get('liangcheng3', None)
        liangcheng4 = request.POST.get('liangcheng4', None)
        liangcheng5 = request.POST.get('liangcheng5', None)
        liangcheng6 = request.POST.get('liangcheng6', None)
        if (liangcheng1 is None) and (liangcheng2 is not None) and (liangcheng3 is not None) and (
                liangcheng4 is None) and (liangcheng5 is None) and (liangcheng6 is not None):
            error_msg5 = '恭喜你，第五题选择正确！'
        else:
            error_msg5 = '对不起，第五题选择错误，噪声仪的测定量程应为M，时间计权应为Fast，滤波器类型不选。'
        return HttpResponseRedirect('/result5')
    return render(request, 'experimentapp/result4.html')


@login_required
def result5(request):
    if request.method == 'POST':
        return HttpResponseRedirect('/step')
    return render(request, 'experimentapp/result5.html', {'error_msg1': error_msg1, 'error_msg2': error_msg2, 'error_msg3': error_msg3, 'error_msg4': error_msg4, 'error_msg5': error_msg5})


@login_required
def experiment(request):
    if request.method == 'POST':
        # os.system(r'"D://python//experiment_platform//factory.exe"')
        os.system(r'"/home/experiment_platform/factory1.exe"')
        return render(request, 'experimentapp/experiment.html')
    return render(request, 'experimentapp/experiment.html')


@csrf_exempt
def user_logout(request):
    if request.user.is_authenticated:
        logout(request)
        return HttpResponseRedirect('/index')
    else:
        return HttpResponseRedirect('/index')


def docx(request):
    # os.system(r'"D://python//experiment_platform//实验报告.docx"')
    os.system(r'"/home/experiment_platform/实验报告.docx"')
    return HttpResponseRedirect('/experiment')