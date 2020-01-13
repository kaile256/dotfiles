scriptencoding utf-8
" From: myplug.toml
" Repo: kaile256/vim-foldpeek
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195
" Another: post/foldpeek.vim

augroup myFoldPeek
  au! OptionSet *
        \ if &fdt !=# 'foldpeek#text()'
        \ |  setl fdt=foldpeek#text()
        \ | endif
augroup END

let g:foldpeek#skip_patterns = [
      \ '^[\-=/{!* \t]*$',
      \ '^```.*$',
      \ '[# \t]*\[\[plugins]]',
      \ ]

let g:foldpeek#whiteout_patterns_omit = [
      \ 'repo =',
      \ ]

let s:foldlevel = {
      \ 2: '2',
      \ 3: '3',
      \ 4: '4',
      \ 5: '5',
      \ 6: '6',
      \ 7: '7',
      \ 8: '8',
      \ 9: '9'
      \ }

let s:foldlevel = {
      \ 1: '  ',
      \ 2: 'Ⅱ ',
      \ 3: 'Ⅲ ',
      \ 4: 'Ⅳ ',
      \ 5: 'Ⅴ ',
      \ 6: 'Ⅵ ',
      \ 7: 'Ⅶ ',
      \ 8: 'Ⅷ ',
      \ 9: 'Ⅸ '
      \ }

let s:foldlevel = {
      \ 2: '𝟚 ',
      \ 3: '𝟛 ',
      \ 4: '𝟜 ',
      \ 5: '𝟝 ',
      \ 6: '𝟞 ',
      \ 7: '𝟟 ',
      \ 8: '𝟠 ',
      \ 9: '𝟡 '
      \ }

let s:foldlevel = {
      \ 1: 'i',
      \ 2: 'ii',
      \ 3: 'iii',
      \ 4: 'iv',
      \ 5: 'v',
      \ 6: 'vi',
      \ 7: 'vii',
      \ }

let s:foldlevel_dict = {
      \ 1: 'ⅰ ',
      \ 2: 'ⅱ ',
      \ 3: 'ⅲ ',
      \ 4: 'ⅳ ',
      \ 5: 'ⅴ ',
      \ 6: 'ⅵ ',
      \ 7: 'ⅶ ',
      \ 8: 'ⅷ,',
      \ }

let g:foldpeek#head = ''

" show which line is peeked {{{1
let g:foldpeek#tail = {
      \ 1: "' '. (%foldlines%) . (%foldlevel%)",
      \ 2: "' '. (%PEEK%) . '/' . (%foldlines%) . (%foldlevel%)",
      \ }

"let g:foldpeek#tail = {
"      \ 1: "' '. (%foldlevel%) . (%foldlines%) .' '",
"      \ 2: "' '. (%foldlevel%) . (%PEEK%) . '/' . (%foldlines%) .' '",
"      \ }

"let s:marker_l1 = "v:foldlevel > 1 ? ". string(s:foldlevel_dict) ."[v:foldlevel] : ']'"
"let s:persome   = '(len(%percent%) == 1 ? %permill% : %percent%)'

" show in percent {{{1
let g:foldpeek#tail = {
      \ 1: "' '. (%percent%) . (%foldlevel%)",
      \ }

let g:foldpeek#tail = {
      \ 1: "' '. (%permill%) . (%foldlevel%)",
      \ }

"let g:foldpeek#tail = {
"      \ 1: "' '. (%persome%) . (%foldlevel%)",
"      \ }
"
" format {{{1
"let s:foldlevel = "(v:foldlevel > 1 ? ". string(s:foldlevel_dict) ."[v:foldlevel] : ' ')"
" modify in s:foldlevel_dict w/o ternary operators
let s:foldlevel = string(s:foldlevel_dict) .'[v:foldlevel]'

let g:foldpeek#table = {
      \ '10persome' : "(len(matchstr(%percent%, '\d\+')) == 1 ? %permill% : %percent%)",
      \
      \ '20percent' : "(100 * %PEEK% / %foldlines%) .'%'",
      \ '30permill' : "(1000 * %PEEK% / %foldlines%) .'‰ '",
      \
      \ '50foldlevel' : string(s:foldlevel),
      \ '50foldlines' : 'v:foldend - v:foldstart + 1',
      \ }


