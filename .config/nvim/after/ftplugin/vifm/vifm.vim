setlocal syn=vim

" Borrow vim's indentexpr for the file contains vifm's original syntax which
" LSP regards error; when the file only has the same syntax as vim, set ft=vim
" instead of 'vifm' esp. to let LSP to check the syntax.
setlocal indentexpr=GetVimIndent()
