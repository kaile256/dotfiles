" From: init.vim

" Keymap; Leap {{{
cnoremap <nowait> <a-k> <c-c>
"}}}
" Keymap; Expand {{{
cnoremap <c-r>a     <c-r><c-a>
cnoremap <c-r>f     <c-r><c-f>
cnoremap <c-r>p     <c-r><c-p>
cnoremap <c-r>l     <c-r><c-l>
cnoremap <c-r>w     <c-r><c-w>
"}}}
" Keymap; Emacs-like {{{
cnoremap <c-a> <home>
cnoremap <a-f> <S-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-b> <S-left>
cnoremap <c-d> <Del>
"}}}

"augroup AutoMkdirSuggestionOnSave "{{{
"  au!
"  function! s:auto_suggest_mkdir(dir, force) "{{{
"    if !isdirectory(a:dir) && (a:force ||
"          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction "}}}
"  au BufWritePre * call <SID>auto_suggest_mkdir(expand('<afile>:p:h'), v:cmdbang)
"augroup END "}}}

" Abbr; =execute() {{{
function! s:my_register_as_executed(cmd)
  " Ref: sneak.vim
  copen
  setl modifiable
  put =execute('a:cmd')
endfunction
command! PrintExecuted :<c-u>call <SID>my_print_on_qf()
" TODO: ExAbbr
"command! -nargs=* ExAbbr call <SID>abbr_wrapper(':', alias, command)
"function! s:abbr_wrapper(['type', 'alias', 'command']) abort
"  cnoreabbr <expr> a:alias (getcmdtype() == 'a:type' && getcmdline() =~ '^a:alias$')? `a:command` : 'a:alias'
"endfunction
cnoreabbr <expr> ex (getcmdtype() == '=' && getcmdline() =~ '^ex$')? "execute('')<Left><Left>" : 'ex'
cnoreabbr <expr> px (getcmdtype() == ':' && getcmdline() =~ '^px$')? "put =execute('')<Left><Left>" : 'px'
function! s:call_vint() abort
  if &ft ==# 'vim'
    !vint %:p
  endif
endfunction "}}}
" Abbr; for :!vint {{{
cnoreabbr <expr> vin (getcmdtype() == ':' && getcmdline() =~ '^vin$')? "!vint %:p" : 'vin'
"}}}
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
cnoreabbr <expr> stm (getcmdtype() == ':' && getcmdline() =~ '^stm$')? 'sp ~/.tmp/tmp.vim' : 'stm'
cnoreabbr <expr> tms (getcmdtype() == ':' && getcmdline() =~ '^tms$')? 'sp ~/.tmp/tmp.vim' : 'tms'
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
