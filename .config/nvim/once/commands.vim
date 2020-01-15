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
command! -bang -bar -nargs=? Cd call s:cd_here(<q-bang>) "{{{2
command! -bang -bar -nargs=? CD call s:cd_here(<q-bang>)

function! s:cd_here(args) abort
  if a:args ==# ''
    cd %:p:h
  else
    !cd %:p:h
  endif
  pwd
endfunction

" TODO: make vint restricted to the range
command! -nargs=* -range Vint :w <bar> !vint --enable-neovim <args> %:p
command! -nargs=* -range Vin  :Vint

command! -bar So :call s:source_buffer() "{{{1
command! -bar SO :call s:source_buffer()
command! -bar S  :call s:source_buffer()

if !exists('*s:source_buffer')
  function! s:source_buffer() abort
    " Note: :undojoin causes an error right after :undo.
    " Note: :undojoin with :w prevents to :undo before :w
    "silent! undojoin
    let filepath = expand('%:p')
    if filepath =~# '/systemd/'
      !systemctl --user daemon-reload
      return
    endif

    if filewritable(filepath)
      silent write
    endif

    if getline(1) =~# '^#!'
      !%:p
      return
    elseif has_key(s:ft2cmd, &ft)
      exe s:ft2cmd[&ft]
      return
    elseif &ft ==# 'dosini'
      for l:key in keys(s:dosini)
        if expand('%:p') =~# l:key
          exe s:dosini[l:key]
          return
        endif
      endfor
    endif

    echo v:statusmsg
  endfunction
endif

let s:ft2cmd = {
      \ 'vim': 'so %:p | echomsg v:statusmsg "& sourced"',
      \ 'html': 'silent OpenBrowser %:p | echomsg v:statusmsg "& open in browser',
      \ 'xmodmap': '!xmodmap %:p',
      \ 'xdefaults': '!xrdb %:p',
      \ 'i3': '!i3-msg restart &',
      \ }

let s:dosini = {
      \ '\.config/fcitx/': '!fcitx-remote -r',
      \ '/polybar/':       '!${XDG_CONFIG_HOME}/polybar/launch.sh &',
      \ }

" Shell Scripts; Out of Vim "{{{1
command! -bar -nargs=* -complete=shellcmd
      \ Killall
      \ :silent !killall <args>

command! -bar XinputTouchpadEnable  :!xinput enable  Elan\ Touchpad
command! -bar TouchpadEnable        :!xinput enable  Elan\ Touchpad
command! -bar XinputTouchpadDisable :!xinput disable Elan\ Touchpad
command! -bar TouchpadDisable       :!xinput disable Elan\ Touchpad
