let s:black     = [ '#0d0d0d', 232 ]
let s:darkgray  = [ '#3f493e', 237 ]
let s:lightgray = [ '#a29a8f', 247 ]
let s:white     = [ '#f5efd9', 230 ]
let s:red       = [ '#ab4645', 131 ]
let s:green     = [ '#8a9c48', 107 ]
let s:yellow    = [ '#e6bb2e', 178 ]
let s:blue      = [ '#557c9b', 67  ]
let s:magenta   = [ '#574376', 60  ]
let s:cyan      = [ '#42b1e6', 74  ]


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

