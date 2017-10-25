# Subl 配置

原本一直都是直接官方通过 yum 或者 apt 安装的，不过今天突然碰到官网打不开，很纠结。

所以改变了使用方式，并且自己保留了一份备份。

配置完成后的效果:

![Sublime 配置](http://image.broqiang.com/c7aa9267b0e92db30e719a1836a4f5bb.png)

## 脚本安装

如果不想手动安装，可以直接执行解压后的目录中的 install.sh 脚本进行安装

#### 安装软件

__需要注意： 此脚本需要 root 权限执行__

```shell
sudo ./install.sh
# 或者
sudo sh install.sh
```

#### 配置插件和配置文件

```shell
./config.sh
# 或者
sh config.sh
```

#### 删除 Sublime
```shell
sudo ./uninstall
# 或者
sudo sh uninstall
```

> 需要注意，此脚本并不会删除 ~/.config 下的 sublime-text-3 的配置，需要手动删除

## 手动软件安装软件

```shell
# 解压软件
sudo tar xzvf sublime_text_3_build_3143_x64.tar.bz2 -C /opt
# 将解压后的软件重命名
sudo mv /opt/sublime_text_3 /opt/sublime_text
# 复制可执行文件
sudo cp subl /usr/local/bin
# 复制桌面图标文件，用来在菜单中显示
sudo cp sublime_text.desktop /usr/share/applications/
# 解压所字体
unzip Roboto_Mono.zip -d /usr/share/fonts/Roboto_Mono
```

## 复制配置文件

此步的目的是将一些常用的插件和配置直接复制，不需要再单独安装了。

如果想自己安装，请参考 [http://broqiang.com](http://broqiang.com) 中关于 Sublime 的文档

```shell
tar xzvf sublime-text-3_config.tar.gz -C ~/.config/
```

