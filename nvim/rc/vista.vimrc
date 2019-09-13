scriptencoding utf-8
" From: finder.toml
" TODO: Change by width
"function! s:vista_adjust_echo_style()
"if winwidth('#') > 100
"  let g:vista_echo_cursor_strategy = 'floating_win'
"else
"  let g:vista_echo_cursor_strategy = 'echo'
"endif
"endfunction
"au VimResized,BufEnter * call s:vista_adjust_echo_style()

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
nnoremap <silent> <a-i> :<c-u>call <SID>vista_auto_adjust()<cr>

function! s:vista_auto_adjust() abort
  if winwidth('#') > 100
    let g:vista_echo_cursor_strategy = 'floating_win'
  else
    let g:vista_echo_cursor_strategy = 'echo'
  endif
  " Adjust, up to '&l:ft', which tool Vista should use:
  " ctags, coc (or other lsp clients) or TableOfContents Mode.
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
