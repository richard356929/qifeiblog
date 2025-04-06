---
title: Chrome浏览器多开，账号独立运行
cover: https://img.090227.xyz/file/ae62475a131f3734a201c.png
swiper_index: 10
top_group_index: 10
background: "#fff"
date: 2025-04-06 22:37:04
updated: 
tags:
  - chrome
  - 多开
categories: 工具
keywords: chrome,多开
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
## 使用多个独立 Chrome 实例的好处：

1.	账号隔离（多个 Google/Facebook/Twitter 账号互不干扰）。
2.	独立 Cookie 和缓存（防止自动登录错账户）。
3.	避免网站指纹追踪（适合营销、电商、广告推广）。
4.	防止崩溃影响所有 Chrome（每个实例独立运行）。
5.	提高工作效率（为不同任务创建不同的 Chrome 配置）。
6.	独立代理（使用不同 VPN 或 IP 访问不同站点）。
7.	适用于 Web3、加密货币交易、Dapp（多个钱包账户隔离）。

## macOS 
步骤 1：创建用户数据文件夹 打开终端（快捷键 Command + Space，搜索 终端）。 创建用户数据目录：
```shell
mkdir -p ~/Chrome_Profiles/Profile_1
```
步骤 2：创建 Chrome 启动脚本 创建文件（在终端中输入）：
```shell
open -na "Google Chrome" --args --user-data-dir="$HOME/Chrome_Profiles/Profile_1"
```
保存为 ～/chrome_profiles.sh 赋予执行权限：
```shell
chmod +x ~/chrome_profiles.sh
```
步骤 3：运行脚本 在终端中输入：
```shell
~/chrome_profiles.sh
```
回车后，你会看到独立环境的 Chrome 浏览器实例被打开，使用指定的 Profile 目录。
步骤 4：创建桌面快捷方式 
方法 ：使用 Automator finder中点击左侧 应用程序 找到Automator 选择 “应用程序” 类型。
然后 在左侧搜索 Shell 脚本，然后双击它。
在脚本框中输入：
```shell
~/chrome_profiles.sh
```
点击 “文件” → “存储”：

选择 桌面 作为存储位置。

取名 “Chrome 多开.app”。 文件格式选择 “应用程序”，然后保存。 双击该应用，即可同时打开独立 Chrome 实例！

## windows上

**在d盘（或其他盘）创建两个文件夹**：

• **D:\fenliulanqi2\Chrome_UserData** （存放 Chrome 用户数据）

• **D:\fenliulanqi2\Chrome_ShortCuts** （存放快捷方式）

**步骤 2：创建 PowerShell 脚本**

1. **打开记事本**（快捷键 Win + R，输入 notepad，回车）。
    
2. **复制以下代码**（已修改成生成 10 个 Chrome 分身）：
    
```
# -*- coding: utf-8 -*-  
  
# Title: 自动生成多个具有独立环境的 Chrome 浏览器  
  
# Describe: d盘新建一个记事本文件，复制以下代码，保存为 chrome.ps1 ，  
  
# 菜单栏以管理员运行 PowerShell 运行，输入 d: 然后输入Set-ExecutionPolicy RemoteSigned 回车后获取权限输入y，  
  
# 输入命令 .\chrome.ps1 即可  
  
# 先建立两个文件夹并复制其路径，替换以下两个路径  
  
$UserDataPath = "D:\fenliulanqi2\Chrome_UserData" # 存放 Chrome 用户数据  
  
$FilePath = "D:\fenliulanqi2\Chrome_ShortCuts"    # 存放快捷方式图标，从这个文件夹里打开浏览器分身  
  
# 右键打开你桌面上的 Chrome 浏览器快捷方式，复制“目标”一栏的内容，替换下方路径  
  
# （注意：只复制 C:\Users\....\chrome.exe ，chrome.exe 后面的比如“--profile-directory”等字符不要复制）  
  
$TargetPath = "C:\Program Files\Google\Chrome\Application\chrome.exe"  
  
# 复制 Chrome 浏览器快捷方式的“起始位置”一栏的内容，替换下方路径  
  
$WorkingDirectory = "C:\Program Files\Google\Chrome\Application"  
  
# 设置生成分身的数量（从1到10）  
  
$array = 1..10  
  
foreach ($n in $array)  
  
{  
  
    $x = $n.ToString()  
  
    $ShortcutFile = $FilePath + "\Chrome_" + $x + ".lnk" #  
  
    $WScriptShell = New-Object -ComObject WScript.Shell  
  
    $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)  
  
    $Shortcut.TargetPath = $TargetPath  
  
    $Shortcut.Arguments = "--user-data-dir=" + $UserDataPath + "\" + $x  
  
    $Shortcut.WorkingDirectory = $WorkingDirectory  
  
    $Shortcut.Description = "Chrome" #备注，可以随便写  
  
    $Shortcut.Save()  
  
}
```

3. **保存文件**

• 点击 **文件 → 另存为**。

• **文件名：** chrome.ps1

• **保存类型：** 选择 所有文件 (_._)

• **存放位置：** D:\

**步骤 3：运行 PowerShell 脚本**

1. **以管理员权限运行 PowerShell**

• **按 Win + X**，选择 **Windows 终端（管理员）** 或 **PowerShell（管理员）**。

2. **进入 D 盘**

在 PowerShell 中输入：

```jsx
d:
```

回车。

3. **允许执行 PowerShell 脚本**

输入：

```jsx
Set-ExecutionPolicy RemoteSigned
```

**如果提示是否更改执行策略，输入 Y 并回车**。

4. **运行脚本**

输入：

```jsx
.\chrome.ps1
```

**回车运行脚本**，等待完成。

**步骤 4：运行 Chrome 分身**

• 打开 D:\fenliulanqi2\Chrome_ShortCuts，你会看到 10 个 Chrome 快捷方式，例如：

• Chrome_1.lnk

• Chrome_2.lnk

• …

• Chrome_10.lnk

• **双击任意一个快捷方式，即可打开独立的 Chrome 环境！**