"""" Memo: abbr.wiki

cnoreabbrev <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbrev <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbrev <expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'

"noreabbrev <expr> : (getline('.') =~ '^\:$')? '<c-\><c-n>:' : ':'

augroup TypoOnToml "{{{
  au!

  au FileType toml inoreabbr "{{{ #{{{
  au FileType toml inoreabbr "}}} #}}}
augroup END
