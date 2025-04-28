---
title: 安装yt-dlp,下载youtube视频神器
cover: https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20250429044438.png
swiper_index: 10
top_group_index: 10
background: '#fff'
date: 2025-04-29 04:43:21
updated:
tags:
  - yt-dlp
  - 下载youtube
  - 下载视频
categories: 程序员
keywords: yt-dlp,youtube,视频,下载
description: 安装yt-dlp,下载youtube视频神器
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

### **使用 pip 安装 yt-dlp**

在终端（macOS/Linux）或命令提示符/PowerShell（Windows）中运行以下命令：
```bash
pip install yt-dlp
```

#### **国内用户加速安装（使用清华镜像源）**
```bash
pip install yt-dlp -i https://pypi.tuna.tsinghua.edu.cn/simple
```


### **验证安装**
```bash
yt-dlp --version
```
输出类似 `2025.03.31` 的版本号即表示成功。

### **安装 FFmpeg（可选，但强烈推荐）**
`yt-dlp` 依赖 FFmpeg 来合并视频和音频流（例如下载 YouTube 高清视频）。  
安装方法：
#### **macOS**
```bash
# 使用 Homebrew 安装
brew install ffmpeg
```

我这里报错
```
> brew install ffmpeg
Running `brew update --auto-update`...
Warning: You are using macOS 15.
We do not provide support for this pre-release version.
It is expected behaviour that some formulae will fail to build in this pre-release version.
It is expected behaviour that Homebrew will be buggy and slow.
Do not create any issues about this on Homebrew's GitHub repositories.
Do not create any issues even if you think this message is unrelated.
Any opened issues will be immediately closed without response.
Do not ask for help from Homebrew or its maintainers on social media.
You may ask for help in Homebrew's discussions but are unlikely to receive a response.
Try to figure out the problem yourself and submit a fix as a pull request.
We will review it but may or may not accept it.

Error: unknown or unsupported macOS version: :dunno
```
通过使用miniconda安装解决
```
conda install -c conda-forge ffmpeg
```
#### **Linux（Debian/Ubuntu）**
```bash
sudo apt update && sudo apt install ffmpeg
```
#### **Windows**
1. 下载 FFmpeg 静态构建包：  
    [https://www.gyan.dev/ffmpeg/builds/](https://www.gyan.dev/ffmpeg/builds/)
2. 解压 zip 文件，将 `ffmpeg.exe` 所在目录添加到系统环境变量 `PATH` 中。

**验证安装**
```bash
ffmpeg -version
```
输出版本信息即表示成功。
![image.png](https://qifei-blog-1256009448.cos.ap-chengdu.myqcloud.com/qifei-blog/20250429043601.png)

### **基本使用示例**
```
# 下载视频（自动选择最佳画质）
yt-dlp https://www.youtube.com/watch?v=视频ID

# 指定格式（例如：最佳视频+最佳音频）
yt-dlp -f "bestvideo+bestaudio" https://youtu.be/视频ID

# 下载播放列表
yt-dlp --yes-playlist https://www.youtube.com/playlist?list=播放列表ID
```