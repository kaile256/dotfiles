" TOML: git.toml
" REPO: lambdalisue/gina.vim
" Another: add/gina.vim

" Alias {{{1
call gina#custom#command#alias('branch', 'br')
call gina#custom#action#alias(
      \ 'branch', 'track',
      \ 'checkout:track'
      \)
call gina#custom#action#alias(
      \ 'branch', 'merge',
      \ 'commit:merge'
      \)
call gina#custom#action#alias(
      \ 'branch', 'rebase',
      \ 'commit:rebase'
      \)

" Options {{{1
call gina#custom#command#option('/\v%(diff)',
      \ '--opener', 'bot vsplit'
      \)
call gina#custom#command#option('/\v%(branch)',
      \ '--opener', 'bel vsplit'
      \)
call gina#custom#command#option('/\v%(compare)',
      \ '--opener', 'tabe'
      \)
call gina#custom#command#option('/\v%(log|reflog)',
      \ '--opener', 'tabe'
      \)

call gina#custom#command#option('log',
      \ '--group', 'log-viewer',
      \)
call gina#custom#command#option('reflog',
      \ '--group', 'reflog-viewer'
      \)
call gina#custom#command#option('commit',
      \ '--verbose',
      \)
call gina#custom#command#option('/\v%(status|commit)',
      \ '--untracked-files'
      \)
call gina#custom#command#option('/\v%(status|changes)',
      \ '--ignore-submodules'
      \)

" Mappings {{{1
call gina#custom#mapping#nmap(
      \ 'branch', 'g<CR>',
      \ '<Plug>(gina-commit-checkout-track)'
      \)
call gina#custom#mapping#nmap(
      \ 'status', '<C-^>',
      \ ':<C-u>Gina commit<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)
call gina#custom#mapping#nmap(
      \ 'commit', '<C-^>',
      \ ':<C-u>Gina status<CR>',
      \ {'noremap': 1, 'silent': 1}
      \)

call gina#custom#execute(
      \ '/\%(status\|branch\|ls\|grep\|changes\|tag\)',
      \ 'setlocal winfixheight',
      \)
"}}}
