" From: myplug.toml
" Repo: kaile256/vim-keymaps-dealer
" Another: post/keymaps-dealer.vim

let g:kmDealer_win_weed_list = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
      \ 'COMMIT_EDITMSG',
      \ ]

"let g:kmDealer_win_path_dict =
"      \ extend(g:kmDealer_win_path_dict,
"      \        {'p': '<c-w>FindRoot'},
"      \        )

if !exists('g:kmDealer_win_cd_path_dict')
  let g:kmDealer_win_cd_path_dict = {}
endif

call extend(g:kmDealer_win_cd_path_dict, {
      \ 'h': '~',
      \ 'w': '%:p:h',
      \ '.': '.',
      \ }
      \ )

let g:kmDealer_win_split_dict = {
      \ '<a-v>': 'vsplit',
      \ '<a-s>': 'split',
      \ '<a-t>': 'tabe',
      \ '<a-e>': 'edit',
      \ }

let s:list = {
      \ 'fugitive': {},
      \ }

let s:list.git = {
      \ 'bt': ['nofile', 'nowrite', 'quickfix'],
      \ 'ft': [],
      \ 'filename': ['fugitive:\/\/', 'twiggy:\/\/'],
      \ }

nnoremap <silent> <a-space><space>   :<c-u>KmDealerWinWeedout<cr>
nnoremap <silent> <a-space><a-space> :<c-u>KmDealerWinWeedout<cr>

onoremap <expr> q (v:operator ==# 'd')? ':<c-u>KmDealerWinWeedout<cr>': 'q'

nnoremap <expr> <c-w><c-o> (&diff)? ':<c-u>KmDealerWinWeedout<cr><c-w>o': '<c-w>o'
nnoremap <expr> <c-w>o     (&diff)? ':<c-u>KmDealerWinWeedout<cr><c-w>o': '<c-w>o'

