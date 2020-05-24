scriptencoding utf-8
" From: myplug.toml
" Repo: kaile256/vim-foldpeek
" Orig: LeafCage/foldCC
" Ref: source/foldCC.vim
" Ref: vimwiki_dev/ftplugin/vimwiki.vim @195
" Another: post/foldpeek.vim

let g:foldpeek#maxwidth = &colorcolumn > 0 ? &colorcolumn - 1
      \                   : (&tw > 0 ? &tw : 79)

" let g:foldpeek#whiteout#patterns = {
"      \ 'substitute': [
"      \   ['{\zs\s*$', ' … }', ''],
"      \   ['(\zs\s*$', ' … )', ''],
"      \   ['[\zs\s*$', ' … ]', ''],
"      \   ]
"      \ }

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

" Head & Tail {{{1
let g:foldpeek#head = 'FoldpeekHead()'
" let g:foldpeek#head = ''
let g:foldpeek#tail = 'FoldpeekTail()'
let s:hunk_sign = '@ '
let s:hunk_format = '(+%a ~%m -%r)'

function! FoldpeekHead() abort "{{{2
  let hunk_sign = ''
  if foldpeek#git#status().has_diff
    let hunk_sign = s:hunk_sign
  endif
  return hunk_sign
endfunction

function! FoldpeekTail() abort "{{{2
  let foldlines = v:foldend - v:foldstart + 1
  let foldlevel = s:foldlevel_dict[v:foldlevel]

  let fold_info = foldlines . foldlevel

  let git_info = ''
  let git_stat = foldpeek#git#status()
  if git_stat.has_diff
    let git_info = s:hunk_format
    let git_info = substitute(git_info, '%a', git_stat.Added,    'g')
    let git_info = substitute(git_info, '%m', git_stat.Modified, 'g')
    let git_info = substitute(git_info, '%r', git_stat.Removed,  'g')
  endif

  if g:foldpeek_lnum > 1
    let fold_info = g:foldpeek_lnum .'/'. fold_info
  endif

  return ' '. git_info . fold_info
endfunction

augroup myFoldPeekSource "{{{1
  if exists('#myFoldPeekSource') | au! myFoldPeekSource
  endif

  au BufWinEnter * if &fdt !=# 'foldpeek#text()' |
        \   setl fdt=foldpeek#text()
        \ | endif
  au FileType * call s:set_patterns()
augroup END

let s:peek = {}
function! s:set_patterns() abort
  let b:foldpeek_whiteout_patterns = {}
  silent! call s:peek[&ft]()
  if empty(b:foldpeek_whiteout_patterns)
    unlet b:foldpeek_whiteout_patterns
  endif
endfunction

function! s:peek.php() abort "{{{2
  let b:foldpeek_skip_patterns = [
        \ '^\s*<\w\+>\s*$',
        \ ]
endfunction

function! s:peek.help() abort "{{{2
  let title_under_line = '^\u[A-Z ]\{-}\ze\s*\(\*.\+\*\s*$\)\@='
  let help_tag = '\*.\+\*\s*$'
  let b:foldpeek_whiteout_patterns.match = [
        \ title_under_line,
        \ help_tag,
        \ ]

  " function! FoldpeekHelp() abort
  "   let offset = foldpeek#status().offset
  "   " let offset = 0
  "   let help_tag = '\*.\+\*\s*$'
  "   let line = ''
  "   let sub = ''
  "   let subtitle = '^\S.\+\(\ze\(  \|\t\)\|$\)'
  "   if getline(v:foldstart + offset) =~# help_tag
  "     while line =~# help_tag
  "       let line = getline(v:foldstart + offset)
  "       let sub = matchstr(line, subtitle)
  "       if !empty(sub) | break | endif
  "       let offset += 1
  "     endwhile
  "   endif

  "   return 'offset is '. offset
  "   let ret = (!empty(sub) ? sub : '\1')
  "   return '  * '. ret
  " endfunction

  let Mark_on_title = ['^\ze\u', '- ', '']
  let function_tag = ['\v*.+-(.*\(\))\*', '  * \1', '']
  let Indent_tag = ['\v*(.+)\*', '  * \1', '']
  let Separate_multi_tags = ['\*\s*\*', ' || ', 'g']
  let b:foldpeek_whiteout_patterns.substitute = [
        \ Mark_on_title,
        \ function_tag,
        \ Indent_tag,
        \ Separate_multi_tags,
        \ ]
endfunction

function! s:peek.toml() abort "{{{2
  if expand('%:p') =~# fnamemodify($MYVIMRC, ':h')
    let b:foldpeek_skip_patterns = [
          \ '[# \t]*\[\[plugins]]',
          \ ]

    let b:foldpeek_whiteout_patterns.omit = [
          \ 'repo = ',
          \ ]

  else
    let b:foldpeek_whiteout_patterns.omit = [
          \ 'name = ',
          \ ]
  endif
endfunction

function! s:peek.snippets() abort "{{{2
  let b:foldpeek_whiteout_patterns.substitute = [
        \ ['^snippet \zs''\S\{-}''', "'regexp'", ''],
        \ ['^snippet \S\+ [^"]\+$', '"no description" => ', ''],
        \ ]
endfunction

function! s:peek.typescript() abort "{{{2
  let Remove_modifier = ['(.\{-}\zspublic \ze.\{-})', '', '']
  let Remove_type_annotation = ['(.\{-}\zs:\s\+\S\{-1,}\ze[,)]', '', '']
  let b:foldpeek_whiteout_patterns.subloop = [
        \ Remove_modifier,
        \ Remove_type_annotation,
        \ ]
endfunction
