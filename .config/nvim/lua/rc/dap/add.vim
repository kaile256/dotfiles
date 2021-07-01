" TOML: debug.toml
" Repo: mfussenegger/nvim-dap

" Mnemonic: Toggle breakpoint like marking.
nnoremap mm <Cmd>lua require"dap".toggle_breakpoint()<CR>
nnoremap <Plug>(dap-continue) <Cmd>lua require"dap".continue()<CR>
nmap `m <Plug>(dap-continue)
