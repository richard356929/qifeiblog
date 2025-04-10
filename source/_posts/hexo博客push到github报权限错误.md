---
title: hexo博客push到github报权限错误
cover: https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20250406235520.png
swiper_index: 10
top_group_index: 10
background: "#fff"
date: 2025-04-06 23:52:21
updated: 
tags:
  - hexo
  - 博客
  - github
categories: 程序员
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
## 报错：
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20250406235520.png)

```shell
> git push
ERROR: Permission to richard356929/qifeiblog.git denied to oldbaiyang.
致命错误：无法读取远程仓库。

请确认您有正确的访问权限并且仓库存在。
```

## 解决：
```
# 删除sshkey公钥
rm -rf ~/.ssh/*

# 生成新key
ssh-keygen -t rsa -C "623218056@qq.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

# 新公钥上传到github
```