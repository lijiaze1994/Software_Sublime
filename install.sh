#!/bin/bash
#
# 这个脚本是用来安装 Sublime 的
#

# Install Sublime by offline
function offline()
{
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
}

# Install Ubuntu version of Sublime
function ubuntu_version()
{
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
}

function fedora_version()
{
    sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
    sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
    sudo dnf install sublime-text
}

function centos_version()
{
    sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
    sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
    sudo yum install sublime-text
}

# Install Sublime by online
function online()
{
    echo -e "Please enter the operating system release version."
    echo -e "1. Ubuntu\n2. Fedora\n3. CentOS"
    read -p "Please input: " sys_version

    case ${sys_version} in
        1 | Ubuntu | ubuntu) 
            ubuntu_version
            ;;
        2 | Fedora | fedora)
            fedora_version
            ;;
        3|CentOS|centos)
            centos_version
            ;;
        * )
            echo -e "Error: Invalid option !"
            echo -e "Please input : [ 1 | Ubuntu | 2 | Fedora | 3 | CentOS ]"
            online
            ;;
    esac
}

function install()
{
    echo -e "Will you choose to install online or offline?"
    echo -e "Enter [online] online installation, enter any key offline installation"
    read -p "Please input : " onoff

    if [[ "$onoff" == "online" ]]; then
        online
    else
        offline  
    fi

}

if [[ $UID -ne 0 ]]; then
    echo -e "\n请使用 root 权限执行此脚本，也可以通过 sudo $0 来执行\n"
    exit
fi

if [[ -d /opt/sublime_text ]]; then
    echo -e "\nError: Is not install!  /opt/sublime_text alreay exist\n"

    read -p "Press [y/yes] to force installation: " yn
    if [[ "$yn" == "y" || "$yn" == "yes" ]]; then
        rm -rf /opt/sublime_text
        install
    fi
else
    install
fi


