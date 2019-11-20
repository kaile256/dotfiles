" From: myplug.toml
" Repo: kaile256/vim-among_HML

"noremap <silent> H <Cmd>call among_HML#fork#initialize('H', '0', {
"      \ 'K': '12.5',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>

noremap <silent> M <Cmd>call among_HML#fork#initialize('M', 50, {
      \ 'H': 0,
      \ 'K': 25,
      \ 'J': 75,
      \ 'L': 100,
      \ })<bar>
      \ call feedkeys('M')<cr>

"noremap <silent> L <Cmd>call among_HML#fork#initialize('L', '100', {
"      \ 'K': '62.5',
"      \ 'J': '87.5',
"      \ })<bar>
"      \ call feedkeys('L')<cr>

nnoremap <silent> gH :<c-u>call among_HML#get_half#to(0)<cr>
nnoremap <silent> gM :<c-u>call among_HML#get_half#to(50)<cr>
nnoremap <silent> gL :<c-u>call among_HML#get_half#to(100)<cr>

nnoremap <silent> <c-j> :<c-u>call among_HML#scroll#percent(25, 'down')<cr>
nnoremap <silent> <c-k> :<c-u>call among_HML#scroll#percent(25, 'up')<cr>

