scriptencoding utf-8
" From: init.vim

" Prevention; before fzf.vim {{{
let s:phrase_neither_rg_nor_ag = "You don't have executable 'ripgrep' nor 'silver searcher.'"
let s:phrase_neither_fzf = "You don't have executable 'fzf.'"

if !executable('ag') && !executable('rg')
  tnoremap <silent> <a-r> <c-\><c-n>:echo "You don't have executable 'ripgrep' nor 'silver searcher.'"<cr>
  tnoremap <silent> <a-q> <c-\><c-n>:echo "You don't have any executable fuzzy finder.'"<cr>
  nnoremap <silent> <a-r> :<c-u>echo "You don't have executable 'ripgrep' nor 'silver searcher.'"<cr>
  nnoremap <silent> <a-q> :<c-u>echo "You don't have any executable fuzzy finder.'"<cr>
endif
"}}}

" Improved; Jump {{{
"" Buffer; to the Last
noremap <c-6> <c-^>
""" Tags; to Newest
" :silent! to supress 'E556: at top of tag stack'
nnoremap <silent> <c-q> :silent! $tag<cr>

"" Jump; Search
" researched word will come up at middle of current window.
"nnoremap n nzz
"nnoremap N Nzz
"}}}

" Switch; Pane
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" avoid a stack on command-line
cnoremap <a-k> <c-c>

" Switch; Tab Page
"" Move between Tabs
nnoremap <c-h> gT
nnoremap <c-l> gt
nnoremap <a-]> gt
nnoremap <a-[> gT
inoremap <a-[> <esc>gT
inoremap <a-]> <esc>gt
tnoremap <a-]> <c-\><c-n>gt
tnoremap <a-[> <c-\><c-n>gT

"nnoremap <c-p> <Cmd>bprev<cr>
"nnoremap <c-n> <Cmd>bnext<cr>
