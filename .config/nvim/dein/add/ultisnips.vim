" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: source/ultisnips.vim

" WIP:
noremap <silent> <a-s><a-p> :<c-u>UltiSnipsEdit<cr>

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

nnoremap <script> <c-\> <SID>ultisnips_jump_or_expand()
vnoremap <script> <c-\> <SID>ultisnips_jump_or_expand()
inoremap <script> <c-\> <SID>ultisnips_jump_or_expand()

function! s:ultisnips_jump_or_expand() abort
  if !exists('g:ulti_jump_backwards_res')
    call dein#source('ultisnips')
  endif
  if g:ulti_jump_backwards_res = 1
    return UltiSnips#JumpBackwards()
  elseif g:ulti_jump_forwards_res = 1
    return UltiSnips#JumpForwards()
  endif
  return UltiSnips#ExpandSnippet()
endfunction
