# Port forwarding
netsh interface portproxy add v4tov4 listenport=2000 listenaddress=0.0.0.0 connectport=2000 connectaddress=$($(wsl hostname -I).Trim());


New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd) for WSL' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 2000;

wsl --shutdown

#Inside WSL
# /etc/ssh/sshd_config
#   Port 2000

# /etc/wsl.conf
#   [boot]
#   systemd=true
#   [network]
#   generateResolvConf=false

# sudo systemctl enable ssh
# sudo systemctl restart ssh

# SSH using
# ssh WSL_USER@HOST_IP_ADDRESS
