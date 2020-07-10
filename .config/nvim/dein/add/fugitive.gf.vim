" TOML: fugitive.toml
" Repo: tpope/vim-fugitive
" Another: add/fugitive.vim
" Another: source/fugitive.vim

" Ref: $GHQ_ROOT/github.com/neovim/neovim/src/nvim/normal.c @6906 nv_gotofile
" if a number follows filename/path, jump to the linenumber on the buffer:
"     init.vim:10
"     init.vim @ 20
"     init.vim (30)
"     /init.vim 40

nnoremap <script> gf <SID>(fugitive-gf)
xnoremap <script> gf <SID>(fugitive-gf)

nnoremap <script> gF      <SID>(fugitive-gf-tab)
xnoremap <script> gF      <SID>(fugitive-gf-tab)
nnoremap <script> <c-w>F  <SID>(fugitive-gf-tab)
xnoremap <script> <c-w>F  <SID>(fugitive-gf-tab)
nnoremap <script> <c-w>gf <SID>(fugitive-gf-tab)
xnoremap <script> <c-w>gf <SID>(fugitive-gf-tab)

nnoremap <script> <c-w>f <SID>(fugitive-gf-horizontal)
xnoremap <script> <c-w>f <SID>(fugitive-gf-horizontal)
nnoremap <script> <c-w><space>f <SID>(fugitive-gf-vertical)
xnoremap <script> <c-w><space>f <SID>(fugitive-gf-vertical)

" Define Helpers {{{1
function! s:is_hash() abort
  return expand('<cword>') =~# '^\x\{6,}$'
endfunction

function! s:Gopen(open) abort
  exe 'G'. a:open expand('<cword>')
endfunction

" Define mappings {{{2
" TODO: the mappings should be better to be restricted to git-related buffer
"   via dein in TOML
noremap <silent><expr> <SID>(fugitive-gf)
      \ <SID>is_hash() ? ":call <SID>Gopen('edit')<cr>"  : 'gF'
noremap <silent><expr> <SID>(fugitive-gf-tab)
      \ <SID>is_hash() ? ":call <SID>Gopen('tabe')<cr>" : '<c-w>gF'

noremap <silent><expr> <SID>(fugitive-gf-horizontal)
      \ <SID>is_hash() ? ":call <SID>Gopen('split')<cr>" : '<c-w>F'
noremap <silent><expr> <SID>(fugitive-gf-vertical)
      \ <SID>is_hash() ? ":call <SID>Gopen('vsplit')<cr>" : '<Cmd>vert wincmd F<cr>'

