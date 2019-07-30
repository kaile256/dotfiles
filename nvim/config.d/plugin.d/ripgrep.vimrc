"""" From: leap.toml
"""" Help: https://github.com/jremmen/vim-ripgrep
""""  Ref: fzf.vimrc

"let g:rg_window_location = topleft  " topleft is unsupported.
" true: highlight matched-word.
"let g:rg_highlight = true
" true: fitde project root from cwd.
"let g:rg_derive_root = true

"""" KEYMAP
nmap <a-r> :Rg 

""" Quick Change
nnoremap <a-o> :<c-u>cclose<bar>lclose<cr> :FZF<cr>
cnoremap <a-o> <c-u>cclose<bar>lclose<cr> :FZF<cr>
