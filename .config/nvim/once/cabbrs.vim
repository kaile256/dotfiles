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

" Abbr; :checkhealth {{{1
cnoreabbr <silent><expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=nofile' : 'ch'
