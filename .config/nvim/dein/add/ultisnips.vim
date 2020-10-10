" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim
" Another: post/ultisnips.vim

" Note: mappings of coc-snippets won't support some flags, regex and other features.

" Note: <expr>-UltiSnips#ExpandSnippet() throws `E533: Not allowed here`.
inoremap <silent> <Plug>UltiSnipExpand <C-r>=UltiSnips#ExpandSnippet()<CR>
nnoremap <silent> <Plug>UltiSnipExpand <Esc>:call UltiSnips#ExpandSnippet()<CR>
snoremap <silent> <Plug>UltiSnipExpand <Esc>:call UltiSnips#ExpandSnippet()<CR>
xnoremap <silent> <Plug>UltiSnipExpand :call      UltiSnips#SaveLastVisualSelection()<cr>gvs

" Tips: UltiSnips will stop with either <Nop>, <Esc> and <C-o> because
" internally `do autocmd User UltiSnipsExitLastSnippet` occurs.
imap <c-\> <Plug>UltiSnipExpand
nmap <c-\> <Plug>UltiSnipExpand
smap <c-\> <Plug>UltiSnipExpand
xmap <c-\> <Plug>UltiSnipExpand

" inoremap <silent> <Plug>UltiSnipExpandOrJump <C-r>=UltiSnips#ExpandSnippetOrJump()<CR>
" snoremap <silent> <Plug>UltiSnipExpandOrJump <Esc>:callUltiSnips#ExpandSnippetOrJump()<CR>
" xnoremap <silent> <Plug>UltiSnipExpandOrJump  :call UltiSnips#SaveLastVisualSelection()<cr>gvs
" nnoremap <silent> <Plug>UltiSnipExpandOrJump <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

" imap <c-\> <Plug>UltiSnipExpandOrJump
" nmap <c-\> <Plug>UltiSnipExpandOrJump
" smap <c-\> <Plug>UltiSnipExpandOrJump
" xmap <c-\> <Plug>UltiSnipExpandOrJump

nnoremap <A-s> <Nop>

" Note: <A-s><A-u> cannot be mapped!?
nnoremap <silent> <A-s>p :<C-u>call <SID>edit_snippets()<CR>
nmap <A-s><A-p> <A-s>p

function! s:edit_snippets() abort
  const ft = &ft
  if ft ==# 'snippets' && expand('%:p') =~# '/UltiSnips/snippets'
    echohl ErrorMsg
    echo '[UltiSnips]: you are editing snippets for "&ft = snippets"'
    echohl None
    return
  endif

  let open = 'sp | wincmd T | vs'
  if winwidth(0) > 2 * (&tw ? &tw : 80)
    let open = 'bot vs'
  elseif winheight(0) > 20
    let open = 'bel sp'
  endif

  const dir = $VIM_ANOTHER_HOME .'/UltiSnips/'. ft
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  endif

  let fname = ft .'.snippets'
  let path = dir .'/'. fname

  const ls = readdir(dir)
  if !filereadable(path)
    if len(ls)
      let fname = ls[0]
      let path = dir .'/'. fname
    endif
  endif

  const short_path = matchstr(path, '.*/UltiSnips/\zs.*')
  const candidates = len(ls) == 0 ? '[new]'
        \ : len(ls) == 1 ? '[only]'
        \ : '(in '. len(ls) .' candidates)'
  echo '[UltiSnip]: you are in "'. short_path .'"' candidates

  exe open path
endfunction
