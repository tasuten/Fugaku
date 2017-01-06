let s:black     = [ '#0d0d0d', 232 ]
let s:darkgray  = [ '#56564b', 59  ]
let s:lightgray = [ '#988f86', 102 ]
let s:white     = [ '#ede4cd', 230 ]
let s:red       = [ '#f19072', 209 ]
let s:green     = [ '#69821b', 64  ]
let s:yellow    = [ '#ffec47', 227 ]
let s:blue      = [ '#5a79ba', 67  ]
let s:magenta   = [ '#745399', 96  ]
let s:cyan      = [ '#0094c8', 32  ]


let s:p = {'normal': {},  'inactive': {},  'insert': {},  'replace': {},  'visual': {},  'tabline': {}}

" [fg, bg]
let s:p.normal.left     = [[ s:white,     s:blue      ]]
let s:p.normal.middle   = [[ s:white,     s:darkgray  ]]
let s:p.normal.right    = [[ s:white,     s:darkgray  ]]

let s:p.inactive.left   = [[ s:lightgray, s:darkgray  ]]
let s:p.inactive.middle = [[ s:lightgray, s:darkgray  ]]
let s:p.inactive.right  = [[ s:lightgray, s:darkgray  ]]

let s:p.insert.left     = [[ s:white,     s:green     ]]
let s:p.visual.left     = [[ s:white,     s:yellow    ]]
let s:p.replace.left    = [[ s:white,     s:red       ]]


let s:p.tabline.left    = [[ s:lightgray, s:darkgray  ]]
let s:p.tabline.tabsel  = [[ s:white,     s:lightgray ]]
let s:p.tabline.middle  = [[ s:lightgray, s:darkgray  ]]
let s:p.tabline.right   = [[ s:white,     s:darkgray  ]]


let s:p.normal.error    = [[ s:darkgray,  s:red       ]]
let s:p.normal.warning  = [[ s:darkgray,  s:yellow    ]]


let g:lightline#colorscheme#Fugaku#palette = lightline#colorscheme#flatten(s:p)

