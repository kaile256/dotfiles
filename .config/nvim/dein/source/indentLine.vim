scriptencoding utf-8
" From: appearance.toml
" Repo: Yggdroot/indentLine

let g:indentLine_faster = 1

" Note: remove 'concealends' manually from $VIMRUNTIME/syntax/json.vim
" sp $VIMRUNTIME/syntax/json.vim | %s/ concealends//e
let g:indentLine_conceallevel = 1 " 0: disable indentLine
" let g:indentLine_concealcursor = '' " [empty]: disable indentLine
" let g:indentLine_setConceal = 0 " false: disable indentLine
" let g:indentLine_showFirstIndentLevel = 1

let g:indentline_color_term = 239
let g:indentLine_color_gui = '#5c754e'

" let g:indentLine_fileType = ['python', 'json']

" Note: the options to exclude causes a bulk of problems,
"   for example, defx cannot conceal its marker '**'.
let g:indentLine_fileTypeExclude = [
      \ 'Mundo',
      \ 'defx',
      \ 'help',
      \ 'markdown',
      \ ]

let g:indentLine_bufTypeExclude = [
      \ 'help',
      \ 'quickfix',
      \ 'terminal',
      \ ]

let s:indentLine_chars = ['|', '¦']
let g:indentLine_char_list = s:indentLine_chars

augroup myIndentLineSo-toggleIndentChars
  au BufEnter * call s:set_min_indent_to_show()
  au OptionSet tabstop,shiftwidth,softtabstop call s:set_min_indent_to_show()
augroup END

function! s:set_min_indent_to_show() abort
  if &et == 0 | return | endif

  if &tabstop > 3
    let g:indentLine_char_list = s:indentLine_chars
  else
    if !exists('s:chars_by_two')
      let separator = ' '
      let size = len(s:indentLine_chars)
      let chars = []
      let idx = 0
      while idx < size
        let chars += [separator, s:indentLine_chars[idx]]
        let idx += 1
      endwhile
      let s:chars_by_two = chars
    endif

    let g:indentLine_char_list = s:chars_by_two
  endif
endfunction
