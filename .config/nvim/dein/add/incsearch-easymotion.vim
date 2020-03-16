" From: tool.toml
"  Ref: easymotion.vimrc
" Help: https://github.com/haya14busa/incsearch-easymotion.vim

"map / <Plug>(incsearch-easymotion-/)
"map ? <Plug>(incsearch-easymotion-?)

" Incsearch-EasyMotion; Function {{{
" Note: too much candidates to select!
"function! s:config_easyfuzzymotion(...) abort
"  return extend(copy({
"        \   'converters': [incsearch#config#fuzzy#converter()],
"        \   'modules': [incsearch#config#easymotion#module()],
"        \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"        \   'is_expr': 0,
"        \   'is_stay': 1
"        \ }), get(a:, 1, {}))
"endfunction
"
"noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
