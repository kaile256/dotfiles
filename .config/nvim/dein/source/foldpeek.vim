scriptencoding utf-8
" From: myplug.toml
" Repo: kaile256/vim-foldpeek
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195
" Another: post/foldpeek.vim

let g:foldpeek#maxwidth = '
      \ &colorcolumn > 0 ? &colorcolumn - 1
      \                  : &textwidth > 0 ? &textwidth
      \                                   : 79
      \ '

let g:foldpeek#skip_patterns = [
      \ '^[<>#\-=/{!* \t]*$',
      \ '^```.*$',
      \ '^\s*"""$',
      \ ]

" candidates for s:foldlevel_dict {{{1
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
      \ 9: '[9]',
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

" show which line is peeked {{{1
" let g:foldpeek#head = "foldpeek#head('%HUNK%')"
" let g:foldpeek#tail = "foldpeek#tail('%PEEK%')"

let g:foldpeek#head = ''

function! foldpeek#tail(PEEK) abort
  let foldlines = v:foldend - v:foldstart + 1
  let foldlevel = s:foldlevel_dict[v:foldlevel]

  let foldinfo = foldlines . foldlevel

    let hunk_sign = ''
  if exists('g:loaded_gitgutter') && gitgutter#fold#is_changed()
    let hunk_sign = '@ '
  endif

  if a:PEEK == 1
    return ' '. hunk_sign . foldinfo
  endif

  return ' '. hunk_sign . (a:PEEK) .'/'. foldinfo
endfunction

augroup myFoldPeekSource "{{{1
  if exists('#myFoldPeekSource') | au! myFoldPeekSource
  endif

  au OptionSet * if &fdt !=# 'foldpeek#text()' |
        \   setl fdt=foldpeek#text()
        \ | endif

  au FileType php,html call s:peek_php()
  au FileType help call s:peek_help()
  au FileType toml call s:peek_toml()
  au FileType neosnippet call s:peek_neosnippet()
  au FileType snippets call s:peek_ultisnips()
augroup END

function! s:peek_php() abort "{{{2
  let b:foldpeek_skip_patterns = [
        \ '^\s*<\w\+>\s*$',
        \ ]
endfunction

function! s:peek_help() abort "{{{2
  let b:foldpeek_whiteout_patterns_left = [
        \ '^\u\+\s\+',
        \ '\*.\+\*\s*$',
        \ ]
  let b:foldpeek_whiteout_patterns_substitute = [
        \ ['\v*(.+)\*', '  * \1', ''],
        \ ['\*\s*\*', ' / ', 'g'],
        \ ['^\ze\u', '- ', ''],
        \ ]
        "\ ['\v\W+vim\W+(.*)', '(\1)', ''],
endfunction

function! s:peek_toml() abort "{{{2
  if expand('%:p') =~# fnamemodify($MYVIMRC, ':h')
    let b:foldpeek_skip_patterns = [
          \ '^[>#\-=/{!* \t]*$',
          \ '[# \t]*\[\[plugins]]',
          \ '[# \t]*\[\[\=package]',
          \ ]

    let b:foldpeek_whiteout_patterns_omit = [
          \ 'repo = ',
          \ ]

  else
    let b:foldpeek_whiteout_patterns_omit = [
          \ 'name = ',
          \ ]
  endif
endfunction

function! s:peek_neosnippet() abort "{{{2
  let b:foldpeek_whiteout_patterns_omit = [
        \ ]
  " let b:foldpeek_whiteout_patterns_omit = [
  "      \ '^snippet\s*'
  "      \ ]
endfunction
function! s:peek_ultisnips() abort "{{{2
  let b:foldpeek_whiteout_patterns_left = [
        \ ['^snippet ', '".*"'],
        \ ['^snippet ', 'snippet \zs\v[^"]+"@!'],
        \ ]

  let b:foldpeek_whiteout_patterns_substitute = [
        \ ['snippet \zs\ze[^"]', '"no description" => ', ''],
        \ ]
endfunction
