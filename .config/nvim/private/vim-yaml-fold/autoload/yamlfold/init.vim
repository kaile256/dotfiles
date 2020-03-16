" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}1

let s:styles = ['imports', 'pairs']

function! yamlfold#init#line() abort
  " Ref: https://github.com/pedrohdz/vim-yaml-folds
  let g:yamlfold#_line = getline(v:lnum)

  call s:get_indent_around()

  if !exists('b:yamlfold__init')
    let b:yamlfold__init = 1
    call s:init_at_buffer()
  endif

  call s:presume_foldlevel()
endfunction

function! s:get_indent_around() abort "{{{1
  let g:yamlfold#_indent_here  = indent(v:lnum)
  let g:yamlfold#_indent_above = indent(prevnonblank(v:lnum - 1))
  let g:yamlfold#_indent_below = indent(nextnonblank(v:lnum + 1))
endfunction

function! s:init_at_buffer() abort "{{{1
  for style in s:styles
    let {'b:yamlfold_'. style} = get(b:, 'yamlfold_'. style,
          \ exists('b:yamlfold_'. style)
          \   ? {'b:yamlfold_'. style}
          \   : get({'g:yamlfold#'. style}, &ft, [])
          \ )
  endfor
endfunction

function! s:presume_foldlevel() abort "{{{1
  if 0 < g:yamlfold#_indent_here && g:yamlfold#_indent_here <= 8
        \ && !exists('b:yamlfold__indentsize')
        \ && s:out_of_pairblock()
    " Note: &shiftwidth, instead of this detection, could be different from
    " actually used indent
    let b:yamlfold__indentsize = g:yamlfold#_indent_here
  endif

  " Note: foldlevel() is no use in function for 'foldexpr' presently at least.
  let g:yamlfold#_foldlevel_as_here  = g:yamlfold#_indent_here  / b:yamlfold__indentsize + 1
  let g:yamlfold#_foldlevel_as_above = g:yamlfold#_indent_above / b:yamlfold__indentsize + 1
  let g:yamlfold#_foldlevel_as_below = g:yamlfold#_indent_below / b:yamlfold__indentsize + 1
endfunction

function! s:out_of_pairblock() abort "{{{2
  " Note: the check is only to ignore any indent in pair-block which could
  "   be different from those in codes; thus, when b:yamlfold__indentsize is
  "   decided, always return true.
  if exists('b:yamlfold__indentsize') | return 0 | endif

  let start =  b:yamlfold_pairs[0]
  if !exists('b:yamlfold__out_of_pairblock') && g:yamlfold#_line =~# start
    let b:yamlfold__out_of_pairblock = 1
    return 0

  elseif exists('b:yamlfold__out_of_pairblock')
    return 0
  endif

  return 1
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
