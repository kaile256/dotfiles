" From: tool.toml
" Repo: kana/vim-submode
" Fork: kaile256/vim-submode
" Another: post/submode.vim

let g:submode_keep_leaving_key = 1

function! s:undojoiner(char, ...) abort
  let rhs = a:0 > 0 ? a:1 : a:char
  "call submode#enter_with('undojoiner_'. a:char, 'n', 's', a:char, rhs)
  "call submode#map('undojoiner_'. a:char, 'n', 's', a:char, ':undojoin <bar> norm! '. rhs .'<cr>')

  call submode#wrapper('undojoiner_'. a:char, 'n', 's', a:char,
        \ rhs, {
        \ a:char : ':undojoin <bar> norm! '. rhs .'<cr>',
        \ '.'    : ':undojoin <bar> norm! '. rhs .'<cr>',
        \ })
endfunction

nnoremap <silent> <c-x>
      \ :call <SID>undojoiner('<c-x>')
      \ <bar> call feedkeys("\<c-x>")<cr>
nnoremap <silent> <c-a>
      \ :call <SID>undojoiner('<c-a>')
      \ <bar> call feedkeys("\<c-a>")<cr>
nnoremap <silent> x
      \ :call <SID>undojoiner('x')
      \ <bar> call feedkeys('x')<cr>
nnoremap <silent> X
     \ :call <SID>undojoiner('X')
      \ <bar> call feedkeys('X')<cr>

nnoremap <silent> <space>x
      \ :call <SID>undojoiner('x', '"_x')
      \ <bar> call feedkeys('x')<cr>

nnoremap <silent> <space>X
      \ :call <SID>undojoiner('X', '"_X')
      \ <bar> call feedkeys('X')<cr>
