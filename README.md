# gameserver-VPS
Server.pro - Gameserver to VPS files transfer

## How to use:
1. Install git and clone repo: 
> `apt-get install git -y && git clone https://github.com/nunopaiva1/gameserver-VPS.git`
2. Make sure you're on the correct directory and run script:
> `cd gameserver-VPS/ && ./gsVPS-transfer.sh`
3. Enter all the FTP details
4. Create new service on VPS with the same type and version
5. GGs

## Notes:
* New services created on Server.pro are now named as it follows: **minecraft-1, minecraft-2, terraria-1, etc...** So when entering the name of the service, to simplify the process, **name it after the service type** (minecraft, terraria...) with a -1 in front of it. This way, when creating a new service through the panel, this will automatically assume the uploaded files.
