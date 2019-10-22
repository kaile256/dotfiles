" From: myplug.toml
" Repo: kaile256/vim-window-picker
" Another: post/winpick.vim

let g:winpick_weed_list = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
      \ 'COMMIT_EDITMSG',
      \ ]

"let g:winpick_path_dict =
"      \ extend(g:winpick_path_dict,
"      \        {'p': '<c-w>FindRoot'},
"      \        )

if !exists('g:winpick_cd_path_dict')
  let g:winpick_cd_path_dict = {}
endif

call extend(g:winpick_cd_path_dict, {
      \ 'h': '~',
      \ 'w': '%:p:h',
      \ }
      \ )

let g:winpick_split_dict = {
      \ '<a-v>': 'vsplit',
      \ '<a-s>': 'split',
      \ '<a-t>': 'tabe',
      \ '<a-e>': 'edit',
      \ }

let s:list = {
      \ 'fugitive': {},
      \ }

let s:list.git = {
      \ 'bt': ['nofile', 'nowrite', 'quickfix'],
      \ 'ft': [],
      \ 'filename': ['fugitive:\/\/', 'twiggy:\/\/'],
      \ }

nnoremap <silent> <a-space><space>   :<c-u>WinpickWeedout<cr>
nnoremap <silent> <a-space><a-space> :<c-u>WinpickWeedout<cr>

onoremap <expr> q (v:operator ==# 'd')? ':<c-u>WinpickWeedout<cr>': 'q'

nnoremap <expr> <c-w><c-o> (&diff)? ':<c-u>WinpickWeedout<cr><c-w>o': '<c-w>o'
nnoremap <expr> <c-w>o     (&diff)? ':<c-u>WinpickWeedout<cr><c-w>o': '<c-w>o'

