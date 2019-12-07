" From: init.vim
" Ref: cmaps.vim
" Ref: commands.vim

"augroup myCmdLineOptimization
"  au! CmdlineChanged * call s:cmdline_optimize()
"augroup END
"function! s:cmdline_optimize() abort "{{{1
"  if getcmdline() =~# '\\V'
"    let s = substitute(getcmdline(), '\\V', '', 'ge')
"  endif
"endfunction

" Abbr; for vimdiff {{{1
cnoreabbr <expr> dth (getcmdtype() == ':' && getcmdline() =~ '^dth$')? 'diffthis' : 'dth'
cnoreabbr <expr> dof (getcmdtype() == ':' && getcmdline() =~ '^dof$')? 'diffoff!' : 'dof'
" Abbr; Before Typo {{{1
cnoreabbr <expr> man (getcmdtype() == ':' && getcmdline() =~ '^man$')? 'Man' : 'man'
"}}}
" Abbr; :checkhealth {{{1
cnoreabbr <silent><expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=nofile' : 'ch'
" Abbr; :help {{{1
cnoreabbr <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbr <expr> bh (getcmdtype() == ':' && getcmdline() =~ '^bh$')? 'tab help' : 'h'
cnoreabbr <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbr <expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'
" Abbr; FoldMethod {{{1
cnoreabbr <expr> ma  (getcmdtype() == ':' && getcmdline() =~ '^se fdm=ma$')?  'marker' : 'ma'
cnoreabbr <expr> mar (getcmdtype() == ':' && getcmdline() =~ '^se fdm=mar$')? 'marker' : 'mar'
cnoreabbr <expr> sy  (getcmdtype() == ':' && getcmdline() =~ '^se fdm=sy$')?  'syntax' : 'sy'
cnoreabbr <expr> syn (getcmdtype() == ':' && getcmdline() =~ '^se fdm=syn$')? 'syntax' : 'syn'
