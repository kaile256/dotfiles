" From: myplug.toml
" Repo: kaile256/vim-among_HML

" among_HML#percent {{{1
"noremap <silent> K <Cmd>call among_HML#percent(25)<cr>
"noremap <silent> J <Cmd>call among_HML#percent(75)<cr>

" among_HML#fork {{{1
noremap <silent> H <Cmd>call among_HML#fork#init('H', '0', {
      \ 'K': '12.5',
      \ 'M': '50',
      \ 'J': '37.5',
      \ })<bar>
      \ call feedkeys('H')<cr>

"noremap <silent> H <Cmd>call among_HML#fork#init('H', '25', {
"      \ 'H': '0',
"      \ 'K': '12.5',
"      \ 'M': '50',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>

noremap <silent> K <Cmd>call among_HML#fork#init('K', 25, {
      \ 'K': '12.5',
      \ 'J': '37.5',
      \ })
      \ <bar>
      \ call feedkeys('K')<cr>

noremap <silent> M <Cmd>call among_HML#fork#init('M', 50, {
      \ 'H': '0',
      \ 'K': '25',
      \ 'J': '75',
      \ 'L': '100',
      \ })
      \ <bar>
      \ call feedkeys('M')<cr>

noremap <silent> J <Cmd>call among_HML#fork#init('J', 75, {
      \ 'K': '62.5',
      \ 'J': '87.5',
      \ })
      \ <bar>
      \ call feedkeys('J')<cr>

"noremap <silent> L <Cmd>call among_HML#fork#init('L', '75', {
"      \ 'K': '62.5',
"      \ 'J': '87.5',
"      \ 'M': '50',
"      \ 'L': '100',
"      \ })<bar>
"      \ call feedkeys('L')<cr>

noremap <silent> L <Cmd>call among_HML#fork#init('L', '100', {
      \ 'K': '62.5',
      \ 'J': '87.5',
      \ 'M': '50',
      \ })<bar>
      \ call feedkeys('L')<cr>

"" among_HML#get_half {{{1
"nnoremap <silent> H  :<c-u>call among_HML#get_half#to(0)<cr>
""nnoremap <silent> gM :<c-u>call among_HML#get_half#to(50)<cr>
"nnoremap <silent> L  :<c-u>call among_HML#get_half#to(100)<cr>

"" among_HML#scroll {{{1
"nnoremap <silent> <c-j> :<c-u>call among_HML#scroll#percent(25, 'down')<cr>
"nnoremap <silent> <c-k> :<c-u>call among_HML#scroll#percent(25, 'up')<cr>

" Evacuations for default {{{1
if mapcheck('K') !=# ''
  nnoremap gK K
  xnoremap gK K
endif
if mapcheck('J') !=# ''
  nnoremap <space>J J
  xnoremap <space>J J
endif

