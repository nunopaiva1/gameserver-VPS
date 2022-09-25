# gameserver-VPS
Server.pro - Gameserver to VPS files transfer

## How to use:
1. Run the following command on the newly created VPS' Shell:
> `wget -qO - https://raw.githubusercontent.com/nunopaiva1/gameserver-VPS/master/gsVPS-transfer.sh | bash `
2. Create new service on VPS with the same type and version
3. GGs

## Notes:
* New services created on Server.pro are now named as it follows: **minecraft-1, minecraft-2, terraria-1, etc...** So when entering the name of the service, to simplify the process (while running this script), **name it after the service type** (minecraft, terraria...) with a -1 in front of it. 
* This way, when creating a new service through the panel, the system will automatically assume the uploaded files.
