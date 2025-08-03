# GFM Test Document

🌐 *English*, [中文](./example-cn.html)

This document tests all supported GitHub-Flavored Markdown (GFM) syntax features and their rendering results in HTML for the [wklchris/markdown-css-for-pandoc][gfm-css] repository.

This is an illustrative webpage but not a user guide. For the user guide, see [ReadMe in the repo](https://github.com/wklchris/markdown-css-for-pandoc#using-guide).

---

Table of Contents:
- [1. Title Examples](#1-title-examples)
- [2. Inline Markers](#2-inline-markers)
- [3. Footnotes](#3-footnotes)
- [4. Blockquotes](#4-blockquotes)
- [5. Alerts (Admonitions)](#5-alerts-admonitions)
- [6. Code Blocks](#6-code-blocks)
  - [Regular Code Block](#regular-code-block)
  - [Inline Code](#inline-code)
- [7. Links](#7-links)
- [8. Lists](#8-lists)
  - [Unordered List](#unordered-list)
  - [Ordered List](#ordered-list)
  - [Task List](#task-list)
- [9. Figures](#9-figures)
- [10. Mathematical Formulas](#10-mathematical-formulas)
- [11. Misc](#11-misc)
  - [Collapsable `<details>`](#collapsable-details)


## 1. Title Examples

# H1 <!-- omit in toc -->
## H2 <!-- omit in toc -->
### H3 <!-- omit in toc -->
#### H4 <!-- omit in toc -->
##### H5 <!-- omit in toc -->
###### H6 <!-- omit in toc -->

## 2. Inline Markers

- **Bold**: `**bold**` or `__bold__`
- *Italic*: `*italic*` or `_italic_`
- ~~Strikethrough~~: `~~strikethrough~~`
- Superscript: X<sup>2</sup>: `X<sup>2</sup>`
- Subscript: H<sub>2</sub>O: `H<sub>2</sub>O`
- Underline:
  - <u>underline with u tag</u>: `<u>underline with u tag</u>` 
  - <ins>underline with ins tag</ins>: `<ins>underline with ins tag</ins>` 

## 3. Footnotes

This is an example with a footnote[^note].

[^note]: This is the footnote content. GFM supports footnote syntax.

## 4. Blockquotes

> This is a blockquote
> Can be used multiline
>> Quote indentation
> 
> Ending line

## 5. Alerts (Admonitions)

Note:

> [!NOTE]  
> This is a note alert

Tip:

> [!TIP] 
> This is a tip alert

Important:

> [!IMPORTANT]
> This is an important alert

Warning:

> [!WARNING]
> This is a warning alert

Caution:

> [!CAUTION]
> This is a caution alert

## 6. Code Blocks

### Regular Code Block

Single line:

```
text = "Code block"
```

No syntax highlighting:

```
int main() {
    return 0;
}
```

With syntax highlighting:

```python
from pathlib import Path

def hello():
    # Function comments
    print("Hello, World!")
```

### Inline Code

A paragraph of text.

Use `git status` command to check the status.

Another paragraph of text.

## 7. Links

- [GitHub](https://github.com)
- Auto link: <https://github.com>
- Link with title: [Github](https://github.com "Github homepage")
- Reference-style link: [This repository][gfm-css]

## 8. Lists

### Unordered List

Test unordered list:

- Item 1
- Item 2
  - Sub-item 2.1
  - Sub-item 2.2
- Item 3

### Ordered List

Test ordered list:

1. First item
2. Second item
   1. Sub-item 2.1
   2. Sub-item 2.2
3. Third item

Paragraph after ordered list.

### Task List

Test task list:

- [x] Complete document
- [ ] Test features
- [ ] Release version

Paragraph after task list.

## 9. Figures

Test image:

![Test Image](./example.png)

Test table:

| Left-aligned | Centered | Right-aligned |
|:-------------|:--------:|--------------:|
| Data1        | Data2    | Data3         |
| Data4        | Data5    | Data6         |

Paragraph after table.

## 10. Mathematical Formulas

Inline formula: $E=mc^2$

Block formula:

$$
A = \begin{pmatrix}
1 & 2 \\
3 & 4 \\
\end{pmatrix}
$$

Another block formula:

$$ a^2 + b^2 = c^2 $$

Paragraph after formula.

## 11. Misc

### Collapsable `<details>`

<details><summary>Title: Click to expand/collapse and view details</summary>
Here is the expanded detailed content.

</details>

Paragraph after collapse syntax block.


[gfm-css]: https://github.com/wklchris/markdown-css-for-pandoc
