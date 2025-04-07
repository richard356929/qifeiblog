---
title: hexo博客站点地图配置
cover: https://img.090227.xyz/file/ae62475a131f3734a201c.png
swiper_index: 10
top_group_index: 10
background: '#fff'
date: 2025-04-07 22:28:46
updated:
tags:
  - hexo
  - 站点地图
  - sitemap
categories:
  - 建站
keywords: hexo,站点地图,sitemap,建站,google,baidu,谷歌,百度
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

## 站点地图（Sitemap）
站点地图描述了一个网站的架构。 它可以是一个任意形式的文档，用作网页设计的设计工具，也可以是列出网站中所有页面的一个网页，通常采用分级形式。这有助于访问者以及搜索引擎的爬虫找到网站中的页面。
站点地图为SEO带来的好处。

为搜索引擎爬虫提供可以浏览整个网站的链接；
为搜索引擎爬虫提供一些链接，指向动态页面或者采用其他方法比较难以到达的页面；
如果访问者试图访问网站所在域内并不存在的URL，那么这个访问者就会被转到“无法找到文件”的错误页面，而网站地图可以作为该页面的“准”内容。
说白了就是让搜索引擎的爬虫，尽可能多的收录你站点上的页面，页面收录的越多，你的网站的流量就会越大。

## Hexo如何生成Sitemap
### 2.1 Google 版本
进入到根目录下，打开CMD，运行下面的命令：
```shell
npm install hexo-generator-sitemap --save
```

### 2.2 Baidu 版本
进入到根目录下，打开CMD，运行下面的命令：
```shell
npm install hexo-generator-baidu-sitemap --save
```

### 2.3 生成站点地图
安装结束后，在_config.yml中找到url，改成你自己的域名。

![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20250407222750.png)


更改完成后，每次进行打包的时候，会自动在public文件夹下生成sitemap.xml和baidusitemap.xml分别用于Google和百度。

## 3. 查看
将页面提交到服务器后，通过域名/sitemap.xml或者域名/baidusitemap.xml可以进行访问sitemap。

最后到Google或百度对应的站长工具进行提交sitemap就可以了。