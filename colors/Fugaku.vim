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
\ 'black':        { 'gui': '#0d0d0d', 'cterm': '232' },
\ 'darkgray':     { 'gui': '#56564b', 'cterm': '59'  },
\ 'lightgray':    { 'gui': '#988f86', 'cterm': '102' },
\ 'white':        { 'gui': '#ede4cd', 'cterm': '230' },
\ 'red':          { 'gui': '#f19072', 'cterm': '209' },
\ 'lightred':     { 'gui': '#f09199', 'cterm': '210' },
\ 'green':        { 'gui': '#69821b', 'cterm': '64'  },
\ 'lightgreen':   { 'gui': '#d8e698', 'cterm': '186' },
\ 'orange':       { 'gui': '#fe9c41', 'cterm': '215' },
\ 'yellow':       { 'gui': '#ffec47', 'cterm': '227' },
\ 'blue':         { 'gui': '#5a79ba', 'cterm': '67'  },
\ 'lightblue':    { 'gui': '#698aab', 'cterm': '69'  },
\ 'magenta':      { 'gui': '#745399', 'cterm': '96'  },
\ 'lightmagenta': { 'gui': '#9d5b8b', 'cterm': '132' },
\ 'cyan':         { 'gui': '#0094c8', 'cterm': '32'  },
\ 'lightcyan':    { 'gui': '#a0d8ef', 'cterm': '153' },
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
hi CursorLine ctermfg=NONE ctermbg=235 guifg=NONE guibg=#252424 cterm=NONE gui=NONE
call s:X('Directory', 'cyan', '', '')
call s:X('DiffAdd', 'green', '', '')
call s:X('DiffChange', 'blue', '', '')
call s:X('DiffDelete', 'red', '', '')
call s:X('ErrorMsg', 'red', '', '')
call s:X('VertSplit', 'darkgray', 'darkgray', '')
call s:X('Folded', 'white', 'darkgray', '')
call s:X('IncSearch', '', 'white', '')
call s:X('Search', '', 'lightgray', '')
call s:X('LineNr', 'lightgray', '', '')
hi CursorLineNr ctermfg=102 ctermbg=235 guifg=#988f86 guibg=#252424 cterm=NONE gui=NONE
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
call s:X('Comment', 'darkgray', '', '')
call s:X('Constant', 'red', '', '')
call s:X('String', 'lightcyan', '', '')
call s:X('Character', 'lightmagenta', '', '')
call s:X('Number', 'orange', '', '')
call s:X('Boolean', 'red', '', '')

call s:X('Identifier', 'lightmagenta', '', '')
call s:X('Function', 'orange', '', '')

call s:X('Statement', 'lightgreen', '', '')
call s:X('Operator', 'lightgray', '', '')

call s:X('PreProc', 'lightgray', '', '')
call s:X('Type', 'magenta', '', '')
call s:X('Special', 'lightgray', '', '')

call s:X('Underlined', '', '', 'underline')
call s:X('Ignore', 'darkgray', '', '')
call s:X('Error', 'red', '', '')
call s:X('Todo', 'darkgray', 'yellow', '')

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
call s:X('rubySymbol', 'blue', '', '')

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


if exists('g:fugaku_customize')
  function! s:lambda() abort
    for [ l:group, l:def ] in items(g:fugaku_customize)
      for [ l:key, l:var ] in items(l:def)
        execute 'hi '. l:group . ' ' .  l:key . '=' . l:var
      endfor
    endfor
  endfunction
  call s:lambda()
  delfunction s:lambda
endif


delfunction s:X

