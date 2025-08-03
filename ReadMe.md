# Markdown CSS for Pandoc

This repository provides github-flavor Markdown CSS files for the doc converting tool [Pandoc](https://github.com/jgm/pandoc).

The author of this repository imitates the Github-flavor Markdown (GFM) format of these CSS files. These files are not from Github official and the format is not guaranteed to be completely restored.

Table of contents:
- [Online Example](#online-example)
- [Using Guide](#using-guide)
- [Known differences with the original GFM](#known-differences-with-the-original-gfm)
- [License](#license)


## Online Example

A rendered HTML example is online at [the Example webpage of this repo](https://wklchris.github.io/markdown-css-for-pandoc/example.html). The webpage is rendered by the similar command introduced in the following [Using Guide](#using-guide) section.


## Using Guide

Installation:

- Make sure that you have installed [Pandoc](https://github.com/jgm/pandoc/releases).
- Download files [gfm.css](./gfm.css) and [gfm-hl.theme](./gfm-hl.theme) from this repository. 

To convert Markdown to HTML:

1. **Pandoc command**: Run the following command in terminal to convert `input.md` to `output.html`:

```
pandoc input.md -s -c gfm.css -f gfm --highlight-style gfm-hl.theme --mathjax -o output.html 
```

2. **Copy the CSS file**: Keep the file `gfm.css` with your output HTML so that the styling can work.

CSS/theme files provided in this repository are tested under Pandoc version 3.6.4.


## Known differences with the original GFM

Here are some known differences or customization that deviates from the original GFM style. They are features but not bugs, so they are not likely to be 'fixed'.

- Max width: Set to 60em
- Font sizes:
  - Codes (`--code-font-size`): Use `small` instead of `0.875em` 
  - Footnotes at page end: Use `small` instead of `12px`
- Collapse tool (`<details> <summary>`) styles change:
  - Show a left border line to indicate the start/end of the expanded content
  - Show background color for summary text when hover or expanded
- Icons of alerts (admonitions): Unicode symbols are used instead of SVG icons
- Some spacing, border styles, or other visually less impactful details

The coding syntax highlighting style [gfm-hl.theme](./gfm-hl.theme) is modified on the top of Pandoc's pygments theme, originally provided by:

```
pandoc -o gfm-hl.theme --print-highlight-style pygments
```

*Table of Modified Highlighting Styles from the Default Pygments Style*
| Styles (HTML Class) | Properties | Current Values | Original Values |
| :--- | :--- | :---: | :---: |
| Attribute (at) | text-color | `#7d9029` | `#6639ba` |
| BuiltIn (bu), Import (im) | text-color | `#6639ba` | `#008000` |
| Annotation, Comment (co), CommentVar, Information, Warning | text-color | `#59636e` | `#60a0b0` |
| ControlFlow (cf), Keyword (kw), Other | text-color | `#cf222e` | `#007020` |
| BaseN, Decval (dv), Float (fl) | text-color | `#0550ae` | `#40a070` |
| \^ Char, SpecialChar, String (st), VerbatimString | text-color | `#0e7615` | `#4070a0` |
| Operator (op) | text-color | `#6639ba` | `#666666` |
| Variable (va) | text-color | `#0550ae` | `#19177c` |

\^ *Different taste from GFM.*

## License

[MIT](./LICENSE)
