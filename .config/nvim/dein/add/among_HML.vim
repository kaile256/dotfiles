" From: myplug.toml
" Repo: kaile256/vim-among_HML

let g:among_HML#no_default_mappings = 1

" among_HML#fork {{{1
"" 13 Patterns {{{2
"noremap <silent> H <Cmd>call among_HML#fork#init('H', '0', {
"      \ 'J': '8.333333',
"      \ })<bar>
"      \ call feedkeys('H')<cr>
"
"noremap <silent> K <Cmd>call among_HML#fork#init('K', 25, {
"      \ 'K': '16.666667',
"      \ 'J': '33.333333',
"      \ })<bar>
"      \ call feedkeys('K')<cr>
"
"noremap <silent> M <Cmd>call among_HML#fork#init('M', 50, {
"      \ 'K': '41.666667',
"      \ 'J': '58.333333',
"      \ })<bar>
"      \ call feedkeys('M')<cr>
"
"noremap <silent> J <Cmd>call among_HML#fork#init('J', 75, {
"      \ 'K': '66.666667',
"      \ 'J': '83.333333',
"      \ })<bar>
"      \ call feedkeys('J')<cr>
"
"noremap <silent> L <Cmd>call among_HML#fork#init('L', '100', {
"      \ 'K': '91.666667',
"      \ })<bar>
"      \ call feedkeys('L')<cr>
"
" 9 Patterns -- H/L simple {{{2
noremap <silent> H <Cmd>call among_HML#fork#init('H', '0', {
      \ 'J': '12.5',
      \ })<bar>
      \ call feedkeys('H')<cr>

noremap <silent> K <Cmd>call among_HML#fork#init('K', 25, {
      \ 'K': '12.5',
      \ 'J': '37.5',
      \ })<bar>
      \ call feedkeys('K')<cr>

noremap <silent> M <Cmd>call among_HML#fork#init('M', 50, {
      \ 'K': '37.5',
      \ 'J': '67.5',
      \ })<bar>
      \ call feedkeys('M')<cr>

noremap <silent> J <Cmd>call among_HML#fork#init('J', 75, {
      \ 'K': '62.5',
      \ 'J': '87.5',
      \ })<bar>
      \ call feedkeys('J')<cr>

noremap <silent> L <Cmd>call among_HML#fork#init('L', '100', {
      \ 'K': '87.5',
      \ })<bar>
      \ call feedkeys('L')<cr>

"" 9 Patterns -- H/L complex {{{2
"noremap <silent> H <Cmd>call among_HML#fork#init('H', '0', {
"      \ 'K': '12.5',
"      \ 'M': '25',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>
"
"noremap <silent> K <Cmd>call among_HML#fork#init('K', 25, {
"      \ 'K': '12.5',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('K')<cr>
"
"noremap <silent> J <Cmd>call among_HML#fork#init('J', 75, {
"      \ 'K': '62.5',
"      \ 'J': '83.333333',
"      \ })<bar>
"      \ call feedkeys('J')<cr>
"
"noremap <silent> L <Cmd>call among_HML#fork#init('L', '100', {
"      \ 'K': '62.5',
"      \ 'J': '87.5',
"      \ 'M': '75',
"      \ })<bar>
"      \ call feedkeys('L')<cr>
"
"" 9 Patterns -- H/L on 1/4 {{{2
"noremap <silent> H <Cmd>call among_HML#fork#init('H', '25', {
"      \ 'H': '0',
"      \ 'K': '12.5',
"      \ 'M': '50',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>
"
"noremap <silent> L <Cmd>call among_HML#fork#init('L', '75', {
"      \ 'K': '62.5',
"      \ 'J': '87.5',
"      \ 'M': '50',
"      \ 'L': '100',
"      \ })<bar>
"      \ call feedkeys('L')<cr>
"
"" among_HML#get_half {{{1
"nnoremap <silent> H  :<c-u>call among_HML#get_half#to(0)<cr>
""nnoremap <silent> gM :<c-u>call among_HML#get_half#to(50)<cr>
"nnoremap <silent> L  :<c-u>call among_HML#get_half#to(100)<cr>

"" among_HML#scroll {{{1
"nnoremap <silent> <c-j> :<c-u>call among_HML#scroll#percent(25, 'down')<cr>
"nnoremap <silent> <c-k> :<c-u>call among_HML#scroll#percent(25, 'up')<cr>

" among_HML#jump {{{1
onoremap <silent> K <Cmd>call among_HML#jump(25)<cr>
onoremap <silent> J <Cmd>call among_HML#jump(75)<cr>
onoremap <silent> H H
onoremap <silent> L L

" Evacuations for default {{{1
if mapcheck('K') !=# ''
  " Mnemonic: Get the Keyword
  silent! nnoremap <unique> gK K
  silent! xnoremap <unique> gK K
endif

"if mapcheck('J') !=# ''
"  " Mnemonic: <space>-leaving Join
"  silent! nnoremap <unique> <space>J J
"  silent! xnoremap <unique> <space>J J
"  silent! nnoremap <unique> gJ J"_x
"endif
"
"function! s:join() abort "{{{1
"  " FIXME: make it work
"  silent! .1s/^\s*\\/
"  join
"endfunction
