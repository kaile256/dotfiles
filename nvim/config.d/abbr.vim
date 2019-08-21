"""" Memo: abbr.wiki

cnoreabbrev <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbrev <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vsplit +help\' : 'h'

"noreabbrev <expr> : (getline('.') =~ '^\:$')? '<c-\><c-n>:' : ':'

augroup TypoOnToml "{{{
  au!

  au FileType toml abbr "{{{ #{{{
  au FileType toml abbr "}}} #}}}
augroup END

let $TERM = 'bash'
