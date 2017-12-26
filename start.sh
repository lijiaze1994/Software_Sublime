#!/bin/bash
#
# Sublime Install and config
#
# Author：Bro Qiang<broqiang@qq.com>
# Date：2017-10-29

# Install
sudo  ./install.sh

# Config

echo -e "Whether you need to configure the plug-in ?"
read -p "Please input [yes/no] : " yn

if [[ "$yn" == "yes" || "$yn" == "y" ]]; then
    ./config.sh
fi

