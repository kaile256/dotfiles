"""" From: tool.toml

augroup OrgMode
  au!
  au BufReadPost *.org s:org_general()
  au BufReadPost *.org s:org_keymap()
augroup END

function! s:org_general()

endfunction

function! s:org_keymap()
  let maplocalleader='\<space>'
endfunction
