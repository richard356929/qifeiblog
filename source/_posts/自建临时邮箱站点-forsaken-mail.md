---
title: 自建临时邮箱站点 forsaken-mail
cover: https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241121200207.png
swiper_index: 10
top_group_index: 10
background: '#fff'
date: 2025-04-09 22:44:10
updated:
tags:
  - 邮箱
  - 工具
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

### 搭建自建临时邮箱网站教程

这是我搭建的临时邮箱，大家可试用
[https://mail.qifeiai.top/](https://mail.qifeiai.top/)

#### 问题与痛点

在网络时代，我们经常需要注册各种在线服务，而大多数服务都需要一个邮箱地址来接收验证邮件或其他通知。然而，使用个人邮箱可能会带来隐私泄露和垃圾邮件泛滥的问题。这就是为什么临时邮箱变得如此重要。

**为什么需要临时邮箱？**

1. **保护隐私**：临时邮箱可以避免个人信息泄露，尤其是在注册不熟悉的网站或服务时。
2. **减少垃圾邮件**：使用临时邮箱可以减少个人邮箱收到的垃圾邮件数量。
3. **测试服务**：在测试某些服务时，使用临时邮箱可以避免对个人邮箱造成干扰。
4. **避免账号关联**：在需要多个账号的情况下，使用临时邮箱可以避免账号之间的关联。

#### 搭建临时邮箱的方法和步骤

**步骤 1：选择临时邮箱服务**

在众多的临时邮箱服务中，forsaken-mail 是一个不错的选择。它是一个开源的临时邮箱服务，可以快速部署，并且易于管理。

项目地址： hub.docker.com/r/veip007/forsaken-mail

**步骤 2：准备环境**

确保你的服务器上安装了 Docker，因为 forsaken-mail 支持通过 Docker 进行部署。

**步骤 3：部署 forsaken-mail**

根据你的服务器架构，选择相应的 Docker 命令来部署 forsaken-mail。

- **对于 x86 架构**：
  ```shell
  docker run --restart=always --name forsaken-mail -d -p 25:25 -p 3000:3000 veip007/forsaken-mail
  ```
- **对于 arm 架构**：
  ```shell
  docker run --restart=always --name forsaken-mail -d -p 25:25 -p 3000:3000 veip007/forsaken-mail:arm
  ```

这些命令会创建一个名为 `forsaken-mail` 的容器，并将内部的 3000 端口映射到宿主机的 3000 端口，同时将 25 端口（邮件服务端口）也映射到宿主机。

**步骤 4：配置域名**

在 Cloudflare 或其他 DNS 提供商处为你的临时邮箱服务配置域名解析。将域名指向你的服务器 IP 地址。

**步骤 5：配置 Nginx 反代**

1. 打开 Nginx Proxy Manager。（关于 Nginx Proxy Manager 可以看这篇文章，[超强大的 Nginx 可视化管理平台 Nginx-Proxy-Manager](https://qifeiai.top/archives/chao-qiang-da-de-nginx-ke-shi-hua-guan-li-ping-tai-nginx-proxy-manager)）
2. 创建一个新的代理，填写你的域名。
3. 在代理设置中，将端口设置为 3000，这是 forsaken-mail 服务监听的端口。

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241121195909.png)

**步骤 6：测试服务**

在浏览器中输入你的域名，检查 forsaken-mail 是否正常运行。如果一切设置正确，你应该能够看到临时邮箱的界面，并开始使用它。

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241121200207.png)

测试给临时邮箱地址发送邮件，可以收到
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20241121200514.png)

过一会大概5分钟，邮件会自动清理掉。

感谢您阅读本篇关于搭建自建临时邮箱网站的教程。我们希望这篇文章能够为您提供有价值的信息和指导，帮助您在保护个人隐私和网络安全方面迈出重要的一步。如果您在搭建过程中遇到任何问题，或者有任何疑问和建议，欢迎关注留言。

这是我搭建的临时邮箱，大家可试用
[https://mail.qifeiai.top/](https://mail.qifeiai.top/)