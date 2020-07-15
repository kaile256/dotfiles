" From: ftplugin.toml
" Repo: szymonmaszke/vimpyter

let g:vimpyter_color = 1
let g:vimpyter_view_directory = $XDG_DATA_HOME .'/vimpyter/views'

command! -bar JupyterNotebookStart :VimpyterStartJupyter
command! -bar JupyterNteractStart  :VimpyterStartNteract

augroup myVimpyterSource
  au FileType ipynb call s:ipynb_keymap()
  function! s:ipynb_keymap() abort
    nnoremap <buffer><silent> <space>i :<c-u>VimpyterInsertPythonBlock<cr>
  endfunction
augroup END

