let s:black     = [ '#0C0C0C', 232 ]
let s:darkgray  = [ '#595455', 59 ]
let s:lightgray = [ '#BCB09C', 145 ]
let s:white     = [ '#F7EFE3', 230 ]
let s:red       = [ '#B23E52', 131 ]
let s:green     = [ '#8CB155', 107 ]
let s:yellow    = [ '#D9972F', 172 ]
let s:blue      = [ '#6C9BD2', 74  ]
let s:magenta   = [ '#8C6589', 96  ]
let s:cyan      = [ '#7EC7D8', 116  ]


let s:p = {'normal': {},  'inactive': {},  'insert': {},  'replace': {},  'visual': {},  'tabline': {}}

" [fg, bg]
let s:p.normal.left     = [[ s:white,     s:blue      ]]
let s:p.normal.middle   = [[ s:white,     s:darkgray  ]]
let s:p.normal.right    = [[ s:white,     s:darkgray  ]]

let s:p.inactive.left   = [[ s:lightgray, s:darkgray  ]]
let s:p.inactive.middle = [[ s:lightgray, s:darkgray  ]]
let s:p.inactive.right  = [[ s:lightgray, s:darkgray  ]]

let s:p.insert.left     = [[ s:black,     s:green     ]]
let s:p.visual.left     = [[ s:darkgray,  s:yellow    ]]
let s:p.replace.left    = [[ s:white,     s:red       ]]

let s:p.tabline.left    = [[ s:lightgray, s:darkgray  ]]
let s:p.tabline.tabsel  = [[ s:white,     s:lightgray ]]
let s:p.tabline.middle  = [[ s:lightgray, s:darkgray  ]]
let s:p.tabline.right   = [[ s:white,     s:darkgray  ]]


let s:p.normal.error    = [[ s:white,     s:red       ]]
let s:p.normal.warning  = [[ s:darkgray,  s:yellow    ]]


let g:lightline#colorscheme#Fugaku#palette = lightline#colorscheme#flatten(s:p)

