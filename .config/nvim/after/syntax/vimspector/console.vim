function! s:set_ft()
  for bufnr in tabpagebuflist()
    let ft = getbufvar(bufnr, '&filetype')
    if ft !=# '' | break | endif
  endfor
  exe 'runtime! syntax/' . ft . '.vim syntax/' . ft . '/*.vim'
endfunction
call s:set_ft()
delfunction s:set_ft

syn keyword VimspectorBreakpoint Breakpoint

syn keyword VimspectorExternal exec
"
" syn match VimspectorNumber +\d+

syn match VimspectorPath ;/\f\+;

syn match VimspectorFunction +\<\h\w* \ze()+

hi def link VimspectorBreakpoint Type
hi def link VimspectorExternal Statement

hi def link VimspectorPath String
hi def link VimspectorFunction Function
" hi def link VimspectorNumber Number
