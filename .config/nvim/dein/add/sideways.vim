" TOML: operator.toml
" Repo: AndrewRadev/sideways.vim
" Another: source/sideways.vim
" Also: after/ftplugin/

" let g:sideways_search_timeout = 0
" let g:sideways_skip_strings_and_comments = 0

nnoremap <silent> - :<C-u>SidewaysLeft<CR>
nnoremap <silent> + :<C-u>SidewaysRight<CR>

function! s:textobj_comma(key) abort
  let s:is_comment =
        \ {-> synIDattr(synIDtrans(synID(line('.'), col('.') - 1, 0)), 'name')}
  if s:is_comment() =~# 'Comment'
    return "\<Plug>(textobj-sandwich-query-". tolower(a:key) .'),'
  endif
  return "\<Plug>SidewaysArgumentTextobj".  toupper(a:key)
endfunction

omap <expr><silent> a, <SID>textobj_comma('a')
xmap <expr><silent> a, <SID>textobj_comma('a')
omap <expr><silent> i, <SID>textobj_comma('i')
xmap <expr><silent> i, <SID>textobj_comma('i')

" let g:sideways_definitions = []
" let b:sideways_definitions = []
" let b:sideways_skip_syntax = []
