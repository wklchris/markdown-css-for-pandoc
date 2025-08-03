# Markdown CSS for Pandoc

🌐 *中文*, [English](./ReadMe.md)

本仓库提供适用于文档转换工具 [Pandoc](https://github.com/jgm/pandoc) 的 GitHub 风格 Markdown CSS 文件。

该仓库作者模仿了 GitHub 风格 Markdown（GFM）的样式来编写这些 CSS 文件。这些文件并非来自 GitHub 官方，本仓库也并不保证格式完全还原。

目录：
- [在线示例](#在线示例)
- [使用指南](#使用指南)
  - [安装：](#安装)
  - [文件转换](#文件转换)
- [与原始 GFM 的已知差异](#与原始-gfm-的已知差异)
- [许可证](#许可证)

## 在线示例

在本仓库的[示例网页](https://wklchris.github.io/markdown-css-for-pandoc/example.html)中预览一个渲染后的 HTML 示例。该页面使用了类似下文[使用指南](#using-guide)中介绍的命令生成。

## 使用指南

### 安装：

- 确保已安装 [Pandoc](https://github.com/jgm/pandoc/releases)。
- 从本仓库下载文件 [gfm.css](./gfm.css) 和 [gfm-hl.theme](./gfm-hl.theme)。

### 文件转换

（推荐）对于 Windows 用户（或其他操作系统但使用 PowerShell的用户），本仓库提供了一个脚本 [pandoc-gfm.ps1](./pandoc-gfm.ps1)，用于简化转换命令：

```powershell
./pandoc-gfm.ps1 path/to/input.md
```

该命令将在同一目录下生成 HTML 文件，并自动将 `gfm.css` 文件一同复制到输出文件中。

运行 `Get-Help ./pandoc-gfm.ps1` 可获取 PowerShell 脚本的完整参数列表。

---

或者，如果您不想运行 PowerShell 脚本，也可以使用原始 Pandoc 命令进行转换（需手动复制 CSS 文件）：

1. **Pandoc 命令**：在终端中执行以下命令，将 `input.md` 转换为 `output.html`：

```  
pandoc input.md -s -c gfm.css -f gfm --highlight-style gfm-hl.theme --mathjax -o output.html 
```

2. **复制 CSS 文件**：请确保将文件 `gfm.css` 与您的输出 HTML 一同保留，以保证样式正常显示。

本仓库提供的 CSS/主题文件已在 Pandoc 版本 3.6.4 上测试通过。

## 与原始 GFM 的已知差异

以下是一些偏离原始 GFM 样式的已知差异或自定义项。它们属于功能而非缺陷，因此不太可能被“修复”。

- 最大宽度：设为 `60em`
- 字体大小：
  - 代码 (`--code-font-size`)：使用 `small` 而非 `0.875em`
  - 页面底部的脚注：使用 `small` 而非 `12px`
- 折叠工具（`<details> <summary>`）样式更改：
  - 在左侧显示边界线，以标记展开内容的起止
  - 在展开或鼠标悬停时，为摘要文本添加背景色来高亮
- 提示框（警告类）图标：使用 Unicode 符号而非 SVG 图标
- 其他一些间距、边框样式或其他视觉影响较小的细节

代码语法高亮风格 [gfm-hl.theme](./gfm-hl.theme) 是基于 Pandoc 的 pygments 主题进行修改的，原始主题可通过以下命令生成：

```  
pandoc -o gfm-hl.theme --print-highlight-style pygments
```

*表格：基于默认 Pygments 风格进行修改的高亮样式*
| 样式（HTML 类） | 属性 | 当前值 | 原始值 |
| :--- | :--- | :---: | :---: |
| Attribute (at) | 文本颜色 | `#7d9029` | `#6639ba` |
| BuiltIn (bu), Import (im) | 文本颜色 | `#6639ba` | `#008000` |
| Annotation, Comment (co), CommentVar, Information, Warning | 文本颜色 | `#59636e` | `#60a0b0` |
| ControlFlow (cf), Keyword (kw), Other | 文本颜色 | `#cf222e` | `#007020` |
| BaseN, Decval (dv), Float (fl) | 文本颜色 | `#0550ae` | `#40a070` |
| \^ Char, SpecialChar, String (st), VerbatimString | 文本颜色 | `#0e7615` | `#4070a0` |
| Operator (op) | 文本颜色 | `#6639ba` | `#666666` |
| Variable (va) | 文本颜色 | `#0550ae` | `#19177c` |

\^ *此处使用了与 GFM 风格不同的偏好。*

## 许可证

[MIT](./LICENSE)
