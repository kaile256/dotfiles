" From: finder.toml
" Repo: lambdalisue/fila.vim
" Another: post/fila.vim

function! fila#keymaps() abort "{{{1
  nmap <buffer><expr> <Plug>(fila-custom-smart-enter)
        \ fila#viewer#drawer#is_drawer(win_getid())
        \ ? "\<Plug>(fila-action-enter-or-edit)\<Plug>(fila-action-tcd)"
        \ : "\<Plug>(fila-action-enter-or-edit)"
  nmap <buffer><expr> <Plug>(fila-custom-smart-leave)
        \ fila#viewer#drawer#is_drawer(win_getid())
        \ ? "\<Plug>(fila-action-leave)\<Plug>(fila-action-tcd)"
        \ : "\<Plug>(fila-action-leave)"

  nmap <buffer><nowait> <C-m> <Plug>(fila-custom-smart-enter)
  nmap <buffer><nowait> <C-h> <Plug>(fila-custom-smart-leave)

  nmap <buffer><nowait> h     <Plug>(fila-action-collapse)
  nmap <buffer><nowait> l     <Plug>(fila-action-expand)
  nmap <buffer><nowait> <cr>  <Plug>(fila-action-edit-select)
  nmap <buffer><nowait> P     <Plug>(fila-action-edit-pedit)
  nmap <buffer><nowait> <c-t> <Plug>(fila-action-edit-tabedit)
  nmap <buffer><nowait> <c-v> <Plug>(fila-action-edit-vsplit)
  nmap <buffer><nowait> <c-o> <Plug>(fila-action-edit-split)

  nmap <buffer><nowait> mj <Plug>(fila-action-mark-toggle)j
  nmap <buffer><nowait> mk <Plug>(fila-action-mark-toggle)k

  nmap <buffer><nowait> z. <Plug>(fila-action-hidden-toggle)

  nmap <buffer><nowait> %  <Plug>(fila-action-new-file)
  nmap <buffer><nowait> d  <Plug>(fila-action-new-directory)
  nmap <buffer><nowait> C  <Plug>(fila-action-move)
  nmap <buffer><nowait> Y  <Plug>(fila-action-copy)
  nmap <buffer><nowait> p  <Plug>(fila-action-paste)
  nmap <buffer><nowait> D  <Plug>(fila-action-delete)
endfunction "}}}1

augroup FilaBufferKeymaps
  au! FileType fila call fila#keymaps()
augroup END

