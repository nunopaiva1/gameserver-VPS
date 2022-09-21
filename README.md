# gameserver-VPS
Server.pro - Gameserver to VPS files transfer

## How to use:

1. Enable SSH on VPS (check below for instructions on how to do this)
2. Make sure you're on the correct directory and run script -> ./gsVPS-transfer.sh
3. Enter all the FTP details
4. Create Service with the same name, type and version

### Enabling SSH

1. Access ssh config -> nano /etc/ssh/sshd_config
2. Uncomment the "Port 22" line (remove the #) 
3. Edit line "PermitRootLogin yes" & "PasswordAuthentication yes" and save
4. Run "systemctl enable ssh" && "systemctl restart ssh"

### Notes
* (Git not installed) From your shell, install Git using apt-get: $ sudo apt-get install git
* (Clone/Download repository) git clone https://github.com/nunopaiva1/gameserver-VPS.git
