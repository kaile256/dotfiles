nnoremap <silent> <a-TAB> :<C-u>call <SID>source_buffer()<CR>

if !exists('*s:source_buffer')
  function! s:source_buffer() abort
    if &ft ==# 'vim' && expand('%:p') =~# '/ftplugin/'
      echo 'Abort. This file is located under ftplugin/'
      return
    endif

    let save_view = winsaveview()
    if &ft ==# 'vim'
      " Refresh augroups before source the target buffer.
      let pat_augname = 'keepj keepp g/aug\%[roup] \(\cEND\)\@!'
      let lines_augroup = split(execute(pat_augname), '\n')
      for line in lines_augroup
        let aug_name = matchstr(line, 'aug\%[roup] \zs\S\+')
        exe 'silent! autocmd!' aug_name
      endfor
    endif

    let s:msg = 'no write but'
    if filewritable(expand('%:p'))
      silent! exe &modified ? 'up' : 'checktime'
      if v:statusmsg =~# 'written'
        let s:msg = v:statusmsg .' &'
      endif
    endif

    if getline(1) =~# '^#!'
      call s:do_as_shebang()
    elseif has_key(s:ft2cmd, &ft)
      call s:do_as_dict(s:ft2cmd, &ft)
    else
      call s:do_as_dict(s:fname2cmd, expand('%:p'))
    endif

    call winrestview(save_view)
  endfunction

  function! s:do_as_shebang() abort "{{{2
    silent !%:p
    echo s:msg matchstr(getline(1), '^#!\zs.*') 'is done'
  endfunction

  function! s:do_as_dict(dict, compared) abort "{{{2
    for l:key in keys(a:dict)
      if a:compared !~# l:key | continue | endif

      let l:val = a:dict[l:key]

      silent exe l:val[0]
      echo s:msg l:val[1]
      break
    endfor
  endfunction

  let s:ft2cmd = {
        \ 'vim': ['so %:p', 'sourced'],
        \ 'lua': ['luafile %:p', 'sourced'],
        \ 'vader': ['Vader', 'vader running...'],
        \ 'html': ['silent OpenBrowser %:p', 'open in browser'],
        \ 'xmodmap': ['!xmodmap %:p', 'xmodmap is updated'],
        \ 'xdefaults': ['!xrdb ~/.Xresources', 'X is updated'],
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
