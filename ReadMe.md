# Markdown CSS for Pandoc

This repository provides github-flavor Markdown CSS files for the doc converting tool [Pandoc](https://github.com/jgm/pandoc).

The author of this repository imitates the Github-style Markdown format of these CSS files. These files are not from Github official and the format is not guaranteed to be completely restored.


## Using Guide

Make sure that you have installed [Pandoc](https://github.com/jgm/pandoc/releases).

Download the [gfm.css](./gfm.css) file from this repository. Run the following command in terminal to convert `input.md` to `output.html`:

```
pandoc input.md -s -c gfm.css -f gfm --mathjax -o output.html 
```

The CSS is tested with Pandoc version 3.6.4.

---

*For developer testing only*: 

```
pandoc test.md -s -c gfm.css -f gfm --mathjax -o test.html
```


## License

[MIT](./LICENSE)
