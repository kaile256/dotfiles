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
"}}}
" Open parent directory {{{1
command! E :e    %:p:h
command! V :vs   %:p:h
" Mnemonic: Horizontal (h muet)
command! O :sp   %:p:h
command! T :tabe %:p:h

" TODO: make vint restricted to the range
command! -nargs=* -range Vint :w <bar> !vint --enable-neovim <args> %:p
command! -nargs=* -range Vin  :Vint

command! -bar S  :call s:source_buffer() "{{{1
command! -bar So :call s:source_buffer()
command! -bar SO :call s:source_buffer()

if !exists('*s:source_buffer')
  function! s:source_buffer() abort
    " Note: :undojoin causes an error right after :undo.
    " Note: :undojoin with :w prevents to :undo before :w
    "silent! undojoin

    let s:msg = 'nothing done'
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
    else
      call s:do_as_dict(s:fname2cmd, expand('%:p'))
    endif
  endfunction
endif

function! s:do_as_shebang() abort "{{{2
  silent !%:p
  echo s:msg .'&'. matchstr(getline(1), '^#!\zs.*') .'is done'
endfunction

function! s:do_as_dict(dict, compared) abort "{{{2
  for l:key in keys(a:dict)
    if a:compared !~# l:key | continue | endif

    let l:val = a:dict[l:key]

    exe l:val[0]
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
      \ '/polybar/': ['!${XDG_CONFIG_HOME}/polybar/launch.sh &', 'polybar restarted'],
      \ '/etc/systemd/': ['!systemctl --user daemon-reload', 'system daemon is reloaded'],
      \ '/etc/fstab': ['call suda#system("mount -a")', 'fstab is reloaded'],
      \ }

" Shell Scripts; Out of Vim "{{{1
" enable copletion
command! -bar -nargs=* -complete=shellcmd
      \ Killall
      \ :silent !killall <args>
