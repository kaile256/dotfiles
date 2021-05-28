" TOML: browse.toml
" Repo: liuchengxu/vista.vim
" Another: source/vista.vim

cnoremap <expr> <SID>(target)
      \ v:lua.vim.lsp.buf.server_ready()
      \   ? 'nvim_lsp'
      \ : exists('g:did_coc_loaded') && CocAction('ensureDocument')
      \   ? 'coc'
      \ : exists('g:loaded_ale') && g:ale_enabled && get(b:, 'ale_enabled', 1)
      \   ? 'ale'
      \ : ''
nmap <silent> <SID>(vista) :<C-u>Vista <SID>(target)<CR>

" '!' to close vista-buffer
" '!!' to toggle vista-buffer.
" Mnemonic: Outline
nmap <A-x>o     <SID>(vista)
nmap <A-x><A-o> <SID>(vista)
