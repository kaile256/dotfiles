" TOML: git.toml
" Repo: lewis6991/gitsigns.nvim

function! s:preview_hunk_or_blame() abort
  const winnrs = tabpagebuflist()
  Gitsigns preview_hunk
  call timer_start(50, {-> tabpagebuflist() == winnrs
        \ ? luaeval('require"gitsigns".blame_line(true)') : '' })
endfunction
nnoremap <space>gm <Cmd>call <SID>preview_hunk_or_blame()<CR>

nnoremap U <Cmd>Gitsigns reset_hunk<CR>
xnoremap U <Cmd>*Gitsigns reset_hunk<CR><Esc>

function! s:stage_in_range(...)
  if a:0
    const above = line("'[")
    const below = line("']")
  else
    const above = line("'<")
    const below = line("'>")
  endif
  " lua require"gitsigns".stage_hunk({above, below})
  silent! execute above ',' below 'Gitsigns stage_hunk'
endfunction

nnoremap <silent> <SID>(stage-hank-in-range)
      \ :<C-u>set operatorfunc=<SID>stage_in_range<CR>g@
xnoremap <silent> <SID>(stage-hank-in-range) :call stage_in_range()<CR>

nmap <space>gp <SID>(stage-hank-in-range)
xmap <space>gp <SID>(stage-hank-in-range)


" Motions
noremap <SID>[c [c
noremap <SID>]c ]c
map <expr> <Plug>(gitsigns-hunk-raw-next) &diff ? '<SID>]c' : '<Cmd>lua require"gitsigns".next_hunk()<CR>'
map <expr> <Plug>(gitsigns-hunk-raw-prev) &diff ? '<SID>[c' : '<Cmd>lua require"gitsigns".prev_hunk()<CR>'
if dein#tap('repmo-vim')
  map <expr> <Plug>(gitsigns-hunk-next) repmo#Key('<Plug>(gitsigns-hunk-raw-prev)', '<Plug>(gitsigns-hunk-raw-next)')
  map <expr> <Plug>(gitsigns-hunk-prev) repmo#Key('<Plug>(gitsigns-hunk-raw-next)', '<Plug>(gitsigns-hunk-raw-prev)')
else
  map <expr> <Plug>(gitsigns-hunk-next) <Plug>(gitsigns-hunk-raw-next)
  map <expr> <Plug>(gitsigns-hunk-prev) <Plug>(gitsigns-hunk-raw-prev)
endif
map [c <Plug>(gitsigns-hunk-next)
map ]c <Plug>(gitsigns-hunk-prev)


" Textobj
if dein#tap('vim-textobj-conflict')
  function! s:is_conflicted() abort
    const conflict_marker = '^[=><]\{7} '
    const is_conflicted = search(conflict_marker, 'cnw')
    return is_conflicted
  endfunction

  omap <expr> ic <SID>is_conflicted() ? '<Cmd>Gitsigns select_hunk<CR>' : '<SID>(textobj-hunk-i)'
  xmap <expr> ic <SID>is_conflicted() ? '<Cmd>Gitsigns select_hunk<CR>' : '<SID>(textobj-hunk-i)'
  omap <expr> ac <SID>is_conflicted() ? '<Cmd>Gitsigns select_hunk<CR>' : '<SID>(textobj-hunk-a)'
  xmap <expr> ac <SID>is_conflicted() ? '<Cmd>Gitsigns select_hunk<CR>' : '<SID>(textobj-hunk-a)'
else
  omap ic <SID>(textobj-hunk-i)
  xmap ic <SID>(textobj-hunk-i)
  omap ac <SID>(textobj-hunk-a)
  xmap ac <SID>(textobj-hunk-a)
endif
