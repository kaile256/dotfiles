scriptencoding utf-8
" From: myplug.toml
" Repo: kaile256/vim-foldpeek
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195
" Another: post/foldpeek.vim

augroup myFoldPeekSource
  au!
  au OptionSet *
        \ if &fdt !=# 'foldpeek#text()'
        \ |  setl fdt=foldpeek#text()
        \ | endif

  au FileType help let b:foldpeek_whiteout_patterns_fill = ['*']
augroup END

let g:foldpeek#skip_patterns = [
      \ '^[#\-=/{!* \t]*$',
      \ '^```.*$',
      \ '^\s*"""$',
      \ '[# \t]*\[\[plugins]]',
      \ '[# \t]*\[\[\=package]'
      \ ]

let g:foldpeek#whiteout_patterns_omit = [
      \ 'repo = ',
      \ 'name = ',
      \ ]

" table of variales on foldpeek {{{1
" candidates for s:foldlevel_dict {{{2
"let s:foldlevel_dict = {
"      \ 1: '❶ ',
"      \ 2: '❷ ',
"      \ 3: '❸ ',
"      \ 4: '❹ ',
"      \ 5: '❺ ',
"      \ 6: '❻ ',
"      \ 7: '❼ ',
"      \ 8: '❽ ',
"      \ 9: '❾ '
"      \ }

"let s:foldlevel_dict = {
"      \ 1: '  ',
"      \ 2: 'Ⅱ ',
"      \ 3: 'Ⅲ ',
"      \ 4: 'Ⅳ ',
"      \ 5: 'Ⅴ ',
"      \ 6: 'Ⅵ ',
"      \ 7: 'Ⅶ ',
"      \ 8: 'Ⅷ ',
"      \ 9: 'Ⅸ '
"      \ }
"

"let s:foldlevel_dict = {
"      \ 1: '  ',
"      \ 2: '𝟚 ',
"      \ 3: '𝟛 ',
"      \ 4: '𝟜 ',
"      \ 5: '𝟝 ',
"      \ 6: '𝟞 ',
"      \ 7: '𝟟 ',
"      \ 8: '𝟠 ',
"      \ 9: '𝟡 '
"      \ }

"let s:foldlevel_dict = {
"      \ 1: 'ⅰ ',
"      \ 2: 'ⅱ ',
"      \ 3: 'ⅲ ',
"      \ 4: 'ⅳ ',
"      \ 5: 'ⅴ ',
"      \ 6: 'ⅵ ',
"      \ 7: 'ⅶ ',
"      \ 8: 'ⅷ,',
"      \ }

let s:foldlevel_dict = {
      \ 1: '[-]',
      \ 2: '[2]',
      \ 3: '[3]',
      \ 4: '[4]',
      \ 5: '[5]',
      \ 6: '[6]',
      \ 7: '[7]',
      \ 8: '[8]',
      \ }

"let s:foldlevel_dict = {
"      \ 1: 'い',
"      \ 2: 'ろ',
"      \ 3: 'は',
"      \ 4: 'に',
"      \ 5: 'ほ',
"      \ 6: 'へ',
"      \ 7: 'と',
"      \ 8: 'ち',
"      \ }

"let s:foldlevel = "(v:foldlevel > 1 ? ". string(s:foldlevel_dict) ."[v:foldlevel] : ' ')"
" modify in s:foldlevel_dict w/o ternary operators
let s:foldlevel = string(s:foldlevel_dict) .'[v:foldlevel]'

"}}}2

let g:foldpeek#table = {
      \ '10persome' : "(len(matchstr(%percent%, '\d\+')) == 1 ? %permill% : %percent%)",
      \
      \ '20percent' : "(100  * %PEEK% / %foldlines%) .'%'",
      \ '30permill' : "(1000 * %PEEK% / %foldlines%) .'‰ '",
      \
      \ '50foldlevel' : string(s:foldlevel),
      \ '50foldlines' : 'v:foldend - v:foldstart + 1',
      \ }

let s:foldlines = 'v:foldend - v:foldstart + 1'

"let g:foldpeek#table = {
"      \ '50foldlevel' : string(s:foldlevel),
"      \ '50foldlines' : 'v:foldend - v:foldstart + 1',
"      \ }
"" show in percent {{{1
"let g:foldpeek#tail = {
"      \ 1: "' '. (%percent%) . (%foldlevel%)",
"      \ }
"

"" show in permill {{{1
"let g:foldpeek#tail = {
"      \ 1: "' '. (%permill%) . (%foldlevel%)",
"      \ }
"
"" show in percent/permill as the digit number {{{1
"" no use yet
"let g:foldpeek#tail = {
"      \ 1: "' '. (%persome%) . (%foldlevel%)",
"      \ }
"
" show which line is peeked {{{1
let g:foldpeek#head = ''

let g:foldpeek#tail = {
      \ 1: "' '. (%foldlines%) . (%foldlevel%)",
      \ 2: "' '. (%PEEK%) .'/'. (%foldlines%) . (%foldlevel%)",
      \ }

"let g:foldpeek#tail = {
"      \ 1: "' '. (%foldlevel%) . (%foldlines%) .' '",
"      \ 2: "' '. (%foldlevel%) . (%PEEK%) . '/' . (%foldlines%) .' '",
"      \ }

"let s:marker_l1 = "v:foldlevel > 1 ? ". string(s:foldlevel_dict) ."[v:foldlevel] : ']'"
"let s:persome   = '(len(%percent%) == 1 ? %permill% : %percent%)'

