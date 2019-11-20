" From: tool.toml
" Repo: kana/vim-submode
" Another: post/submode.vim

let g:submode_keep_leaving_key = 1

function! s:seq_blackhole(key) abort
  if !get(s:, 'loaded_blackhole', 1) | return | endif
  let s:loaded_blackhole = 1
  call submode#enter_with('seq_blackhole_'. a:key , 'n', '', '<space>'. a:key , '"_'. a:key )
  " Note: :undojoin seems faster than <c-g>U
  call submode#map('seq_blackhole_'. a:key , 'n', 's', a:key , ':undojoin <bar> norm! "_'. a:key .'<cr>')
  " Note: necessary to :undojoin by '.'
  call submode#map('seq_blackhole_'. a:key , 'n', 's', ".", ':undojoin <bar> norm! "_'. a:key .'<cr>')
  exe 'norm! "_'. a:key
endfunction

nnoremap <silent> <space>x :<c-u>call <SID>seq_blackhole('x')<cr>
nnoremap <silent> <space>X :<c-u>call <SID>seq_blackhole('X')<cr>

function! s:undojoiner(key) abort
  if !get(s:, 'loaded_undojoiner', 1) | return | endif
  let char = a:key
  let s:loaded_undojoiner = 1
  call submode#enter_with('undojoiner_'. char , 'n', '', char , char)
  call submode#map('undojoiner_'. char , 'n', 's', char , ':undojoin <bar> norm! '. char .'<cr>')
  call submode#map('undojoiner_'. char , 'n', 's', "." , ':undojoin <bar> norm! '. char .'<cr>')
  exe 'norm!' char
endfunction

nnoremap <silent> <c-x> :<c-u>call <SID>undojoiner("<lt>c-x>")<cr>
nnoremap <silent> <c-a> :<c-u>call <SID>undojoiner("<lt>c-a>")<cr>
