@echo off
set projectName=Senparc.Weixin.MP.csproj
:start
set op=clear_pack_push
set /p op=�������������pack��push��delete��clear��ֱ�ӻس������������
if "%op%"=="pack" (
..\nuget.exe pack "%projectName%" -Build -Properties Configuration=Release
goto start)
if "%op%"=="push" (
..\nuget.exe push *.nupkg  -Source http://nuget.xiaobao100.cn/nuget/xiaobao
goto start)

if "%op%"=="delete" (
set /p id=����������ƣ�
set /p version=������汾�ţ�
..\nuget.exe delete "%id%" "%version%"  -Source http://nuget.xiaobao100.cn/nuget/xiaobao
goto start)

if "%op%"=="clear" (
del /s *.nupkg
goto start)

if "%op%"=="clear_pack_push" (
del /s *.nupkg
..\nuget.exe pack "%projectName%" -Build -Properties Configuration=Release
..\nuget.exe push *.nupkg  -Source http://nuget.xiaobao100.cn/nuget/xiaobao
goto start)

echo ����������Ч
goto start
pause