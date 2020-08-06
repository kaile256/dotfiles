" TOML: ftplugin.toml
" Repo: yardnsm/vim-import-cost

augroup myImportCostSo
  au BufWrite *.{js,jsx,ts,tsx} ImportCost
  au BufWinLeave *.{js,jsx,ts,tsx} silent! ImportCostClear
augroup END

let g:import_cost_virtualtext_prefix = ''
