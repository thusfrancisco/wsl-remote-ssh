Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\WINDOWS\System32\bash.exe" -PropertyType String -Force


Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'

Get-Service -Name *ssh*

netstat -nao | find /i '":22"'
