" From: myplug.toml
" Repo: kaile256/vim-among_HML

let g:among_HML#no_default_mappings = 1

xnoremap <space>J J

" among_HML#fork {{{1
"" 13 Patterns {{{2
"map <silent> H <Cmd>call among_HML#fork#init('H', '0', {
"      \ 'J': '8.333333',
"      \ })<bar>
"      \ call feedkeys('H')<cr>
"
"map <silent> K <Cmd>call among_HML#fork#init('K', 25, {
"      \ 'K': '16.666667',
"      \ 'J': '33.333333',
"      \ })<bar>
"      \ call feedkeys('K')<cr>
"
"map <silent> M <Cmd>call among_HML#fork#init('M', 50, {
"      \ 'K': '41.666667',
"      \ 'J': '58.333333',
"      \ })<bar>
"      \ call feedkeys('M')<cr>
"
"map <silent> J <Cmd>call among_HML#fork#init('J', 75, {
"      \ 'K': '66.666667',
"      \ 'J': '83.333333',
"      \ })<bar>
"      \ call feedkeys('J')<cr>
"
"map <silent> L <Cmd>call among_HML#fork#init('L', '100', {
"      \ 'K': '91.666667',
"      \ })<bar>
"      \ call feedkeys('L')<cr>
"
" 9 Patterns -- H/L simple {{{2
" map <silent> H <Cmd>call among_HML#fork#init('H', '0', {
"      \ 'J': '12.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>

map <silent> K <Cmd>call among_HML#fork#init('K', 25, {
      \ 'K': '12.5',
      \ 'J': '37.5',
      \ })<bar>
      \ call feedkeys('K')<cr>

map <silent> M <Cmd>call among_HML#fork#init('M', 50, {
      \ 'K': '37.5',
      \ 'J': '67.5',
      \ })<bar>
      \ call feedkeys('M')<cr>

map <silent> J <Cmd>call among_HML#fork#init('J', 75, {
      \ 'K': '62.5',
      \ 'J': '87.5',
      \ })<bar>
      \ call feedkeys('J')<cr>

" map <silent> L <Cmd>call among_HML#fork#init('L', '100', {
"      \ 'K': '87.5',
"      \ })<bar>
"      \ call feedkeys('L')<cr>

"" 9 Patterns -- H/L complex {{{2
"map <silent> H <Cmd>call among_HML#fork#init('H', '0', {
"      \ 'K': '12.5',
"      \ 'M': '25',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>
"
"map <silent> K <Cmd>call among_HML#fork#init('K', 25, {
"      \ 'K': '12.5',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('K')<cr>
"
"map <silent> J <Cmd>call among_HML#fork#init('J', 75, {
"      \ 'K': '62.5',
"      \ 'J': '83.333333',
"      \ })<bar>
"      \ call feedkeys('J')<cr>
"
"map <silent> L <Cmd>call among_HML#fork#init('L', '100', {
"      \ 'K': '62.5',
"      \ 'J': '87.5',
"      \ 'M': '75',
"      \ })<bar>
"      \ call feedkeys('L')<cr>
"
"" 9 Patterns -- H/L on 1/4 {{{2
"map <silent> H <Cmd>call among_HML#fork#init('H', '25', {
"      \ 'H': '0',
"      \ 'K': '12.5',
"      \ 'M': '50',
"      \ 'J': '37.5',
"      \ })<bar>
"      \ call feedkeys('H')<cr>
"
"map <silent> L <Cmd>call among_HML#fork#init('L', '75', {
"      \ 'K': '62.5',
"      \ 'J': '87.5',
"      \ 'M': '50',
"      \ 'L': '100',
"      \ })<bar>
"      \ call feedkeys('L')<cr>
"
"" among_HML#asymptote {{{1
" nmap <silent> H  :<c-u>call among_HML#asymptote#to(0)<cr>
" "nmap <silent> gM :<c-u>call among_HML#asymptote#to(50)<cr>
" nmap <silent> L  :<c-u>call among_HML#asymptote#to(100)<cr>

"" among_HML#scroll {{{1
"nmap <silent> <c-j> :<c-u>call among_HML#scroll#percent(25, 'down')<cr>
"nmap <silent> <c-k> :<c-u>call among_HML#scroll#percent(25, 'up')<cr>

" among_HML#jump {{{1
omap <silent> K <Cmd>call among_HML#jump(25)<cr>
omap <silent> J <Cmd>call among_HML#jump(75)<cr>
" omap <silent> H H
" omap <silent> L L

" Evacuations for default {{{1
if mapcheck('K') !=# ''
  " Mnemonic: Get the Keyword
  silent! nnoremap <unique> gK K
  silent! xnoremap <unique> gK K
endif

"if mapcheck('J') !=# ''
"  " Mnemonic: <space>-leaving Join
"  silent! nmap <unique> <space>J J
"  silent! xmap <unique> <space>J J
"  silent! nmap <unique> gJ J"_x
"endif

"function! s:join() abort "{{{1
"  " FIXME: make it work
"  silent! .1s/^\s*\\/
"  join
"endfunction

" augroup myAmongHMLPost
"   " TODO: Remove any mappings on J/K on <buffer>.
"   au!
"   au BufNew * if maparg('J', '', 0, 1).buffer | unmap <buffer> J | endif
"   au BufNew * if maparg('K', '', 0, 1).buffer | unmap <buffer> K | endif
" augroup END
