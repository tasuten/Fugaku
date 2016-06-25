" This colorscheme is for GUI and 256color
if !has('gui_running') && &t_Co < 256
  echomsg 'Fugaku colorscheme does not work in low-color environments.'
  finish
endif

let g:colors_name = 'Fugaku'
set background=dark
highlight clear

if exists('syntax_on')
  syntax reset
endif

let s:palette = {
\ 'black':     { 'gui': '#0d0d0d', 'cterm': '232' },
\ 'darkgray':  { 'gui': '#3f493e', 'cterm': '237' },
\ 'lightgray': { 'gui': '#a29a8f', 'cterm': '247' },
\ 'white':     { 'gui': '#f5efd9', 'cterm': '230' },
\ 'red':       { 'gui': '#ab4645', 'cterm': '131' },
\ 'green':     { 'gui': '#8a9c48', 'cterm': '107' },
\ 'yellow':    { 'gui': '#e6bb2e', 'cterm': '178' },
\ 'blue':      { 'gui': '#557c9b', 'cterm': '67' },
\ 'magenta':   { 'gui': '#574376', 'cterm': '60' },
\ 'cyan':      { 'gui': '#42b1e6', 'cterm': '74' },
\}

" If the value is true(1), it uses terminal emulator's colors.
" Cterm-colors in s:palette are nearby colors, not real colors
" If you can edit the terminal-emulator's color palette
" and you'd like to use real colors, use below option
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

function! s:X(group, fg, bg, attr) abort
  let l:fg_assigned = !empty(a:fg)
  let l:bg_assigned = !empty(a:bg)
  let l:attr_assigned = !empty(a:attr)

  if l:fg_assigned && l:bg_assigned
    let l:ctermfg = s:palette[a:fg]['cterm']
    let l:ctermbg = s:palette[a:bg]['cterm']
    let l:guifg = s:palette[a:fg]['gui']
    let l:guibg = s:palette[a:bg]['gui']
  elseif l:fg_assigned && !l:bg_assigned
    let l:ctermfg = s:palette[a:fg]['cterm']
    let l:ctermbg = 'NONE'
    let l:guifg = s:palette[a:fg]['gui']
    let l:guibg = 'NONE'
  elseif !l:fg_assigned && l:bg_assigned
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

  if l:attr_assigned
    let l:attr = a:attr
  else
    let l:attr = 'NONE'
  endif

  execute 'hi '.a:group.' ctermfg='.l:ctermfg.' ctermbg='.l:ctermbg.
  \                     ' guifg='.l:guifg.    ' guibg='.l:guibg.
  \                     ' cterm='.l:attr.     ' gui='.l:attr
endfunction

if g:fugaku_use_terminal_background_color
  call s:X('Normal', 'white', '', '')
else
  call s:X('Normal', 'white', 'black', '')
endif

" Vim UI
call s:X('Conceal', 'darkgray', '', '')
call s:X('Cursor', '', '', 'reverse')
hi CursorLine ctermfg=NONE ctermbg=233 guifg=NONE guibg=#121212 cterm=NONE gui=NONE
call s:X('Directory', 'cyan', '', '')
call s:X('DiffAdd', 'green', '', '')
call s:X('DiffChange', 'blue', '', '')
call s:X('DiffDelete', 'red', '', '')
call s:X('ErrorMsg', 'red', '', '')
call s:X('VertSplit', 'white', 'white', '')
call s:X('Folded', 'white', 'darkgray', '')
call s:X('IncSearch', '', 'white', '')
call s:X('Search', '', 'lightgray', '')
call s:X('LineNr', 'lightgray', '', '')
hi CursorLineNr ctermfg=247 ctermbg=233 guifg=#a29a8f guibg=#121212 cterm=NONE gui=NONE
call s:X('MatchParen', '', '', 'reverse')
hi link ModeMsg Normal
call s:X('MoreMsg', 'green', '', '')
call s:X('NonText', 'darkgray', '', '')
call s:X('Pmenu', 'white', 'darkgray', '')
call s:X('PmenuSel', 'darkgray', 'white', '')
call s:X('PmenuSbar', 'darkgray', 'darkgray', '')
call s:X('PmenuThumb', 'white', 'white', '')
call s:X('Question', 'green', '', '')
call s:X('SpecialKey', 'darkgray', '', '')
call s:X('StatusLine', 'black', 'white', '')
call s:X('StatusLineNC', 'lightgray', 'darkgray', '')
call s:X('TabLine', 'lightgray', 'darkgray', '')
call s:X('TabLineFill', '', 'black', '')
call s:X('TabLineSel', 'black', 'white', '')
call s:X('Title', 'blue', '', '')
call s:X('Visual', 'black', 'white', '')
call s:X('WarningMsg', 'red', '', '')
call s:X('WildMenu', 'white', 'darkgray', '')


" syntax highlights
hi Comment ctermfg=241 ctermbg=NONE guifg=#626262 guibg=NONE cterm=NONE gui=NONE
call s:X('Constant', 'red', '', '')
call s:X('String', 'cyan', '', '')
call s:X('Character', 'yellow', '', '')
call s:X('Number', 'red', '', '')
call s:X('Boolean', 'red', '', '')

call s:X('Identifier', 'green', '', '')
call s:X('Function', 'blue', '', '')

call s:X('Statement', 'magenta', '', '')
call s:X('Operator', 'lightgray', '', '')

call s:X('PreProc', 'magenta', '', '')
call s:X('Type', 'yellow', '', '')
call s:X('Special', 'lightgray', '', '')

call s:X('Underlined', '', '', 'underline')
call s:X('Ignore', 'darkgray', '', '')
call s:X('Error', 'red', '', '')
call s:X('Todo', '', 'yellow', '')

" diff
hi link diffAdded DiffAdd
hi link diffChanged DiffChange
hi link diffRemoved DiffDelete
hi link diffFile diffComment

" Vim script
hi link vimAutoEvent Identifier
hi link vimGroup Constant
hi link vimHiTerm Identifier
hi link vimSpecial Special

" vim-help
hi link helpOption Statement

" Perl
hi link perlSharpBang Comment

" Ruby
hi link rubySharpBang Comment
call s:X('rubyClass', 'red', '', '')
call s:X('rubyModule', 'green', '', '')
call s:X('rubyDefine', 'cyan', '', '')
hi link rubyClassVariable rubyClass
call s:X('rubyInstanceVariable', 'blue', '', '')
hi rubySymbol ctermfg=109 ctermbg=NONE guifg=#7fabb6 guibg=NONE cterm=NONE gui=NONE

" Erlang
hi link erlangAtom rubySymbol

" Elixir
hi link elixirAtom rubySymbol

" Java
hi link javaClassDecl rubyClass

" HTML
hi link htmlArg Identifier
hi link htmlEndTag htmlTag
hi link htmlTag Conceal

" XML
hi link xmlAttrib Identifier
hi link xmlTagName xmlTag
hi link xmlEndTag xmlTag
hi link xmlTag Statement

" Markdown
hi link markdownCode Comment
hi link markdownCodeBlock Comment
call s:X('markdownLinkText', 'cyan', '', 'underline')

" zsh
call s:X('zshSubstDelim', 'yellow', '', '')

" git
call s:X('gitcommitBranch', 'cyan', '', '')
hi link gitcommitSelectedType Conceal

delfunction s:X

