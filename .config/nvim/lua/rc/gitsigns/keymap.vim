" TOML: git.toml
" Repo: lewis6991/gitsigns.nvim

" Note: Sometimes misses the last commit and do nothing.
nnoremap <silent> U <Cmd>lua require'gitsigns'.reset_hunk()<CR>

function! s:stage_in_range(...)
  if a:0
    const above = line("'[")
    const below = line("']")
  else
    const above = line("'<")
    const below = line("'>")
  endif
  lua require"gitsigns".stage_hunk({above, below})
endfunction

nnoremap <silent> <SID>(stage-hank-in-range)
      \ :<C-u>set operatorfunc=<SID>stage_in_range<CR>g@
xnoremap <silent> <SID>(stage-hank-in-range) :call stage_in_range()<CR>

nmap <space>gp <SID>(stage-hank-in-range)
xmap <space>gp <SID>(stage-hank-in-range)
