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

" TODO: ExAbbr
"command! -nargs=* ExAbbr call <SID>abbr_wrapper(':', alias, command)
"function! s:abbr_wrapper(['type', 'alias', 'command']) abort "{{{
"  cnoreabbr <silent><expr> a:alias (getcmdtype() == 'a:type' && getcmdline() =~ '^a:alias$')? `a:command` : 'a:alias'
"endfunction "}}}
cnoreabbr <silent><expr> ex (getcmdtype() == '=' && getcmdline() =~ '^ex$')? "execute('')<Left><Left>" : 'ex'
cnoreabbr <silent><expr> px (getcmdtype() == ':' && getcmdline() =~ '^px$')? "put =execute('')<Left><Left>" : 'px'
""}}}
" Abbr; rm https://foo/bar/ {{{
cnoreabbr <silent><expr> rmgh (getcmdtype() == ':' && getcmdline() =~ '^rmgh$')? '%s/https:\/\/github.com\///ge' : 'rmgh'
cnoreabbr <silent><expr> rmgl (getcmdtype() == ':' && getcmdline() =~ '^rmgl$')? '%s/https:\/\/gitlab.com\///ge' : 'rmgl'
"}}}
" Abbr; for vimdiff {{{
cnoreabbr <silent><expr> dth (getcmdtype() == ':' && getcmdline() =~ '^dth$')? 'diffthis' : 'dth'
cnoreabbr <silent><expr> dof (getcmdtype() == ':' && getcmdline() =~ '^dof$')? 'diffoff!' : 'dof'
"}}}
" Abbr; Echo file Status {{{
"cnoreabbr <silent><expr> es (getcmdtype() == ':' && getcmdline() =~ '^es$')? 'call <SID>echo_file_info()' : 'es'
"}}}
" Abbr; Before Typo {{{
cnoreabbr <silent><expr> man (getcmdtype() == ':' && getcmdline() =~ '^man$')? 'Man' : 'man'
"}}}
" Abbr; for :!vint {{{
"function! s:call_vint() abort "{{{
"  if &ft ==# 'vim'
"    !vint %:p
"  endif
"endfunction "}}}
cnoreabbr <silent><expr> vin (getcmdtype() == ':' && getcmdline() =~ '^vin$')? "!vint %:p" : 'vin'
"}}}
" Abbr; :tabe {{{
cnoreabbr <silent><expr> b (getcmdtype() == ':' && getcmdline() =~ '^b$')? 'tabe' : 'b'
"}}}
" Abbr; :checkhealth {{{
cnoreabbr <silent><expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=quickfix' : 'ch'
"}}}
" Abbr; :source {{{
cnoreabbr <silent><expr> sj (getcmdtype() == ':' && getcmdline() =~ '^sj$')? 'so % <bar> echo " Sourced! \--" @%' : 'sj'
cnoreabbr <silent><expr> ss (getcmdtype() == ':' && getcmdline() =~ '^ss$')? 'so % <bar> echo " Sourced! \--" @%' : 'ss'
cnoreabbr <silent><expr> sss (getcmdtype() == ':' && getcmdline() =~ '^sss$')? 'so % <bar> echo " Sourced! \--" @%' : 'sss'
"}}}
" Abbr; :help {{{
cnoreabbr <silent><expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbr <silent><expr> bh (getcmdtype() == ':' && getcmdline() =~ '^bh$')? 'tab help' : 'h'
cnoreabbr <silent><expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbr <silent><expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'
"}}}
" Abbr; Open tmp.vim {{{
cnoreabbr <silent><expr> tmp (getcmdtype() == ':' && getcmdline() =~ '^tmp$')? 'e ~/.tmp/tmp.vim' : 'tmp'
cnoreabbr <silent><expr> stm (getcmdtype() == ':' && getcmdline() =~ '^stm$')? 'sp ~/.tmp/tmp.vim' : 'stm'
cnoreabbr <silent><expr> tms (getcmdtype() == ':' && getcmdline() =~ '^tms$')? 'sp ~/.tmp/tmp.vim' : 'tms'
cnoreabbr <silent><expr> vtm (getcmdtype() == ':' && getcmdline() =~ '^vtm$')? 'vs ~/.tmp/tmp.vim' : 'vtm'
cnoreabbr <silent><expr> tmv (getcmdtype() == ':' && getcmdline() =~ '^tmv$')? 'vs ~/.tmp/tmp.vim' : 'tmv'
cnoreabbr <silent><expr> btm (getcmdtype() == ':' && getcmdline() =~ '^btm$')? 'tabe ~/.tmp/tmp.vim' : 'btm'
cnoreabbr <silent><expr> tmb (getcmdtype() == ':' && getcmdline() =~ '^tmb$')? 'tabe ~/.tmp/tmp.vim' : 'tmb'
"}}}
" Abbr; FoldMethod {{{
cnoreabbr <silent><expr> fsy (getcmdtype() == ':' && getcmdline() =~ '^fsy$')? 'setlocal foldmethod=syntax' : 'fsy'
cnoreabbr <silent><expr> fma (getcmdtype() == ':' && getcmdline() =~ '^fma$')? 'setlocal foldmethod=marker' : 'fma'
cnoreabbr <silent><expr> fdm (getcmdtype() == ':' && getcmdline() =~ '^fdm$')? 'setlocal foldmethod=' : 'fdm'
cnoreabbr <silent><expr> ma (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= ma$')? 'marker' : '<BS>ma'
cnoreabbr <silent><expr> sy (getcmdtype() == ':' && getcmdline() =~ '^setlocal foldmethod= sy$')? '<BS>syntax' : 'sy'
"}}}
