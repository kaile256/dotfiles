scriptencoding utf-8
" From: finder.toml

let g:vista_echo_cursor_strategy = 'scroll'
"let g:vista_default_executive = 'ctags'
"let g:vista_fzf_preview = ['right:50%']
"let g:vista#renderer#enable_icon = 1
"let g:vista#renderer#icons = {
"      \   'function': '\uf794',
"      \   'variable': '\uf71b',
"      \  }
let g:vista_sidebar_position = 'vertical botright'

let g:vista_fzf_preview = ['right:50%']

" default :Vista
"if exists('did_coc_loaded')
"  let g:vista_default_executive = 'coc'
"endif
"
"let g:vista_executive_for = {
"      \ 'markdown': 'toc',
"      \ 'vim'     : 'ctags'
"      \ }
"}}}

" :Vista is same as `:Vista ctags`.
" '!' to close vista-buffer
" '!!' to toggle vista-buffer.
" Mnemonic: Index
nnoremap <silent> <a-i> :<c-u>call <SID>vista_if_lsp()<cr>
"" Ref: fzf.vimrc
"" Mnemonic: Quest for Tags
nnoremap <silent> <a-q><a-t> :<c-u>Vista finder<cr>

function! s:vista_if_lsp() abort
  if &ft =~# 'vista'
    Vista!
  elseif &ft ==# 'vim'
    Vista!!
  elseif &ft ==# 'markdown'
    Vista toc
  elseif &ft ==# 'vimwiki'
    setl ft=markdown syn=vimwiki
    Vista toc
  elseif exists('g:did_coc_loaded')
    " Note: A bit lazy to call coc.
    echo ' Be Patient; Calling COC...'
    Vista coc
    "elseif exists('loaded_')
  endif
endfunction
"augroup VistaMyAutoConf
"  au BufEnter * if &ft =~# 'vista' | setl bt=quickfix
"  " vista as quickfix tells 'E37: No write ~~'
"  "au FileType vista,vista_kind setl bt=quickfix
"augroup END
