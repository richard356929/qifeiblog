---
title: 安装miniconda
cover: https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/%E5%85%AC%E4%BC%97%E5%8F%B7%E5%B0%81%E9%9D%A2%E8%83%8C%E6%99%AF%E5%9B%BE.png
swiper_index: 10
top_group_index: 10
background: '#fff'
date: 2025-04-29 04:14:51
updated:
tags:
  - conda
  - miniconda
  - python
categories:
  - 程序员
keywords: miniconda,conda,python,python环境
description: 安装miniconda
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
![公众号封面背景图.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/%E5%85%AC%E4%BC%97%E5%8F%B7%E5%B0%81%E9%9D%A2%E8%83%8C%E6%99%AF%E5%9B%BE.png)

官网：
https://www.anaconda.com/docs/getting-started/miniconda/install#mac-os

1. 执行如下命令
```shell
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh 
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
```

2. 重启终端,执行如下命令
```
source ~/miniconda3/bin/activate
conda init --all
```


### 验证安装
```shell
conda --version
```
显示版本号（如 `conda 25.1.1`），则表示安装成功。

### **更换国内镜像源（加速下载）**
```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --set show_channel_urls yes
```

### 创建虚拟环境
```bash
conda create -n myenv python=3.9  # 创建名为myenv的环境，指定Python版本
conda activate myenv             # 激活环境
```