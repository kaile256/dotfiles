" TOML: insert.toml
" Repo: hrsh7th/nvim-compe

if dein#tap('vim-snatch')
  imap <silent><expr> <C-e>
        \ compe#close("\<lt>Plug>(snatch-by-register-ctrl-e)")
  imap <silent><expr> <C-y>
        \ compe#confirm("\<lt>Plug>(snatch-by-register-ctrl-y)")
else
  inoremap <silent><expr> <C-e> compe#close('<C-e>')
  inoremap <silent><expr> <C-y> compe#confirm('<C-y>')
endif

function! s:pum_scroll(delta) abort
  if pumvisible()
    echom complete_info(['selected'])
    const idx = complete_info(['selected']).selected
    call timer_start(0, {->
          \ nvim_select_popupmenu_item(idx + a:delta, v:true, v:false, {})
          \ })
  endif
  return "\<Ignore>"
endfunction

inoremap <expr> <C-S-n> <SID>pum_scroll(+ &pumheight * 2 / 3)
inoremap <expr> <C-S-p> <SID>pum_scroll(- &pumheight * 2 / 3)
