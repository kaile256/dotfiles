" TOML: treesitter.toml
" Repo: JoosepAlviste/nvim-ts-context-commentstring

augroup myTSContextCommentstring/AutoUpdateCommentString
  au FileType vue,{java,type}scriptreact au! CursorMoved <buffer>
        \ lua require('ts_context_commentstring').update_commentstring()
augroup END

