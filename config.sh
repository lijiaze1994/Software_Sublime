#!/bin/bash
#
# 此脚本用来设置插件及配置
#

if [[ -d ~/.config/sublime-text-3 ]]; then
    echo -e "Error  ~/.config/sublime-text-3 : Sublime config file already exeist"
    exit
fi

if [[ ! -f sublime-text-3_config.tar.gz ]]; then
    echo -e "Error  sublime-text-3_config.tar.gz file not found"
    exit
fi

tar xzvf sublime-text-3_config.tar.gz -C ~/.config/
