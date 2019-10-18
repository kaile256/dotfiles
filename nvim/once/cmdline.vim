" From: init.vim

command! -bar EmojiTest tabedit https://unicode.org/Public/emoji/12.0/emoji-test.txt

" Keymap; Emacs-like {{{1
cnoremap <c-a> <home>
cnoremap <a-f> <S-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-b> <S-left>
cnoremap <c-d> <Del>
" Keymap; completion {{{1
" Mnemonic: Buffer's name
cnoremap <c-x><c-b> <c-r>=expand('%:t')<cr>
cnoremap <c-x><c-x> <c-r>=expand('%:t')<cr>
" Mnemonic: Absolute path
cnoremap <c-x><c-a> <c-r>=expand('%:p')<cr>
" Mnemonic: Directory
cnoremap <c-x><c-d> <c-r>=expand('%:p:h')<cr>
cnoremap <c-x><c-c> ~/.cache/
cnoremap <c-x><c-f> ~/.config/
"augroup AutoMkdirSuggestionOnSave "{{{1
"  au!
"  function! s:auto_suggest_mkdir(dir, force) "{{{
"    if !isdirectory(a:dir) && (a:force ||
"          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction "}}}
"  au BufWritePre * call <SID>auto_suggest_mkdir(expand('<afile>:p:h'), v:cmdbang)
"augroup END
"}}}
" Command; Open parent directory {{{1
command! E :e    %:p:h
command! V :vs   %:p:h
command! S :sp   %:p:h
"command! T :tabe %:p:h
" TODO: work no-bang ver. correct.
command! -bang -bar Cd call <SID>cd_bang(<bang>0? 'bang' : 'nobang')
command! -bang -bar CD call <SID>cd_bang(<bang>0? 'bang' : 'nobang')
function! s:cd_bang(bang) abort
  if a:bang ==# 'nobang'
    cd %:p:h
  elseif a:bang ==# 'bang'
    !cd %:p:h
  else
    echo ' Wants whether <bang> or not.'
  endif
endfunction
" Abbr; :! {{{1
cnoreabbr <expr> !
      \ (getcmdtype() == ':' && getcmdline() =~ '^!$')?
      \ (&l:ft ==# 'vim')? 'w<cr> :so <c-r>=expand("%:p")<cr>':
      \ (&l:ft =~# 'html')? ':OpenBrowser <c-r>=expand("%:p")<cr>':
      \ '! %:p' :
       \ '!'
" Abbr; rm https://foo/bar {{{1
cnoreabbr <expr> rmgh (getcmdtype() == ':' && getcmdline() =~ '^rmgh$')? '%s/https:\/\/github.com\///ge' : 'rmgh'
cnoreabbr <expr> rmgl (getcmdtype() == ':' && getcmdline() =~ '^rmgl$')? '%s/https:\/\/gitlab.com\///ge' : 'rmgl'
" Abbr; for vimdiff {{{1
cnoreabbr <expr> mks (getcmdtype() == ':' && getcmdline() =~ '^mks$')? 'mks '. g:data_home . 'nvim/session/' : 'mks'
" Abbr; =execute() {{{1
function! s:my_register_as_executed(cmd) "{{{
  " Ref: sneak.vim
  copen
  setl modifiable
  put =execute('a:cmd')
endfunction "}}}
command! PrintExecuted :<c-u>call <SID>my_print_on_qf()
" TODO: ExAbbr
"command! -nargs=* ExAbbr call <SID>abbr_wrapper(':', alias, command)
"function! s:abbr_wrapper(['type', 'alias', 'command']) abort
"  cnoreabbr <expr> a:alias (getcmdtype() == 'a:type' && getcmdline() =~ '^a:alias$')? `a:command` : 'a:alias'
"endfunction
cnoreabbr <expr> ex (getcmdtype() == '=' && getcmdline() =~ '^ex$')? "execute('')<Left><Left>" : 'ex'
cnoreabbr <expr> px (getcmdtype() == ':' && getcmdline() =~ '^px$')? "put =execute('')<Left><Left>" : 'px'
" Abbr; for vimdiff {{{1
cnoreabbr <expr> dth (getcmdtype() == ':' && getcmdline() =~ '^dth$')? 'diffthis' : 'dth'
cnoreabbr <expr> dof (getcmdtype() == ':' && getcmdline() =~ '^dof$')? 'diffoff!' : 'dof'
" Abbr; Before Typo {{{1
cnoreabbr <expr> man (getcmdtype() == ':' && getcmdline() =~ '^man$')? 'Man' : 'man'
"}}}
" Abbr; for :!vint {{{1
command! Vint :w <bar> !vint %:p
cnoreabbr <expr> vin  (getcmdtype() == ':' && getcmdline() =~ '^vin$')? "w <bar> !vint %:p" : 'vin'
cnoreabbr <expr> vint (getcmdtype() == ':' && getcmdline() =~ '^vin$')? "w <bar> !vint %:p" : 'vint'
" Abbr; :checkhealth {{{1
cnoreabbr <expr> ch (getcmdtype() == ':' && getcmdline() =~ '^ch$')? 'checkhealth <bar> setl bt=quickfix' : 'ch'
" Abbr; :source {{{1
cnoreabbr <expr> sj (getcmdtype() == ':' && getcmdline() =~ '^sj$')? 'so % <bar> echo " Sourced! \--" @%' : 'sj'
cnoreabbr <expr> ss (getcmdtype() == ':' && getcmdline() =~ '^ss$')? 'so % <bar> echo " Sourced! \--" @%' : 'ss'
cnoreabbr <expr> sss (getcmdtype() == ':' && getcmdline() =~ '^sss$')? 'so % <bar> echo " Sourced! \--" @%' : 'sss'
" Abbr; :help {{{1
cnoreabbr <expr> hb (getcmdtype() == ':' && getcmdline() =~ '^hb$')? 'tab help' : 'h'
cnoreabbr <expr> bh (getcmdtype() == ':' && getcmdline() =~ '^bh$')? 'tab help' : 'h'
cnoreabbr <expr> hv (getcmdtype() == ':' && getcmdline() =~ '^hv$')? 'vert bel help' : 'h'
cnoreabbr <expr> vh (getcmdtype() == ':' && getcmdline() =~ '^vh$')? 'vert bel help' : 'h'
" Abbr; Open tmp.vim {{{1
" TODO: add the time on tmpfile name via `:exe`.
cnoreabbr <expr> tmp (getcmdtype() == ':' && getcmdline() =~ '^tmp$')? 'e ~/.tmp/tmp.vim' : 'tmp'
cnoreabbr <expr> stm (getcmdtype() == ':' && getcmdline() =~ '^stm$')? 'sp ~/.tmp/tmp.vim' : 'stm'
cnoreabbr <expr> tms (getcmdtype() == ':' && getcmdline() =~ '^tms$')? 'sp ~/.tmp/tmp.vim' : 'tms'
cnoreabbr <expr> vtm (getcmdtype() == ':' && getcmdline() =~ '^vtm$')? 'vs ~/.tmp/tmp.vim' : 'vtm'
cnoreabbr <expr> tmv (getcmdtype() == ':' && getcmdline() =~ '^tmv$')? 'vs ~/.tmp/tmp.vim' : 'tmv'
cnoreabbr <expr> btm (getcmdtype() == ':' && getcmdline() =~ '^btm$')? 'tabe ~/.tmp/tmp.vim' : 'btm'
cnoreabbr <expr> tmb (getcmdtype() == ':' && getcmdline() =~ '^tmb$')? 'tabe ~/.tmp/tmp.vim' : 'tmb'
" Abbr; FoldMethod {{{1
cnoreabbr <expr> ma  (getcmdtype() == ':' && getcmdline() =~ '^se fdm=ma$')?  'marker' : 'ma'
cnoreabbr <expr> mar (getcmdtype() == ':' && getcmdline() =~ '^se fdm=mar$')? 'marker' : 'mar'
cnoreabbr <expr> sy  (getcmdtype() == ':' && getcmdline() =~ '^se fdm=sy$')?  'syntax' : 'sy'
cnoreabbr <expr> syn (getcmdtype() == ':' && getcmdline() =~ '^se fdm=syn$')? 'syntax' : 'syn'
