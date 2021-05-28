" TOML: browse.toml
" Repo: liuchengxu/vista.vim
" Another: source/vista.vim

cnoremap <expr> <SID>(target)
      \ v:lua.vim.lsp.buf.server_ready()
      \   ? 'nvim_lsp'
      \   : exists('g:did_coc_loaded') && CocAction('ensureDocument')
      \     ? 'coc'
      \   : ''
nmap <silent> <SID>(vista) :<C-u>Vista <SID>(target)<CR>

" '!' to close vista-buffer
" '!!' to toggle vista-buffer.
" Mnemonic: Outline
nmap <A-x>o     <SID>(vista)
nmap <A-x><A-o> <SID>(vista)
