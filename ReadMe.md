# Markdown CSS for Pandoc

This repository provides github-flavor Markdown CSS files for the doc converting tool [Pandoc](https://github.com/jgm/pandoc).

The author of this repository imitates the Github-flavor Markdown (GFM) format of these CSS files. These files are not from Github official and the format is not guaranteed to be completely restored.

Table of contents:
- [Using Guide](#using-guide)
- [Known differences with the original GFM](#known-differences-with-the-original-gfm)
- [License](#license)


## Using Guide

Make sure that you have installed [Pandoc](https://github.com/jgm/pandoc/releases).

Download files [gfm.css](./gfm.css) and [gfm-hl.theme](./gfm-hl.theme) from this repository. Run the following command in terminal to convert `input.md` to `output.html`:

```
pandoc input.md -s -c gfm.css -f gfm --highlight-style gfm-hl.theme --mathjax -o output.html 
```

The CSS is tested with Pandoc version 3.6.4.

---

*For developer testing only*: 

```
pandoc test.md -s -c gfm.css -f gfm --highlight-style gfm-hl.theme --mathjax -o test.html
```


## Known differences with the original GFM

Here are some known differences or customization that deviates from the original GFM style.

- Max width: Set to 60em
- Font size for codes (`--code-font-size`): Use 90\%, larger than 85\% 
- Icons of alerts (admonitions): Unicode symbols are used instead of SVG icons

The coding syntax highlighting style [gfm-hl.theme](./gfm-hl.theme) is modified on the top of Pandoc's pygments theme, originally provided by:
```
pandoc -o gfm-hl.theme --print-highlight-style pygments
```

## License

[MIT](./LICENSE)
