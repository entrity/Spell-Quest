for /f "tokens=1,2 delims=:" %%a in ("%~dp0") do (
	set driveUpperCase=%%a
	set windir=%%b
)

set fwddir=%windir:\=/%
for /f %%i in ('powershell.exe "Write-Host \"%driveUpperCase%\".ToLower()"') do set driveLowerCase=%%i
set linuxScriptPath=/mnt/%driveLowerCase%%fwddir%start.sh

Ubuntu run bash "%linuxScriptPath% %1"
