
## How to deploy to workshop from github

```bash
# [Install steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD) on your machine
sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update
sudo apt install steamcmd

# login to steam and get `STEAM_CONFIG_VDF`
STEAM_USERNAME=<username>
STEAM_PASSWORD=<password>
steamcmd +login $STEAM_USERNAME $STEAM_PASSWORD +quit
# manual step: type Steam Guard received by email

cat ~/Steam/config/config.vdf | base64 > config_base64_private.txt
# manual step: copy content of config_base64_private.txt to `STEAM_CONFIG_VDF` secret on github

# once per workshop item: create the item in workshop
./create_workshop_item.sh $STEAM_USERNAME > published_file_id.txt

# manual step: copy content of published_file_id.txt to `STEAM_PUBLISHED_FILE_ID` secret on github
```

Once the above is completed, github pipeline will deploy it to workshop.
