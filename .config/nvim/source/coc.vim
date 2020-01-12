" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: .config/coc/extensions
" Json: coc-settings.json
" Another: add/coc.vim

augroup myCocSource
  au!
  au FileType coc,list setl laststatus=0
        \ | au BufWinEnter,WinLeave,BufLeave * ++once set laststatus=2
  "" Only for snippet's feature?
  "au User     CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight symbol under cursor on CursorHold
  "au CursorHold * silent call CocActionAsync('highlight')
augroup END

augroup myCocSourceImport
  au!
  au BufWritePre *.go call CocActionAsync('runCommand', 'editor.action.organizeImport')
augroup END

" the List of CocExtentions; "{{{1
" Note: have to install LSPs independently.
" Note: coc-highlight made CPU overwork
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-bookmark',
      \ 'coc-conjure',
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-elixir',
      \ 'coc-emoji',
      \ 'coc-fish',
      \ 'coc-flow',
      \ 'coc-flutter',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-go',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-markdownlint',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-post',
      \ 'coc-prettier',
      \ 'coc-project',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tag',
      \ 'coc-texlab',
      \ 'coc-todolist',
      \ 'coc-translator',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]

" CocPairs {{{1
"augroup myCocPairsDisable
"  au!
"  au FileType vim let b:coc_pairs_disabled = ['"']
"augroup END

