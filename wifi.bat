cd "%USERPROFILE%\\Desktop" & for /f "tokens=2 delims=:"  %a in ('netsh wlan show profile ^| findstr "Profile"') do echo %a>>a
for /f "tokens=1 delims= "  %a in (a) do echo %a>>b
del a & for /f "tokens=*"  %a in (b) do (echo %a:>>log & netsh wlan show profiles "%a"  key=clear|findstr "Key Content">>log)
del b & notepad log & timeout 3 & del log & exit
