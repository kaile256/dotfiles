" From: init.vim
" Ref: cmaps.vim
" Ref: cabbrs.vim

if executable('hub')
  " Note: !hub with `nvr` often fails to work.
  command! -nargs=* Hub
        \ :!git branch --show-current
        \ && GIT_EDITOR='nvim-qt' hub -C %:p:h <args>
  command! -nargs=* PR
        \ :!git branch --show-current
        \ && GIT_EDITOR='nvim-qt' hub -C %:p:h pull-request <args>
endif

command! -bar Cclear :noau cexpr [] " Clear quickfix list
command! -bar Lclear :noau lexpr [] " Clear location list

command! -bar DiffOrig
      \ :vert above new | setl bt=nofile
      \ | r # | 0d_
      \ | diffthis | wincmd p | diffthis
      \ | setl diffopt=vertical,indent-heuristic,algorithm:histogram

"augroup AutoMkdirSuggestionOnSave "{{{1
"  au!
"  au BufWritePre * call <SID>auto_suggest_mkdir(expand('<afile>:p:h'), v:cmdbang)
"  function! s:auto_suggest_mkdir(dir, force)
"    if !isdirectory(a:dir) && (a:force ||
"          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction
"augroup END

" Lint {{{1
" TODO: make vint restricted to the range
command! -bar -range -nargs=* Lint :call s:lint_buffer(<f-args>)
command! -bar -range -nargs=* Lin  :call s:lint_buffer(<f-args>)
let s:ft2lint = {
      \ 'vim': '!vint --enable-neovim',
      \ 'go': ['go vet', 'golint'],
      \ }
function! s:lint_buffer(...) abort range
  if index(keys(s:ft2lint), &ft) < 0
    echo 'no config to lint for filetype, "'. &ft .'"'
  endif
  if filewritable(expand('%:p'))
    silent write
  endif
  let args = join(a:000)
  let cmds = s:ft2lint[&ft]

  if type(cmds) != type([])
    let cmds = [ cmds ]
  endif
  for cmd in cmds
    exe cmd args '%:p'
  endfor
endfunction

" Shell Scripts; Out of Vim "{{{1
" enable copletion
command! -bar -nargs=* -complete=shellcmd Kill
      \ :call s:killall(<q-args>)
function! s:killall(...) abort "{{{2
  let args = join(get(a:, '000'))
  if empty(args)
    !killall vim nvim nvim-qt
  else
    exe '!killall' args
  endif
endfunction

augroup myAutoChdir "{{{1
  " esp. for `e./<TAB>`; &autochdir could be incompatible with some plugins.
  au CmdLineEnter,CmdWinEnter * silent! cd %:p:h
augroup END

"augroup mySwitchToWrittenBuffer "{{{1
"  au!
"  " if BufWriteCmd was set, buffer could be unwritable from Vim.
"  " FIXME:
"  au BufWritePost *
"       \ if fnamemodify(expand('<amatch>'), ':p') !=# expand('%:p') |
"       \   exe 'e' fnamemodify(expand('<amatch>'), ':p')
"       \ | endif
"augroup END

