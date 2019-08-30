" From: tool.toml
"  Ref: coc.vimrc
"  Ref: fzf.vimrc

let g:vista_icon_indent = ["╰▸ ", "├▸ "]
"let g:vista_default_executive = 'ctags'
"let g:vista_fzf_preview = ['right:50%']
"let g:vista#renderer#enable_icon = 1
"let g:vista#renderer#icons = {
"      \   "function": "\uf794",
"      \   "variable": "\uf71b",
"      \  }
let g:vista_sidebar_position = 'vertical botright'

let g:vista_fzf_preview = ['right:50%']

" :Vista is same as :Vista ctags.
" !! is toggle vista-view.
nnoremap <silent> <a-b> :<c-u>Vista!!<cr>
"" Ref: fzf.vimrc
"" Mnemonic: Quest for Tags
nnoremap <silent> <a-q><a-t> :<c-u>Vista finder<cr>

augroup VistaMarkdown
  au! BufEnter *
  if &ft ==# 'markdown'
    " toc is abbr. for Table Of Contents.
    nnoremap <silent><buffer> <a-b> :<c-u>Vista toc<cr>
  endif
augroup END
