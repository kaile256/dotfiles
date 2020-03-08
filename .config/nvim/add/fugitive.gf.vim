" Repo: tpope/vim-fugitive
" Toml: fugitive.toml
" Another: add/fugitive.vim
" Another: source/fugitive.vim

" Ref: $GHQ_ROOT/github.com/neovim/neovim/src/nvim/normal.c @6906 nv_gotofile
" if a number follows filename/path, jump to the linenumber on the buffer:
"     init.vim:10
"     init.vim @ 20
"     init.vim (30)
"     /init.vim 40

nnoremap <silent><expr> gf <SID>is_hash() ? ":call <SID>Gopen('edit')<cr>"  : 'gF'
xnoremap <silent><expr> gf <SID>is_hash() ? ":call <SID>Gopen('edit')<cr>"  : 'gF'
nnoremap <silent><expr> <c-w>f <SID>is_hash() ? ":call <SID>Gopen('split')<cr>" : '<c-w>F'
xnoremap <silent><expr> <c-w>f <SID>is_hash() ? ":call <SID>Gopen('split')<cr>" : '<c-w>F'

nnoremap <silent><expr> <c-w>F  <SID>is_hash() ? ":call <SID>Gopen('tabe')<cr>" : '<c-w>gF'
xnoremap <silent><expr> <c-w>F  <SID>is_hash() ? ":call <SID>Gopen('tabe')<cr>" : '<c-w>gF'
nnoremap <silent><expr> <c-w>gf <SID>is_hash() ? ":call <SID>Gopen('tabe')<cr>" : '<c-w>gF'
xnoremap <silent><expr> <c-w>gf <SID>is_hash() ? ":call <SID>Gopen('tabe')<cr>" : '<c-w>gF'

nnoremap <silent><expr> <c-w><space>f <SID>is_hash()
      \ ? ":call <SID>Gopen('vsplit')<cr>" : "<Cmd>vert wincmd F<cr>"
xnoremap <silent><expr> <c-w><space>f <SID>is_hash()
      \ ? ":call <SID>Gopen('vsplit')<cr>" : "<Cmd>vert wincmd F<cr>"

function! s:is_hash() abort "{{{1
  " <cfile> and <cWORD> is inappropriate for ddc70ca6..01581d37
  let cfile = expand('<cword>')

  " \x\+ matches a word, 'add', for example; so regard 'cfile' as *not* a hash
  " when it has not a number or not a character though the pattern could be a
  " hash.
  if cfile !~# '^\x\+$'
    return 0
  endif

  if cfile =~# '^[0-9]\+$\|^[a-z]\+$'
        \ || len(cfile) < 8
    " echoerr cfile 'is probably not a commit-hash; abort'
    return 0
  endif

  return 1
endfunction

function! s:Gopen(open) abort "{{{1
  exe 'G'. a:open expand('<cword>')
endfunction
