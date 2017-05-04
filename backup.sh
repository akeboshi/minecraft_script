#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/minecraft.conf
cd $MINECRAFT_HOME
if [ -e backup/latest4.tar.gz ]; then
  mv backup/latest4.tar.gz backup/latest5.tar.gz
fi
if [ -e backup/latest3.tar.gz ]; then
  mv backup/latest3.tar.gz backup/latest4.tar.gz
fi
if [ -e backup/latest2.tar.gz ]; then
  mv backup/latest2.tar.gz backup/latest3.tar.gz
fi
if [ -e backup/latest.tar.gz ]; then
  mv backup/latest.tar.gz backup/latest2.tar.gz
fi
tar -cvzf backup/latest.tar.gz world
