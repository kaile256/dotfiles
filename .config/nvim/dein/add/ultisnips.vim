" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim
" Another: post/ultisnips.vim

" Note: mappings of coc-snippets won't support some flags, regex and other features.
inoremap <silent> <Plug>UltiSnipExpandOrJump <C-r>=UltiSnips#ExpandSnippetOrJump()<CR>
snoremap <silent> <Plug>UltiSnipExpandOrJump <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>
xnoremap <silent> <Plug>UltiSnipExpandOrJump  :call UltiSnips#SaveLastVisualSelection()<cr>gvs
nnoremap <silent> <Plug>UltiSnipExpandOrJump <Esc>:call UltiSnips#ExpandSnippetOrJump()<CR>

imap <c-\> <Plug>UltiSnipExpandOrJump
nmap <c-\> <Plug>UltiSnipExpandOrJump
smap <c-\> <Plug>UltiSnipExpandOrJump
xmap <c-\> <Plug>UltiSnipExpandOrJump

nnoremap <A-s> <Nop>

" Note: <A-s><A-u> cannot be mapped!?
nnoremap <silent> <A-s>p :<C-u>call <SID>edit_snippets()<CR>
nmap <A-s><A-p> <A-s>p

function! s:edit_snippets() abort
  let open = 'bel sp'
  if winwidth(0) > 2 * (&tw ? &tw : 80)
    let open = 'bot vs'
  endif

  exe open $VIM_ANOTHER_HOME .'/UltiSnips/'. &ft .'.snippets'
endfunction
