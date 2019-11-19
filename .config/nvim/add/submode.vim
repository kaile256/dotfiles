" From: tool.toml
" Repo: kana/vim-submode

let g:submode_keep_leaving_key = 1

function! s:sequential_blackhole(key) abort
  exe "call submode#enter_with('sequential_blackhole', 'n', '', '<s-space>x', '\"_'". a:key "')"
  " Note: :undojoin seems faster than <c-g>U
  exe "call submode#map('sequential_blackhole', 'n', 's', '". a:key ."', ':undojoin<cr>\"_'". a:key "')"
  exe "call submode#map('sequential_blackhole', 'n', 's', '.', ':undojoin<cr>\"_'". a:key "')"
  exe 'norm! "_'. a:key
endfunction

nnoremap <silent> <s-space>x :call <SID>sequential_blackhole('x')<cr>
nnoremap <silent> <s-space>X :call <SID>sequential_blackhole('X')<cr>
nnoremap <silent> <s-space>d :call <SID>sequential_blackhole('d')<cr>
nnoremap <silent> <s-space>D :call <SID>sequential_blackhole('D')<cr>
