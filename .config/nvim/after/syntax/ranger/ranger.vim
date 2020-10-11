" Wiki: https://github.com/ranger/ranger/wiki
" Ref: $VIMRUNTIME/syntax/vim.vim -- Syntax for vimscripts
" Ref: $XDG_CONFIG_HOME/ranger/rc.conf

if exists('b:current_syntax') | finish | endif

syn match rangerComment '#.*'

syn keyword rangerCommand
      \ set
      \ eval
      \ alias

" Maps {{{2
syn match rangerMap    "\<map\>!\=\ze\s*[^(]" skipwhite nextgroup=rangerMapLhs
syn keyword rangerMap
      \ skipwhite
      \ nextgroup=rangerMapLhs
      \
      \ map
      \ pmap
      \ tmap
      \ cmap
      \ copymap
      \ copypmap
      \ copytmap
      \ copycmap

syn keyword rangerMap    mapc[lear] smapc[lear]
" TODO: consider Angle-bracket Notation like <Plug> in vimNotation
syn match rangerCtrlChar  "[--]"
syn match rangerNotation "\%#=1\(\\\|<lt>\)\=<\([scamd]-\)\{0,4}x\=\(f\d\{1,2}\|[^ \t:]\|cmd\|cr\|lf\|linefeed\|return\|k\=del\%[ete]\|bs\|backspace\|tab\|esc\|right\|left\|help\|undo\|insert\|ins\|mouse\|k\=home\|k\=end\|kplus\|kminus\|kdivide\|kmultiply\|kenter\|kpoint\|space\|k\=\(page\)\=\(\|down\|up\|k\d\>\)\)>" contains=rangerBracket
syn match	rangerBracket contained	"[\\<>]"

syn match rangerMapLhs contained "\S\+" contains=rangerNotation,rangerCtrlChar skipwhite nextgroup=rangerMapRhs
syn match rangerMapRhs contained ".*" contains=rangerNotation,rangerCtrlChar skipnl nextgroup=rangerMapRhsExtend
syn match rangerMapRhsExtend contained "^\s*\\.*$"     contains=rangerContinue
syn case ignore
syn keyword rangerMapModKey  contained buffer  expr  leader  localleader nowait  plug  script  sid silent  unique
syn case match

hi link rangerCommand Statement
hi link rangerMap rangerCommand

hi link rangerComment Comment

hi link rangerCtrlChar SpecialChar

let b:current_syntax = 'ranger'
