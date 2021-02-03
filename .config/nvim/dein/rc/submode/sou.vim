" From: default.toml
" Repo: kana/vim-submode
" Fork: kaile256/vim-submode
" Another: post/submode.vim

let g:submode_keep_leaving_key = 1

"function! s:undojoiner(char, ...) abort "{{{1
"  let rhs = a:0 > 0 ? a:1 : a:char
"  call submode#enter_with('undojoiner_'. a:char, 'n', 's', a:char, rhs)
"  call submode#map('undojoiner_'. a:char, 'n', 's', a:char, ':undojoin <bar> norm! '. rhs .'<cr>')
"
"  "call submode#wrapper('undojoiner_'. a:char, 'n', 's', a:char,
"  "      \ rhs, {
"  "      \ a:char : ':undojoin <bar> norm! '. rhs .'<cr>',
"  "      \ '.'    : ':undojoin <bar> norm! '. rhs .'<cr>',
"  "      \ })
"endfunction
"
"nnoremap <silent> <c-x>
"      \ :call <SID>undojoiner('<c-x>')
"      \ <bar> call feedkeys("\<c-x>")<cr>
"nnoremap <silent> <c-a>
"      \ :call <SID>undojoiner('<c-a>')
"      \ <bar> call feedkeys("\<c-a>")<cr>
"
"" Note: x/X only mess up two registers, unnamed and small-delete: ["", "-]
"nnoremap <silent> x
"      \ :call <SID>undojoiner('x')
"      \ <bar> call feedkeys('x')<cr>
"nnoremap <silent> X
"      \ :call <SID>undojoiner('X')
"      \ <bar> call feedkeys('X')<cr>

"function! s:percentage_in_line(start_key, combinations) abort "{{{1
"  call submode#enter_with('linePerc', 'nxo', 's', a:start_key, 'gM')
"  for lhs in keys(a:combinations)
"    call submode#map('linePerc', 'nxo', 'sx', lhs, a:combinations[lhs] . 'gM')
"  endfor
"endfunction
"
""nnoremap <silent> gm gM
"nnoremap <silent> gm :call <SID>percentage_in_line('gm', {
"      \ 'H': 15,
"      \ 'J': 35,
"      \ 'K': 65,
"      \ 'L': 85,
"      \ })
"      \ <bar> call feedkeys('gm')<cr>
