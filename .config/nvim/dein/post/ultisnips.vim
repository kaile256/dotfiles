" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: add/ultisnips.vim
" Another: source/ultisnips.vim

" Note: Too heavy; use coc's one instead.
silent! augroup! UltiSnips_AutoTrigger

augroup myUltisnipsPost
  au BufWritePre * silent!
        \ doautocmd <nomodeline> User UltiSnipsExitLastSnippet
augroup END
