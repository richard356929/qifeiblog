---
title: 超强大的 Nginx 可视化管理平台 Nginx-Proxy-Manager
cover: https://img.090227.xyz/file/ae62475a131f3734a201c.png
swiper_index: 10
top_group_index: 10
background: '#fff'
date: 2025-04-09 22:06:15
updated:
tags:
  - nginx
categories:
  - 建站
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


nginx-proxy-manager 是一个反向代理管理系统，它基于 NGINX，具有漂亮干净的 Web UI。还可以获得受信任的 SSL 证书，并通过单独的配置、自定义和入侵保护来管理多个代理。

### 安装

#### 1、安装 Docker 和 Docker-Compose

#### 2、创建一个docker-compose.yml文件
```yml
version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```
#### 3、运行
```bash
docker-compose up -d
 
#如果使用的是 docker-compose-plugin
docker compose up -d
```
#### 4、访问网页
运行成功后，访问 http://127.0.0.1:81 就能看到界面啦
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119225221.png)
#### 5、登录
网站默认账号和密码为
```
账号：admin@example.com
密码：changeme
```
登录成功后第一次要求修改密码，按照步骤修改即可！
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119225327.png)
### 实战：设置后台管理界面的反向代理
这里，我们就用 http://a.test.com 来绑定我们的端口号为81的后台管理界面，实现浏览器输入 http://a.test.com 即可访问后台管理界面，并且设置HTTPS。

#### 1、前提

- 安装好Nginx Proxy Manager
- 拥有一个域名
- 将 http://a.test.com 解析到安装Nginx Proxy Manager的服务器ip地址上
#### 2、反向代理操作

先用`ip:81` 访问后台管理界面，然后输入账号密码进入后台。

点击绿色图标的选项
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119231731.png)
  
点击右边`Add Proxy Host` ，在弹出的界面`Details`选项中填写相应的字段。
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119231751.png)
- **Domain Names**: 填写要反向代理的域名，这里就是http://a.test.com
- **Forward Hostname / IP**: 填写的ip值见下文解释
- **Forward Port**: 反向代理的端口，这里就是81
- **Block Common Exploits**: 开启后阻止一些常见漏洞
- 其余两个暂不知作用

**Forward Hostname / IP填写说明**
如果搭建的服务和nginx proxy manager服务所在不是一个服务器，则填写能访问对应服务的IP。如果都在同一台服务器上，则填写在服务器中输入`ip addr show docker0` 命令获取得到的ip。

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119231828.png)
这里不填`127.0.0.1`的原因是使用的是docker容器搭建web应用，docker容器和宿主机即服务器不在同一个网络下，所以`127.0.0.1`并不能访问到宿主机，而`ip addr show docker0`获得的ip地址就是宿主机地址。

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119231857.png)

接下来即可用`a.test.com` 访问后台管理界面，此时还只是http协议，没有https。不过此时就可以把之前的81端口关闭了，输入`a.test.com` 访问的是服务器`80`端口，然后在转发给内部的81端口。

#### 3、申请ssl证书

申请一个`a.test.com` 证书，这样就可以提供https访问了。

在Nginx Proxy Manager管理后台，选择`Access Lists`->`Add SSL Certificate`->`Let's Encrypt`选项。

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119231921.png)

按照下图方式填写，点击Save就可以了

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241119231933.png)

### 总结

以上就是本教程的全部内容，更多的使用教程，大家可以访问官方文档。

官方文档：https://nginxproxymanager.com/guide/

本文转载自：「macrozheng」，原文：https://tinyurl.com/ywr87twf，版权归原作者所有。