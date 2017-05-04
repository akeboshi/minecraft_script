#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/minecraft.conf
cd ${MINECRAFT_HOME}
i=60
while [ ${i} -ne 0 ]
do
    if test `expr ${i} % 30` -eq 0 -o ${i} -le 10
    then
        screen -S ${SCREEN_NAME} -p 0 -X eval 'stuff "say Server will restart in '${i}' seconds.\n"'
    fi
    i=`expr ${i} - 1`
    sleep 1
done
screen -S ${SCREEN_NAME} -p 0 -X eval 'stuff "stop\n"'
sleep 10
$SCRIPT_DIR/backup.sh
sleep 10
screen -S ${SCREEN_NAME} -X screen -X java -Xms$MIN_MEM -Xmx$MAX_MEM -jar minecraft_server.jar nogui
