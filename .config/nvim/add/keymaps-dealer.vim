" From: myplug.toml
" Repo: kaile256/vim-keymaps-dealer
" Another: post/keymaps-dealer.vim

" TODO: pass through the undefined-error while on among_HML#percent() works?
"nnoremap <silent> <space>t :<c-u>call kmDealer#window#path('<space>t', 'te fish', 1)<cr><space>t
"nnoremap <silent> <space>z :<c-u>call kmDealer#window#path('<space>z', 'Fzf', 0)<cr><space>z
"nnoremap <silent> <space>r :<c-u>call kmDealer#window#path('<space>r', 'Rg',  0)<cr><space>r
"nnoremap <silent> <space>a :<c-u>call kmDealer#window#path('<space>a', 'Ag',  0)<cr><space>a

let g:kmDealer_win_weed_list = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
      \ 'COMMIT_EDITMSG',
      \ ]

if !exists('g:kmDealer_cd_path_dict')
  let g:kmDealer_cd_path_dict = {}
endif

call extend(g:kmDealer_cd_path_dict, {
      \ 'h': '~',
      \ 'w': '%:p:h',
      \ '.': '.',
      \ }
      \ )

let g:kmDealer_split_dict = {
      \ '<a-v>': 'vsplit',
      \ '<a-s>': 'split',
      \ '<a-t>': 'tabe',
      \ '<a-e>': 'edit',
      \ }

nnoremap <silent> <a-space><space>   :<c-u>KmDealerWinWeedout<cr>
nnoremap <silent> <a-space><a-space> :<c-u>KmDealerWinWeedout<cr>

onoremap <expr> q (v:operator ==# 'd')? ':<c-u>KmDealerWinWeedout<cr>': 'q'

nnoremap <expr> <c-w><c-o> (&diff)? ':<c-u>KmDealerWinWeedout<cr><c-w>o': '<c-w>o'
nnoremap <expr> <c-w>o     (&diff)? ':<c-u>KmDealerWinWeedout<cr><c-w>o': '<c-w>o'

