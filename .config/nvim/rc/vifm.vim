" From: init.vim
" Another: keymap/vifm.vim

augroup myVifmRc-InsteadOfNetrw
  " Ref: https://github.com/Shougo/defx.nvim/issues/121
  " Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
  let g:loaded_netrwPlugin = 1 " necessary to read via https

  " Ref: *netrw-activate*
  au VimEnter * if expand('%') ==# '' | e. | endif
  " TODO: inherit jumplist after gf
  au VimEnter * silent! au! FileExplorer *
  au BufEnter * call s:vifm_or_netrw(expand('<amatch>'))

  au FileReadCmd file://* call s:netrw_cmd('Nread')

  au BufReadCmd,FileReadCmd http://*,https://*,rsync://*,sftp://*    call s:netrw_cmd('Nread')
  au BufReadCmd,FileReadCmd ftp://*,rcp://*,scp://*,dav://*,davs://* call s:netrw_cmd('Nread')

  au SourcePre,SourceCmd file://*,http://*,https://*,rsync://*,sftp://* call s:netrw_cmd('Nsource')
  au SourcePre,SourceCmd ftp://*,rcp://*,scp://*,dav://*,davs://*       call s:netrw_cmd('Nsource')
augroup END

function! s:vifm_or_netrw(dirname) abort
  if !isdirectory(a:dirname) | return | endif
  try
    exe 'Vifm --select' a:dirname
    setlocal nonumber
    setlocal signcolumn=no
    startinsert
  catch
    " /usr/share/nvim/runtime/autoload/netrw.vim
    if !exists(':Explore')
      unlet g:loaded_netrwPlugin
      source $VIMRUNTIME/plugin/netrwPlugin.vim
    endif
    exe 'Explore' a:dirname
  endtry
endfunction

function! s:netrw_cmd(cmd) abort
  if !exists(':Nread')
    unlet g:loaded_netrwPlugin
    source $VIMRUNTIME/plugin/netrwPlugin.vim
  endif

  exe a:cmd expand('<amatch>')
endfunction

