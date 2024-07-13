@echo off

:loop
ping -n 1 $IP > nul
if %errorlevel%==0 (
    echo Ping successful
) else (
    rasdial $CON_NAME $USER_NAME $PASS
    if errorlevel 1 (
        echo Failed to connect to VPN
    ) else (
        echo Connected to VPN
    )
)

timeout /t 3 > nul
goto loop