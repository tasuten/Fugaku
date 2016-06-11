" This colorscheme is for GUI and 256color
if !has('gui_running') && &t_Co < 256
  echomsg 'Fugaku colorscheme does not work in low-color environments.'
  finish
endif

let g:colors_name = 'Fugaku'
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let s:palette = {
\ 'black':     { 'gui': '0d0d0d', 'cterm': '232' },
\ 'darkgray':  { 'gui': '3f493e', 'cterm': '59'  },
\ 'lightgray': { 'gui': 'a29a8f', 'cterm': '102' },
\ 'white':     { 'gui': 'f5efd9', 'cterm': '230' },
\ 'red':       { 'gui': 'ce2b1f', 'cterm': '160' },
\ 'green':     { 'gui': '8a9c48', 'cterm': '107' },
\ 'yellow':    { 'gui': 'e6bb2e', 'cterm': '178' },
\ 'blue':      { 'gui': '557c9b', 'cterm': '67' },
\ 'magenta':   { 'gui': '574376', 'cterm': '60' },
\ 'cyan':      { 'gui': '42b1e6', 'cterm': '74' },
\}

