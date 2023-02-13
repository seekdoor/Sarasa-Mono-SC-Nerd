## 关于

[Sarasa Mono SC](https://github.com/be5invis/Sarasa-Gothic)字体打了 [Nerd
fonts](https://github.com/ryanoasis/nerd-fonts)补丁，特别适合简体中文用户在终端
环境或者编辑器中使用。

包含两个字体家族：`Sarasa Mono SC Nerd` 和 `Sarasa Mono SC Wide Nerd`

文字效果如下：
![文字效果](screenshots/character.png)

图标效果如下：
![图标效果](screenshots/icon.png)

## 安装

MacOS 用户可以直接通过 cask 安装：

```sh
brew tap laishulu/cask-fonts
brew install --cask font-sarasa-nerd
```

ArchLinux 用户可以使用 yay 安装：

```sh
yay -S nerd-fonts-sarasa-mono
```

Gentoo 用户可以添加`gentoo-zh`安装：

```sh
sudo eselect repository enable gentoo-zh
sudo emerge --sync
sudo emerge -av media-fonts/sarasa-mono-sc-nerd
```

## 使用

在你的主题配置文件中，使用 `Sarasa Mono SC Nerd`。

## 说明

- `等距更纱黑体 SC` 是极少数做到中文和英文 2:1 严格对齐的字体，适合用来写代码, 以
  及 org mode 里中英文混合的表格对齐等。
- `Nerd fonts` 提供了很多图标字体，特别适合各种 Shell/NeoVim/Emacs 主题，例如 zsh 的
  [`p10k`](https://github.com/romkatv/powerlevel10k),
  [`Powerline`](https://github.com/powerline/powerline) 等等。
- 本项目将 `Nerd fonts` 打补丁到 `等距更纱黑体 SC` 中，但并没有选择全部 `Nerd
fonts` 图标集，而是将 `material design` 剔除，原因是：
  - 这个图标集很大，和很多汉字冲突，连 `不` 字都不能正常显示。
  - 在写代码这个使用场景中，这个图标集没什么用。
- 本项目对图标字体的长宽进行了调整，使之完美符合 2:1，不会出现高度不对齐的
  问题。
- 本项目对字体在`Chinese (PRC)`和`English (US)`下的`Family`, `SubFamily`和
  `UniqueID`等多个属性进行了设置，避免了很多问题。
- 本项目将 `OS/2` 表中的 `xAvgCharWidth` 属性进行了设置，避免了 windows 系统下不支持
  新版本 `OS/2` 表的软件中字距不正常的问题。

## 基于其它 Sarasa 字体

1. 进入 `nerd font` 源码目录，将本项目 _scripts_ 目录下的文件拷贝过去。
2. 安装 fontpatcher
   ```
   wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip
   unzip FontPatcher.zip && rm -rvf FontPatcher.zip
   ```
3. 安装 _python_ 环境
   ```
   brew install fontforge
   rm Pipfile*
   pipenv --site-packages --python=/Applications/FontForge.app/Contents/Frameworks/Python.framework/Versions/Current/bin/python3
   pipenv install argparse fonttools
   ```
4. `git checkout <commit-id>` 其中的 `commit-id` 来自于
   _nerd-font-commit.txt_
5. 运行 _./patch.sh_
6. 修改 _font-patcher_ 文件中 `Mono SC` (约第 87 行)
7. 把 _./generate.sh_ 中的字体路径改好，然后执行
