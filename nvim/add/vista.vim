scriptencoding utf-8
" From: finder.toml
" Repo: liuchengxu/vista.vim

"let g:vista_default_executive = 'ctags'
"let g:vista_fzf_preview = ['right:50%']
"let g:vista#renderer#enable_icon = 1
"let g:vista#renderer#icons = {
"      \   'function': '\uf794',
"      \   'variable': '\uf71b',
"      \  }
let g:vista_sidebar_position = 'vertical botright'
let g:vista_sidebar_width = 33

"let g:vista_fzf_preview = ['right:50%']

" :Vista is same as `:Vista ctags`.
" '!' to close vista-buffer
" '!!' to toggle vista-buffer.
" Mnemonic: Index
nnoremap <silent> <space>i :<c-u>call <SID>vista_sensible()<cr>

function! s:vista_sensible() abort
  if winwidth('#') > 100
    let g:vista_echo_cursor_strategy = 'floating_win'
  else
    let g:vista_echo_cursor_strategy = 'echo'
  endif
  " Adjust, up to '&l:ft', which tool Vista should use:
  " ctags, coc (or other lsp clients) or TableOfContents Mode.
  if &ft =~# 'vista'
    Vista!
  elseif &ft ==# 'markdown'
    Vista toc
  elseif &ft ==# 'vimwiki'
    setl ft=markdown syn=vimwiki
    Vista toc
  elseif exists('g:did_coc_loaded')
    " Note: A bit lazy to call coc.
    if CocHasProvider('documentSymbol')
      Vista coc
      echo ' Be Patient; Calling COC...'
      " TODO: Announce if Nothing found.
    else
      " Note: if you want to close, be in vista's window.
      Vista
      echo ' documentSymbol is unavailable on this filetype; reading ctags...'
    endif
    "elseif exists('loaded_')
  endif
endfunction
"augroup VistaMyAutoConf
"  au BufEnter * if &ft =~# 'vista' | setl bt=quickfix
"  " vista as quickfix tells 'E37: No write ~~'
"  "au FileType vista,vista_kind setl bt=quickfix
"augroup END
