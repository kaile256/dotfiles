" TOML: insert.toml
" Repo: hrsh7th/nvim-compe

inoremap <silent><expr> <C-n> pumvisible() ? '<C-n>' : compe#complete()
inoremap <silent><expr> <C-p> pumvisible() ? '<C-p>' : compe#complete()

if dein#tap('vim-snatch')
  imap <silent><expr> <C-e>
        \ compe#close("\<lt>Plug>(snatch-oneshot-hor-or-reg-ctrl-e)")
  imap <silent><expr> <C-y>
        \ compe#confirm("\<lt>Plug>(snatch-oneshot-hor-or-reg-ctrl-y)")
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
