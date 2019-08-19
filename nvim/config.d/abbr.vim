"""" Memo: abbr.wiki

cnoreabbrev <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbrev <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vsplit +help\' : 'h'

"noreabbrev <expr> : (getline('.') =~ '^\:$')? '<c-\><c-n>:' : ':'

let $TERM = 'bash'
