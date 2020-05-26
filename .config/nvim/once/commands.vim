" From: init.vim
" Ref: cmaps.vim
" Ref: cabbrs.vim

command! -bar CursorCharIs
      \ :echo "'". getline('.')[col('.') - 1] ."' is the character under cursor, as getline('.')[col('.') - 1]"

command! -bar DiffOrig
      \ :vert above new | setl bt=nofile
      \ | r # | 0d_
      \ | diffthis | wincmd p | diffthis
      \ | setl diffopt=vertical,indent-heuristic,algorithm:histogram

command! -bar SyntaxReset        :call s:syntax_reset() "{{{1
command! -bar HeavyBufferToReset :call s:syntax_reset()
" TODO: automatically call this function/command as needed
function! s:syntax_reset() abort
  let save_syn = &syn
  setl syntax=
  let &l:syntax = save_syn
endfunction

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

command! -bar So :call s:source_buffer() "{{{1
command! -bar SO :call s:source_buffer()
command! -bar OS :call s:source_buffer()
command! -bar Os :call s:source_buffer()

if !exists('*s:source_buffer')
  function! s:source_buffer() abort
    " Note: :undojoin causes an error right after :undo.
    " Note: :undojoin with :w prevents to :undo before :w
    "silent! undojoin

    let s:msg = 'no write'
    if filewritable(expand('%:p'))
      silent write
      let s:msg = v:statusmsg
    endif

    if getline(1) =~# '^#!'
      call s:do_as_shebang()
      return
    endif

    if has_key(s:ft2cmd, &ft)
      call s:do_as_dict(s:ft2cmd, &ft)
      return
    else
      call s:do_as_dict(s:fname2cmd, expand('%:p'))
      return
    endif

    echoerr s:msg '& all'
  endfunction

  function! s:do_as_shebang() abort "{{{2
    silent !%:p
    echo s:msg '&' matchstr(getline(1), '^#!\zs.*') 'is done'
  endfunction

  function! s:do_as_dict(dict, compared) abort "{{{2
    for l:key in keys(a:dict)
      if a:compared !~# l:key | continue | endif

      let l:val = a:dict[l:key]

      silent exe l:val[0]
      echo s:msg '&' l:val[1]
      break
    endfor
  endfunction

  let s:ft2cmd = {
        \ 'vim': ['so %:p', 'sourced'],
        \ 'html': ['silent OpenBrowser %:p', 'open in browser'],
        \ 'xmodmap': ['!xmodmap %:p', 'xmodmap is updated'],
        \ 'xdefaults': ['!xrdb %:p', 'X is updated'],
        \ 'i3': ['!i3-msg restart &', 'i3 restarted'],
        \ }

  let s:fname2cmd = {
        \ '/\.config/fcitx/': ['!fcitx-remote -r', 'fcitx restarted'],
        \ '/libskk/': ['!fcitx-remote -r', 'fcitx restarted'],
        \ '/polybar/': ['!${XDG_CONFIG_HOME}/polybar/launch.sh &', 'polybar restarted'],
        \ '/etc/systemd/': ['!systemctl --user daemon-reload', 'system daemon is reloaded'],
        \ '/etc/fstab': ['call suda#system("mount -a")', 'fstab is reloaded'],
        \ }

endif

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

augroup myAutoChdirOnWrite "{{{1
  if exists('#myAutoChdirOnWrite')
    au! myAutoChdirOnWrite
  endif
  au BufWritePre * silent! cd %:p:h
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

