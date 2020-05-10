#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m'
WORKING_DIR=$(echo $(pwd))
YOUTUBE_FOLDER="$WORKING_DIR/storage/shared/Youtube-DL"
YDL_CONFIG_DIR="$WORKING_DIR/.config/youtube-dl"
YDL_CONFIG_FILE="$WORKING_DIR/.config/youtube-dl/config"
#CONFIG_FILE_DATA="--no-mtime\n-o /data/data/com.termux/files/home/storage/shared/Youtube-DL/%(title)s.%(ext)s" \n not working
BIN_FOLDER="$WORKING_DIR/bin"
URL_OPENER="$WORKING_DIR/bin/termux-url-opener"


echo "Hi, This script setup an environment to download various videos from various apps"
sleep 1
echo ""
echo ""
echo -e "${BLUE}Requirements :"
echo -e "${NC}	1. Allow storage access to Termux"
echo -e "${NC}	2. A working internet connection."
echo ""
echo ""
read -p "  When you are ready just press enter:" j


termux-setup-storage
sleep 2
apt-get -y update
apt-get -y upgrade
apt autoremove
apt-get -y install python
pip install youtube-dl


mkdir $YOUTUBE_FOLDER
mkdir -p $YDL_CONFIG_DIR

touch $YDL_CONFIG_FILE
echo -e "--no-mtime\n-o /data/data/com.termux/files/home/storage/shared/Youtube-DL/%(title)s.%(ext)s" >> $YDL_CONFIG_FILE

mkdir $BIN_FOLDER
touch $URL_OPENER
echo "#!/bin/bash" > $URL_OPENER
echo -e "clear\n" >> $URL_OPENER
echo "if [[ \$1 =~ ^.*youtu.*\$ ]] || [[ \$1 =~ ^.*youtube.*\$ ]]; then" >> $URL_OPENER
echo 'echo -e "youtube-dl\\n>${1}\\n"' >> $URL_OPENER
echo "youtube-dl \$1" >> $URL_OPENER
echo "elif [[ \$1 =~ ^.*nourlselected.*$ ]]; then" >> $URL_OPENER
echo "echo \"ERROR1\"" >> $URL_OPENER
echo "else youtube-dl --ignore-config -o \"/data/data/com.termux/files/home/storage/shared/Youtube-DL/%(title)s.%(ext)s\" \$1" >> $URL_OPENER
echo "fi" >> $URL_OPENER
echo "read -p \"Press enter to continue\"" >> $URL_OPENER

echo -e "${BLUE}Congratulations!!! Your setup is complete."
echo ""
echo ""
read -p "When you are ready just press enter" k
