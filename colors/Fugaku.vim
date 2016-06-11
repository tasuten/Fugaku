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

