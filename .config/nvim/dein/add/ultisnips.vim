" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim

imap <c-\> <Plug>(ultisnips-expand-or-jump)
nmap <c-\> <Plug>(ultisnips-expand-or-jump)
vmap <c-\> <Plug>(ultisnips-expand-or-jump)

" WIP:
noremap <silent> <a-s><a-p> :<c-u>UltiSnipsEdit<cr>

finish

inoremap <silent> <Plug>(ultisnips-expand) <C-R>=UltiSnips#ExpandSnippet()<cr>
nnoremap <silent> <Plug>(ultisnips-expand) :<c-u>call UltiSnips#ExpandSnippet()<cr>
vnoremap <silent> <Plug>(ultisnips-expand)  <Esc>:call UltiSnips#ExpandSnippet()<cr>

inoremap <silent> <Plug>(ultisnips-expand-or-jump) <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>
nnoremap <silent> <Plug>(ultisnips-expand-or-jump) :<c-u>call UltiSnips#ExpandSnippetOrJump()<cr>
vnoremap <silent> <Plug>(ultisnips-expand-or-jump)  <Esc>:call UltiSnips#ExpandSnippetOrJump()<cr>

" inoremap <silent> <Plug>(ultisnips-list-snippets) <C-R>=UltiSnips#ListSnippets()<cr>
" snoremap <silent> <Plug>(ultisnips-list-snippets <Esc>:call UltiSnips#ListSnippets()<cr>

inoremap <expr> <Plug>(ultisnips-jump-forward)  UltiSnips#JumpForwards()
inoremap <expr> <Plug>(ultisnips-jump-backward) UltiSnips#JumpBackwards()
vnoremap <expr> <Plug>(ultisnips-jump-forward)  UltiSnips#JumpForwards()
vnoremap <expr> <Plug>(ultisnips-jump-backward) UltiSnips#JumpBackwards()
nnoremap <expr> <Plug>(ultisnips-jump-forward)  UltiSnips#JumpForwards()
nnoremap <expr> <Plug>(ultisnips-jump-backward) UltiSnips#JumpBackwards()

imap <expr> <c-\> <SID>ultisnips_jump_or_expand()
nmap <expr> <c-\> <SID>ultisnips_jump_or_expand()
vmap <expr> <c-\> <SID>ultisnips_jump_or_expand()

function! s:ultisnips_jump_or_expand() abort
  if get(g:, 'ulti_expand_res') == 0
    return "\<Plug>(ultisnips-expand)"
  endif
  if get(g:, 'ulti_jump_backwards_res') == 1
    return "\<Plug>(ultisnips-jump-backward)"
  elseif get(g:, 'ulti_jump_forwards_res') == 1
    return "\<Plug>(ultisnips-jump-forward)"
  endif
  return "\<Plug>(ultisnips-expand)"
endfunction

