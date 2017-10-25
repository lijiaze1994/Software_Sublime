#!/bin/bash
#
# 这个脚本是用来安装 Sublime 的
#

if [[ $UID -ne 0 ]]; then
    echo -e "\n请使用 root 权限执行此脚本，也可以通过 sudo $0 来执行\n"
    exit
fi

if [[ -d /opt/sublime_text ]]; then
    echo -e "\nError  /opt/sublime_text alreay exist\n"
    exit
fi

tar xjvf sublime_text_3_build_3143_x64.tar.bz2 -C /opt

if [[ ! -d /opt/sublime_text_3 ]]; then
    echo -e "Error:  Not found /opt/sublime_text_3"
    exit
fi

mv /opt/sublime_text_3 /opt/sublime_text

cp -rf  subl /usr/local/bin

cp -rf sublime_text.desktop /usr/share/applications/

if [[ ! -d /usr/share/fonts/Roboto_Mono ]]; then
    unzip Roboto_Mono.zip -d /usr/share/fonts/Roboto_Mono
fi
