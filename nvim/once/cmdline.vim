" From: init.vim

" Keymap; Leap {{{
cnoremap <nowait> <a-k> <c-c>
"}}}
" Keymap; Completion {{{
cnoremap <c-r>a     <c-r><c-a>
cnoremap <c-r>f     <c-r><c-f>
cnoremap <c-r>p     <c-r><c-p>
cnoremap <c-r>l     <c-r><c-l>
cnoremap <c-r>w     <c-r><c-w>
"}}}

function! s:my_register_as_executed(cmd)
  " Ref: sneak.vim
  copen
  setl modifiable
  put =execute('a:cmd')
endfunction
command! PrintExecuted :<c-u>call <SID>my_print_on_qf()

function! s:my_print_executed_on_qf(cmd)
  " Ref: sneak.vim
  copen
  setl modifiable
  put =execute('a:cmd')
endfunction
command! PrintExecuted :<c-u>call <SID>my_print_on_qf()

"augroup AutoSuggestMkdir
"  au!
"  function! s:auto_suggest_mkdir(dir, force) "{{{
"    if !isdirectory(a:dir) && (a:force ||
"          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction "}}}
"  au BufWritePre * call <SID>auto_suggest_mkdir(expand('<afile>:p:h'), v:cmdbang)
"augroup END

cnoreabbr <expr> px (getcmdtype() == ':' && getcmdline() =~ '^px$')? "put =execute('')<Left><Left>" : 'px'

" Abbr; for vimdiff {{{
cnoreabbr <expr> dth (getcmdtype() == ':' && getcmdline() =~ '^dth$')? 'diffthis' : 'dth'
cnoreabbr <expr> dof (getcmdtype() == ':' && getcmdline() =~ '^dof$')? 'diffoff!' : 'dof'
"}}}
" Abbr; Echo file Status {{{
"cnoreabbr <expr> es (getcmdtype() == ':' && getcmdline() =~ '^es$')? 'call <SID>echo_file_info()' : 'es'
"}}}
" Abbr; Before Typo {{{
cnoreabbr <expr> man (getcmdtype() == ':' && getcmdline() =~ '^man$')? 'Man' : 'man'
"}}}
" Abbr; :tabe {{{
cnoreabbr <expr> b (getcmdtype() == ':' && getcmdline() =~ '^b$')? 'tabe' : 'b'
"}}}
" Abbr; :checkhealth {{{
cnoreabbr <expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=quickfix' : 'ch'
"}}}
" Abbr; :source {{{
cnoreabbr <expr> sj (getcmdtype() == ':' && getcmdline() =~ '^sj$')? 'so % <bar> echo " Sourced! \--" @%' : 'sj'
cnoreabbr <expr> ss (getcmdtype() == ':' && getcmdline() =~ '^ss$')? 'so % <bar> echo " Sourced! \--" @%' : 'ss'
cnoreabbr <expr> sss (getcmdtype() == ':' && getcmdline() =~ '^sss$')? 'so % <bar> echo " Sourced! \--" @%' : 'sss'
"}}}
" Abbr; :help {{{
cnoreabbr <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbr <expr> bh (getcmdtype() == ':' && getcmdline() =~ '^bh$')? 'tab help' : 'h'
cnoreabbr <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbr <expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'
"}}}
" Abbr; Open tmp.vim {{{
cnoreabbr <expr> tmp (getcmdtype() == ':' && getcmdline() =~ '^tmp$')? 'e ~/.tmp/tmp.vim' : 'tmp'
cnoreabbr <expr> htm (getcmdtype() == ':' && getcmdline() =~ '^htm$')? 'sp ~/.tmp/tmp.vim' : 'htm'
cnoreabbr <expr> tmh (getcmdtype() == ':' && getcmdline() =~ '^tmh$')? 'sp ~/.tmp/tmp.vim' : 'tmh'
cnoreabbr <expr> vtm (getcmdtype() == ':' && getcmdline() =~ '^vtm$')? 'vs ~/.tmp/tmp.vim' : 'vtm'
cnoreabbr <expr> tmv (getcmdtype() == ':' && getcmdline() =~ '^tmv$')? 'vs ~/.tmp/tmp.vim' : 'tmv'
cnoreabbr <expr> btm (getcmdtype() == ':' && getcmdline() =~ '^btm$')? 'tabe ~/.tmp/tmp.vim' : 'btm'
cnoreabbr <expr> tmb (getcmdtype() == ':' && getcmdline() =~ '^tmb$')? 'tabe ~/.tmp/tmp.vim' : 'tmb'
"}}}
" Abbr; FoldMethod {{{
cnoreabbr <expr> fsy (getcmdtype() == ':' && getcmdline() =~ '^fsy$')? 'setlocal foldmethod=syntax' : 'fsy'
cnoreabbr <expr> fma (getcmdtype() == ':' && getcmdline() =~ '^fma$')? 'setlocal foldmethod=marker' : 'fma'
cnoreabbr <expr> fdm (getcmdtype() == ':' && getcmdline() =~ '^fdm$')? 'setlocal foldmethod=' : 'fdm'
cnoreabbr <expr> ma (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= ma$')? 'marker' : '<BS>ma'
cnoreabbr <expr> sy (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= sy$')? '<BS>syntax' : 'sy'
"}}}
