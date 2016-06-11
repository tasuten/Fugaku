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
\ 'black':     { 'gui': '#0d0d0d', 'cterm': '232' },
\ 'darkgray':  { 'gui': '#3f493e', 'cterm': '237' },
\ 'lightgray': { 'gui': '#a29a8f', 'cterm': '247' },
\ 'white':     { 'gui': '#f5efd9', 'cterm': '230' },
\ 'red':       { 'gui': '#ce2b1f', 'cterm': '160' },
\ 'green':     { 'gui': '#8a9c48', 'cterm': '107' },
\ 'yellow':    { 'gui': '#e6bb2e', 'cterm': '178' },
\ 'blue':      { 'gui': '#557c9b', 'cterm': '67' },
\ 'magenta':   { 'gui': '#574376', 'cterm': '60' },
\ 'cyan':      { 'gui': '#42b1e6', 'cterm': '74' },
\}

if exists('g:fugaku_use_terminal_colors') && g:fugaku_use_terminal_colors == 1
  let p = copy(s:palette)
  for color in keys(p)
    let p[color]['cterm'] = color
  endfor
  let s:palette = p
  unlet color
  unlet p
endif


if !exists('g:fugaku_use_terminal_background_color')
  let g:fugaku_use_terminal_background_color = 0
endif

function! s:X(group, fg, bg) abort
  let l:fg_exists = !empty(a:fg)
  let l:bg_exists = !empty(a:bg)


  if l:fg_exists && l:bg_exists
    let l:ctermfg = s:palette[a:fg]['cterm']
    let l:ctermbg = s:palette[a:bg]['cterm']
    let l:guifg = s:palette[a:fg]['gui']
    let l:guibg = s:palette[a:bg]['gui']
  elseif l:fg_exists && !l:bg_exists
    let l:ctermfg = s:palette[a:fg]['cterm']
    let l:ctermbg = 'NONE'
    let l:guifg = s:palette[a:fg]['gui']
    let l:guibg = 'NONE'
  elseif !l:fg_exists && l:bg_exists
    let l:ctermfg = 'NONE'
    let l:ctermbg = s:palette[a:bg]['cterm']
    let l:guifg = 'NONE'
    let l:guibg = s:palette[a:bg]['gui']
  else
    let l:ctermfg = 'NONE'
    let l:ctermbg = 'NONE'
    let l:guifg = 'NONE'
    let l:guibg = 'NONE'
  endif

  execute 'hi '.a:group.' ctermfg='.l:ctermfg.' ctermbg='.l:ctermbg.
  \                     ' guifg='.l:guifg.    ' guibg='.l:guibg
endfunction

if g:fugaku_use_terminal_background_color
  call s:X('Normal', 'white', '')
else
  call s:X('Normal', 'white', 'black')
endif

delfunction s:X
