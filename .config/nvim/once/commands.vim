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

command! -bar S  :call s:source_buffer() "{{{1
command! -bar So :call s:source_buffer()
command! -bar SO :call s:source_buffer()

if !exists('*s:source_buffer')
  function! s:source_buffer() abort
    " Note: :undojoin causes an error right after :undo.
    " Note: :undojoin with :w prevents to :undo before :w
    "silent! undojoin

    let msg = 'nothing done'
    if filewritable(expand('%:p'))
      silent write
      let msg = v:statusmsg
    endif

    if getline(1) =~# '^#!'
      !%:p
      return

    elseif has_key(s:ft2cmd, &ft)
      let l:val = s:ft2cmd[&ft]

    else
      for l:key in s:fname2cmd
        if expand('%:p') =~# s:fname2cmd
          let l:val = s:fname2cmd[l:key]
          break
        endif
      endfor

      echoerr msg
    endif

    if exists('l:val')
      if type(l:val) == type([])
        exe l:val[0]
        echo msg '&' l:val[1]

      else
        exe l:val
      endif
    endif

  endfunction
endif

let s:ft2cmd = {
      \ 'vim': ['so %:p', 'sourced'],
      \ 'html': ['silent OpenBrowser %:p', 'open in browser'],
      \ 'xmodmap': '!xmodmap %:p',
      \ 'xdefaults': '!xrdb %:p',
      \ 'i3': '!i3-msg restart &',
      \ }

let s:fname2cmd = {
      \ '\.config/fcitx/': '!fcitx-remote -r',
      \ '/polybar/': '!${XDG_CONFIG_HOME}/polybar/launch.sh &',
      \ '/etc/systemd/': '!systemctl --user daemon-reload',
      \ '/etc/fstab': 'call suda#system("mount -a")',
      \ }

" Shell Scripts; Out of Vim "{{{1
" enable copletion
command! -bar -nargs=* -complete=shellcmd
      \ Killall
      \ :silent !killall <args>
