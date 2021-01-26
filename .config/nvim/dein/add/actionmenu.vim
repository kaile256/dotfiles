" TOML: lsp.toml
" Repo: voldikss/actionmenu.nvim

let s:code_actions = []

function! s:coc_actionmenu_codeaction() abort
  let s:code_actions = CocAction('codeActions')
  let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
  call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
endfunction

function! ActionMenuCodeActionsCallback(index, item) abort
  if a:index >= 0
    let l:selected_code_action = s:code_actions[a:index]
    let l:response = CocAction('doCodeAction', l:selected_code_action)
  endif
endfunction

command! CocActionMenuCodeAction :call <SID>coc_actionmenu_codeaction()

nnoremap <expr><silent> cm (CocHasProvider('codeAction') == v:true)? ':CocActionMenuCodeAction<cr>' : ':echo " codeAction is unavailable on this filetype."<cr>'
