#!/bin/bash
#
# 这个脚本是用来删除 Sublime

if [[ $UID -ne 0 ]]; then
    echo -e "\n请使用 root 权限执行此脚本，也可以通过 sudo $0 来执行\n"
    exit
fi


until [[ "$yn" == "yes" || "$yn" == "y" ]]
do
    echo -e "Are you sure you want to delete the Sublime"
    echo -e "If it is determined Please enter yes, cancel input no"
    echo -e "If select yes,The following files and directories will be deleted:\n"
    echo -e "/opt/sublime_text"
    echo -e "/usr/local/bin/subl"
    echo -e "/usr/share/applications/sublime_text.desktop"
    echo -e "/usr/share/fonts/Roboto_Mono\n"
    read -p "Please input your select: " yn
    
    if [[ "$yn" == "no" || "$yn" == "n" ]]; then
        exit
    fi

done

rm -rf /opt/sublime_text 
rm -rf /usr/local/bin/subl 
rm -rf /usr/share/applications/sublime_text.desktop 
rm -rf /usr/share/fonts/Roboto_Mono 
