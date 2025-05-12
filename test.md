# GFM 测试文档

此文档用于测试所有 GitHub Flavored Markdown 语法功能。

## 1. 标题示例

# H1
## H2
### H3
#### H4
##### H5
###### H6

## 2. 行内标记

- **粗体**：`**粗体**` 或 `__粗体__`
- *斜体*：`*斜体*` 或 `_斜体_`
- ~~删除线~~：`~~删除线~~`
- 上标：X<sup>2</sup>：`X<sup>2</sup>`
- 下标：H<sub>2</sub>O：`H<sub>2</sub>O`
- 下划线：
  - <u>u 标签下划线</u>： `<u>u 标签下划线</u>` 
  - <ins>ins 标签下划线</ins>： `<ins>ins 标签下划线</ins>` 

## 3. 脚注

这是一个带脚注的示例[^note].

[^note]: 这是脚注内容。GFM支持脚注语法。

## 4. 引用块

> 这是一个引用块
> 可以多行使用
>> 引用缩进
> 
> 结束行

## 5. 警示块 (Alerts)

> [!NOTE]  
> 这是一个 note 提示

> [!TIP] 
> 这是一个 tip 提示

---

> [!IMPORTANT]
> 这是一个 important 提示

> [!WARNING]
> 这是一个 warning 提示

***

> [!CAUTION]
> 这是一个 caution 提示

## 6. 代码块

### 普通代码块

不带语法高亮：

```
int main() {
    return 0;
}
```

带语法高亮：

```python
from pathlib import Path

def hello():
    # Function comments
    print("Hello, World!")
```

### 行内代码

使用 `git status` 命令查看状态。

## 7. 超链接

- [GitHub](https://github.com)
- 自动链接：<https://github.com>
- 带标题的链接：[Github](https://github.com "Github 主页")
- 引用式超链接：[本仓库][gfm-css]

## 8. 列表

### 无序列表

- 项目1
- 项目2
  - 子项目2.1
  - 子项目2.2
- 项目3

### 有序列表

1. 第一项
2. 第二项
   1. 子项2.1
   2. 子项2.2
3. 第三项

### 任务列表

- [x] 完成文档
- [ ] 测试功能
- [ ] 发布版本

## 9. 图表

测试图片：

![Test Image](./test.png)

测试表格：

| 左对齐 | 居中 | 右对齐 |
|:-------|:----:|-------:|
| 数据1  | 数据2 | 数据3  |
| 数据4  | 数据5 | 数据6  |

## 10. 数学公式

行内公式： $E=mc^2$

行间公式：

$$
A = \begin{pmatrix}
1 & 2 \\
3 & 4 \\
\end{pmatrix}
$$

## 11. 其他

折叠：

<details><summary>标题：单击以展开/隐藏并查看详细内容</summary>
这里是展开后的详细内容。

</details>

[gfm-css]: https://github.com/wklchris/markdown-css-for-pandoc