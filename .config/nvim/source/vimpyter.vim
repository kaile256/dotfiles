" From: ftplugin.toml
" Repo: szymonmaszke/vimpyter

let g:vimpyter_color = 1
let g:vimpyter_view_directory = g:data_home .'/vimpyter/views'

command! -bar JupyterNotebookStart :VimpyterStartJupyter
command! -bar JupyterNteractStart  :VimpyterStartNteract

augroup VimpyterCallMyFunctions
  au!
  function! s:ipynb_keymap() abort
    nnoremap <buffer><silent><nowait> <space>i :VimpyterInsertPythonBlock<cr>
  endfunction
  au FileType ipynb call <SID>ipynb_keymap()
augroup END

