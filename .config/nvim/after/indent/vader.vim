if exists('b:did_indent')
  finish
endif

runtime indent/vim.vim

finish

setlocal indentexpr=GetVaderIndent()
setlocal indentkeys+==Given,=Do,=Execute,=Then,=Expect,=Before,=After

if exists('*GetVaderIndent')
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

function! GetVaderIndent()
  " Find a non-blank line above the current line.
  let lnum = prevnonblank(v:lnum - 1)

  " At the start of the file use zero indent.
  if lnum == 0
    return 0
  endif
  let prev_text = getline(lnum)

  let ind = indent(lnum)
  return ind
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
