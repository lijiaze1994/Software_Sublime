# Subl 配置 🔴

原本一直都是直接官方通过 yum 或者 apt 安装的，不过今天突然碰到官网打不开，很纠结。

所以改变了使用方式，并且自己保留了一份备份。

配置完成后的效果:

![Sublime 配置](http://image.broqiang.com/c7aa9267b0e92db30e719a1836a4f5bb.png)

## 脚本安装

如果不想手动安装，可以直接执行解压后的目录中的 install.sh 脚本进行安装

#### 安装软件

__需要注意： 此脚本用到 sudo 权限，提示输入密码的时候输入当前用户密码即可__

```shell
./start.sh
#或者
sh start.sh
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
# 复制图标文件
cp -rf icons/* /usr/share/icons
```

## 复制配置文件

此步的目的是将一些常用的插件和配置直接复制，不需要再单独安装了。

如果想自己安装，请参考 [http://broqiang.com](http://broqiang.com) 中关于 Sublime 的文档

```shell
tar xzvf sublime-text-3_config.tar.gz -C ~/.config/
```

## 更新日志

#### 2018-02-02

- 增加新的快捷键 

    `{ "keys": ["ctrl+shift+alt+c"], "command": "copy_path" },` 用来复制文件所在路径

- 增加新的插件

    `scss` - scss 文件的语法提示和代码高亮

    `SyncedSideBar`  - 自动在左边文件夹树中定位当前文件

    `EditorConfig` - `.editorconfig` 编码格式化支持

- 增加了 3 个 Snippet

    `pubf` - 自动创建一个 `public` 方法

    `prof` - 自动创建一个 `protected` 方法

    `prif` -  自动创建一个 `privte` 方法

#### 2017-12-26

- 添加在线安装方式，不过要保证可以正常访问 Sublime 的软件源

- 将配置的插件更新

#### 2017-12-05

- 将安装包和配置文件从压缩包展开成文件夹，防止 git 获取数据因为 post 数据太大报错

- 修改配置脚本，补充安装支持中文用到的 Python Gtk2 包

#### 2017-10-29

- 添加 start.sh 脚本，将原本的 install 和 config 变成一个一次执行

- 添加图标的配置，安装完成后可以有 Sublime 图标

    原本安装没有注意，安装完成后没有图标，看起来有点别扭


