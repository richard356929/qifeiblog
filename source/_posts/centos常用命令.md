---
title: centos常用命令
cover: https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/%E5%85%AC%E4%BC%97%E5%8F%B7%E5%B0%81%E9%9D%A2%E8%83%8C%E6%99%AF%E5%9B%BE.png
swiper_index: 10
top_group_index: 10
background: '#fff'
date: 2025-04-12 22:58:16
updated:
tags:
  - centos
  - linux命令
categories:
  - 程序员
keywords:
description:
top:
top_img:
comments:
toc:
toc_number:
toc_style_simple:
copyright:
copyright_author:
copyright_author_href:
copyright_url:
copyright_info:
mathjax:
katex:
aplayer:
highlight_shrink:
aside:
ai:
---

### 查看centos版本

```
cat /etc/redhat-release
```

# 开机进入命令行界面
```shell
# 更改为图形界面模式
systemctl set-default graphical.target

# 更改为命令行模式
systemctl set-default multi-user.target 由图形界面模式更改为命令行模式

# 更改后验证是否正确
shutdown -r now

```
### 关机和重启

```
shutdown -h 10        #计算机将于10分钟后关闭，且会显示在登录用户的当前屏幕中
shutdown -h now       #计算机会立刻关机
shutdown -h 22:22     #计算机会在这个时刻关机
shutdown -r now       #计算机会立刻重启
shutdown -r +10       #计算机会将于10分钟后重启
reboot                #重启
halt                  #关机
```

### 默认命令行启动

```
# 查看当前模式
systemctl get-default
# 图形
systemctl set-default graphical.target
# 命令行
systemctl set-default multi-user.target
```

### 配置静态ip

```
cat /etc/sysconfig/network-scripts/ifcfg-eth0
  HWADDR="00:15:5D:07:F1:02"
  TYPE="Ethernet"
  BOOTPROTO="static" #dhcp改为static
  DEFROUTE="yes"
  PEERDNS="yes"
  PEERROUTES="yes"
  IPV4_FAILURE_FATAL="no"
  IPV6INIT="yes"
  IPV6_AUTOCONF="yes"
  IPV6_DEFROUTE="yes"
  IPV6_PEERDNS="yes"
  IPV6_PEERROUTES="yes"
  IPV6_FAILURE_FATAL="no"
  NAME="eth0"
  UUID="bb3a302d-dc46-461a-881e-d46cafd0eb71"
  ONBOOT="yes" #开机启用本配置
  IPADDR=192.168.7.106 #静态IP
  GATEWAY=192.168.7.1 #默认网关
  NETMASK=255.255.255.0 #子网掩码
  DNS1=192.168.7.1 #DNS 配置

# 重启下网络服务
service network restart
```

### 配置静态ip脚本，新系统使用

```
#!/bin/bash
echo "set hostname"
# 设置机器名
hostnamectl set-hostname richard-vm
echo "set hostname success, set static IP address"
# 设置静态 IP，网络请根据自己的网卡来配置,ip addr 或 ifconfig 查看，笔者这里是ens33
sed -i "s/dhcp/static/g" /etc/sysconfig/network-scripts/ifcfg-eth0
echo 'IPADDR=1.1.1.3
NETMASK=255.255.255.0
GATEWAY=1.1.1.1' >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "set static IP address success, restart network service"
# 重启网络服务
service network restart
echo "restart network service success"
# 添加DNS，DNS 请根据自己的网卡配置
# echo 'nameserver 192.168.70.2' >> /etc/resolv.conf
# echo "add DNS server success"
```

### 普通用户设置sudo权限

```
切换到root用户
visudo命令
找到root  ALL=(ALL)    ALL ，
在其下添加一行 jing  ALL=(ALL)    ALL
这样普通用户便有了sudo权限。
```

### 开端口

```
/sbin/iptables -I INPUT -p tcp --dport 8096 -j ACCEPT
```

### 关防火墙

```
# centos8
systemctl stop firewalld.service && systemctl disable firewalld.service
```

### ssh免密登录

```
# 1.在A机下生成公钥/私钥对。
ssh-keygen -t rsa -P ''
# 2.把A机下的id_rsa.pub复制到B机下，在B机的.ssh/authorized_keys文件里
# 3.B机把从A机复制的id_rsa.pub添加到.ssh/authorzied_keys文件里。authorized_keys的权限要是600。
chmod 600 authorized_keys
```

### 遇到ssh修改了默认的端口22不能免密钥登录解决方法

```
vim /etc/ssh/sshd_config
去掉以下三行之前的#
RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
重启ssh服务service sshd restart 重新产生秘钥，并上传公钥到另外一台服务器。
```

### ifconifg命令不能用

```
yum install net-tools
```

### root 不能ssh

```
vi /etc/ssh/sshd_config
PermitRootLogin yes //默认为no，需要开启root用户访问改为yes
PasswordAuthentication yes //默认为no，改为yes开启密码登陆
systemctl restart sshd
```

### yum配置阿里云

https://developer.aliyun.com/article/704987

### 解压.gz文件

```
gzip -d xxx.gz
```
