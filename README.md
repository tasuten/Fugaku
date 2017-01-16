# Fugaku
The colorscheme using Japanese Traditional Colors

<!--You can see screenshots on [GitHub Pages](http://tasuten.github.io/Fugaku/)-->

## What's the meaning of "Fugaku" ?
**Fugaku** (富嶽) is another name of Mt. Fuji.

I picked up this word from  *Fugaku sanju-roku-kei* (富嶽三十六景, Thirty-six Views of Mount Fuji), a ukiyo-e series by Hokusai.

All colors of this colorscheme were picked from [Japanese Traditional Colors](http://irocore.com/).


## Usage
### iTerm2 colorscheme
Import `Fugaku.itermcolors` from iTerm2's preference.

### Vim colorscheme
#### Install
``` vim
" Install by the way you'd like to. e.g.) Vundle, NeoBundle, vim-plug

" If you'd like to set option variables, write them before `colorscheme Fugaku`
" e.g.)
" let g:fugaku_use_terminal_background_color = 1

colorscheme Fugaku

" If you'd also like to use lightline colorscheme
" lightline.vim
if !exists('g:lightline')
  let g:lightline = {}
endif
let g:lightline.colorscheme = 'Fugaku'
```

#### Options

##### Custom highlights
If you wanna tweak highlight colors and attrs, I recommend to use `g:fugaku_customize`. This feature is inspired by [nanotech/jellybeans.vim](https://github.com/nanotech/jellybeans.vim).

``` vim
if !exists('g:fugaku_customize')
  let g:fugaku_customize = {}
endif
let g:fugaku_customize.Visual = {
\ 'ctermfg' : 42, 'ctermbg' : 142, 'cterm' : 'underline',
\ 'guifg' : '#123456',  'guibg' : '#abcdef', 'gui': 'underline'
\ }
```

##### Using terminal emulator's background color

``` vim
let g:fugaku_use_terminal_background_color = 1
```

##### Using termianl emulator's color palette
If you'd like to use truely same color in terminal emulator and GVim,
and you use iTerm2 colorscheme, use this option.

``` vim
let g:fugaku_use_terminal_colors = 1
```


## Contribution
Issue, PullReq, or contact with me from [Twitter@tasuten](https://twitter.com/tasuten) in Japanese or English.


## License
[The Unlicense](http://unlicense.org/). See LICENSE file.


## Related works
- Japanesque
    -  iTerm2 Theme
        - https://github.com/aereal/dotfiles/tree/master/colors/Japanesque
    -  Vim colorscheme
        -  https://github.com/aereal/vim-colors-japanesque



