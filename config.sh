#!/bin/bash
#
# 此脚本用来设置插件及配置
#

if [[ -d ~/.config/sublime-text-3 ]]; then
    echo -e "Error: Is not configured!  ~/.config/sublime-text-3 : Sublime config file already exeist"
    exit
fi

if [[ ! -d sublime-text-3 ]]; then
    echo -e "Error  sublime-text-3 dirictory not found"
    exit
fi

cp -rf sublime-text-3  ~/.config/

if [[ "$?" == 0 ]]; then
    echo -e "\033[32;1mInstall packages success!\033[0m\n"
else
    echo -e "\033[31;1mInstall packages faild!\033[0m\n"
fi

