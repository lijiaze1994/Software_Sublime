#!/bin/bash
#
# 这个脚本是用来安装 Sublime 的
#

if [[ $UID -ne 0 ]]; then
    echo -e "\n请使用 root 权限执行此脚本，也可以通过 sudo $0 来执行\n"
    exit
fi

if [[ -d /opt/sublime_text ]]; then
    echo -e "\nError: Is not install!  /opt/sublime_text alreay exist\n"
    exit
fi

echo -e "Staring install sublime ..."

cp -rf sublime_text_3 /opt/sublime_text

cp -rf  subl /usr/local/bin

cp -rf sublime_text.desktop /usr/share/applications/

if [[ ! -d /usr/share/fonts/Roboto_Mono ]]; then
    unzip -o Roboto_Mono.zip -d /usr/share/fonts/Roboto_Mono > /dev/null
fi

# add icons
cp -rf icons/* /usr/share/icons

# Update icons cache
gtk-update-icon-cache

echo -e "\033[1;32mInstall success!\033[0m\n"

# Install python gtk2
release=$(lsb_release -i | awk -F':' '{print $NF}' | sed "s/\t//g")

case $release in
Fedora)
    dnf install -y pygtk2
    ;;
CentOS)
    yum install -y pygtk2
    ;;
Ubuntu)
    apt install -y python-gtk2-dev
    ;;
*)
    echo -e "python gtk2 can not installd,Do not know your operating system version, please manually install"
    ;;
esac
