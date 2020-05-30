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

" " Head & Tail {{{1
" let g:foldpeek#head = 'FoldpeekHead()'
" let g:foldpeek#tail = 'FoldpeekTail()'

" function! FoldpeekHead() abort "{{{2
"   let sign = ''
"   if foldpeek#git#has_diff()
"     let sign .= g:foldpeek#default#hunk_sign
"   endif

"   let tail = FoldpeekTail()
"   if get(foldpeek#cache#text(v:foldstart), 'return')
"        \ =~# '^ \{'. len(tail) .'}'
"     let sign .= string(tail)
"   endif

"   return empty(sign)
"        \ ? ''
"        \ : sign . g:foldpeek#default#head_padding
" endfunction

" function! FoldpeekTail() abort "{{{2
"   let foldlines = v:foldend - v:foldstart + 1
"   let foldlevel = g:foldpeek#default#foldlevel_signs[v:foldlevel]

"   let fold_info = foldlines . foldlevel
"   let git_info = ''
"   let git_diff = foldpeek#git#get_diff()
"   if foldpeek#git#has_diff()
"     let git_info = g:foldpeek#default#hunk_format
"     let git_info = substitute(git_info, '%a', git_diff.Added,    'e')
"     let git_info = substitute(git_info, '%m', git_diff.Modified, 'e')
"     let git_info = substitute(git_info, '%r', git_diff.Removed,  'e')
"   endif

"   let peeked_offset = foldpeek#get_offset()
"   if peeked_offset > 0
"     let peeked_depth = peeked_offset + 1
"     let fold_info = peeked_depth .'/'. fold_info
"   endif

"   let ret = git_info . fold_info
"   " let ret = foldpeek#whiteout#is_applied() ? (ret .'!') : (' '. ret)
"   if foldpeek#whiteout#is_applied()
"     let ret = '.'. ret
"   endif

"   return g:foldpeek#default#tail_padding . ret
" endfunction

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

function! s:peek.vim() abort "{{{2
  " when &fdm is *not* set to 'marker'
  let b:foldpeek_skip_patterns = [
        \ '^\s*au!\s*$'
        \ ]
endfunction

function! s:peek.php() abort "{{{2
  let b:foldpeek_skip_patterns = [
        \ '^\s*<\w\+>\s*$',
        \ ]
endfunction

function! s:peek.help() abort "{{{2
  let index = '^\(\u\|\d\+\.\).\{-}\ze\s*\(\*.\+\*\s*$\)\@='
  let help_tag_index = '^\s*.\{-}\ze\s\+\*.\+\*\s*$'
  let help_tag = '\*.\+\*\s*$'
  let b:foldpeek_whiteout_patterns.match = [
        \ index,
        \ help_tag_index,
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

  let capitarized_index = '^\(\u.\{-1,}\)\s*\*.\+\*\s*$'
  let numbered_index    = '^\(\d.\+\)\s*$'

  let sub_index = '\(^\s*\S\{2,}.*\)\s\+\*.\+\*\s*$'
  let help_tag  = '^\s\{-}\*\(\S.\+\)\*$'

  let Mark_on_capitalized_index = [capitarized_index, '- \1', '']
  let Mark_on_numbered_index    = [numbered_index, '- \1', '']
  let Separate_multi_tags = ['\*\s*\*', ' || ', 'g']
  let Indent_sub_index = [sub_index, '  * \1', '']
  let Show_only_tags_index = [help_tag, '  * \1', '']
  let b:foldpeek_whiteout_patterns.substitute = [
        \ Mark_on_capitalized_index,
        \ Mark_on_numbered_index,
        \ Separate_multi_tags,
        \ Indent_sub_index,
        \ Show_only_tags_index,
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
