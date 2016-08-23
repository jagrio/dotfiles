" Vim color file
" Maintainer:	Piotr Husiatyński <phusiatynski@gmail.com>

set background=dark
set t_Co=256
let g:colors_name="256-jungle"

let python_highlight_all = 1
let c_gnu = 1

hi Normal         ctermfg=253  ctermbg=None cterm=None
hi Cursor         ctermfg=253  ctermbg=57   cterm=None
hi SpecialKey     ctermfg=239  ctermbg=None cterm=None
hi Directory      ctermfg=149  ctermbg=None cterm=Bold
hi ErrorMsg       ctermfg=160  ctermbg=245  cterm=None
hi PreProc        ctermfg=243  ctermbg=None cterm=Bold
hi Search         ctermfg=252  ctermbg=29   cterm=Bold
hi Type           ctermfg=166  ctermbg=None cterm=Bold
hi Statement      ctermfg=172  ctermbg=None cterm=Bold
hi Comment        ctermfg=240  ctermbg=None cterm=None
hi LineNr         ctermfg=244  ctermbg=None cterm=None
hi NonText        ctermfg=105  ctermbg=None cterm=Bold
hi DiffText       ctermfg=165  ctermbg=244  cterm=None
hi Constant       ctermfg=39   ctermbg=None cterm=None
hi Todo           ctermfg=162  ctermbg=None cterm=Bold
hi Identifier     ctermfg=142  ctermbg=None cterm=Bold
hi Error          ctermfg=None ctermbg=196  cterm=Bold
hi Special        ctermfg=172  ctermbg=None cterm=Bold
hi Ignore         ctermfg=221  ctermbg=None cterm=Bold
hi Underline      ctermfg=147  ctermbg=None cterm=Italic
hi Cursorline     ctermfg=None ctermbg=236  cterm=None

hi FoldColumn     ctermfg=245  ctermbg=None cterm=None
hi Folded         ctermfg=245  ctermbg=None cterm=Bold

hi Visual         ctermfg=248  ctermbg=238  cterm=None

hi Pmenu          ctermfg=62   ctermbg=233  cterm=None
hi PmenuSel       ctermfg=69   ctermbg=232  cterm=Bold
hi PmenuSbar      ctermfg=247  ctermbg=233  cterm=Bold
hi PmenuThumb     ctermfg=248  ctermbg=233  cterm=None

hi StatusLineNC   ctermfg=248  ctermbg=239  cterm=None
hi StatusLine     ctermfg=39   ctermbg=239  cterm=None
hi VertSplit      ctermfg=239  ctermbg=239  cterm=None

hi TabLine        ctermfg=245  ctermbg=239  cterm=None
hi TabLineFill    ctermfg=239  ctermbg=239
hi TabLineSel     ctermfg=104  ctermbg=236  cterm=Bold
"vim: sw=4

hi markdownBold   ctermfg=253 ctermbg=None  cterm=Bold 
hi markdownItalic ctermfg=39  ctermbg=None  cterm=None 
hi markdownMath   ctermfg=142 ctermbg=None  cterm=Bold 
hi markdownMath2  ctermfg=142 ctermbg=None  cterm=Bold 

hi DiffAdd        ctermfg=233 ctermbg=119   cterm=none gui=none guifg=233 guibg=119
hi DiffDelete     ctermfg=52  ctermbg=52    cterm=none gui=none guifg=52  guibg=52
hi DiffChange     ctermfg=233 ctermbg=214   cterm=none gui=none guifg=233 guibg=214
hi DiffText       ctermfg=233 ctermbg=202   cterm=none gui=none guifg=233 guibg=202

"syntax include @tex syntax/tex.vim
"syn region displaymaths matchgroup=mkdMaths start="\$" end="\$" contains=@texMathZoneGroup
"syn region inlinemaths matchgroup=mkdMaths start="\$$" end="\$$" contains=@texMathZoneGroup
"hi def link mkdMaths SpecialComment

