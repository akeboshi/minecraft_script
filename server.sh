#!/bin/bash
# cd "${0%/*}"
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/minecraft.conf
cd $MINECRAFT_HOME

echo screen -AmdS $SCREEN_NAME java -Xms$MIN_MEM -Xmx$MAX_MEM -jar minecraft_server.jar nogui
screen -AmdS $SCREEN_NAME java -Xms$MIN_MEM -Xmx$MAX_MEM -jar minecraft_server.jar nogui

echo screen -S $SCREEN_NAME -X screen -X /bin/bash
screen -S $SCREEN_NAME -X screen -X /bin/bash
