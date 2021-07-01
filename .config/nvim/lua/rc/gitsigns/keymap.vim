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

function! s:reset_hunks_in_range(...) abort
  silent! '[,'] Gitsigns reset_hunk
endfunction
nnoremap <SID>(reset-hunks-in-range)
      \ <Cmd>set operatorfunc=<SID>reset_hunks_in_range<CR>g@
nmap \U <SID>(reset-hunks-in-range)


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
      \ :<C-u>silent! call repeat#set('<SID>(stage-hank-in-range)')
      \ <bar>set operatorfunc=<SID>stage_in_range<CR>g@
xnoremap <silent> <SID>(stage-hank-in-range)
      \ :<C-u>silent! call repeat#set('<SID>(stage-hank-in-range)')
      \ <bar> *call <SID>stage_in_range()<CR>

nmap <space>gp <SID>(stage-hank-in-range)
xmap <space>gp <SID>(stage-hank-in-range)


" Motions
noremap <SID>[c [c
noremap <SID>]c ]c
map <expr> <Plug>(gitsigns-hunk-raw-next) &diff ? '<SID>]c' : '<Cmd>lua require"gitsigns".next_hunk()<CR>'
map <expr> <Plug>(gitsigns-hunk-raw-prev) &diff ? '<SID>[c' : '<Cmd>lua require"gitsigns".prev_hunk()<CR>'
  map <expr> <Plug>(gitsigns-hunk-next)
        \ dein#tap('repmo-vim')
        \ ? repmo#Key('<Plug>(gitsigns-hunk-raw-next)zv', '<Plug>(gitsigns-hunk-raw-prev)zv')
        \ : '<Plug>(gitsigns-hunk-raw-next)zv'
  map <expr> <Plug>(gitsigns-hunk-prev)
        \ dein#tap('repmo-vim')
        \ ? repmo#Key('<Plug>(gitsigns-hunk-raw-prev)zv', '<Plug>(gitsigns-hunk-raw-next)zv')
        \ : '<Plug>(gitsigns-hunk-raw-prev)zv'
map ]c <Plug>(gitsigns-hunk-next)
map [c <Plug>(gitsigns-hunk-prev)
sunmap [c
sunmap ]c


" Textobj
function! s:is_conflicted() abort
  const conflict_marker = '^[=><]\{7} '
  const is_conflicted = search(conflict_marker, 'cnw')
  return is_conflicted
endfunction

omap <expr> ic
      \ dein#tap('vim-textobj-conflict') && <SID>is_conflicted()
      \ ? '<Cmd>Gitsigns select_hunk<CR>'
      \ : '<SID>(textobj-hunk-i)'
omap <expr> ac
      \ dein#tap('vim-textobj-conflict') && <SID>is_conflicted()
      \ ? '<Cmd>Gitsigns select_hunk<CR>'
      \ : '<SID>(textobj-hunk-a)'
xmap <expr> ic
      \ dein#tap('vim-textobj-conflict') && <SID>is_conflicted()
      \ ? '<Cmd>Gitsigns select_hunk<CR>'
      \ : '<SID>(textobj-hunk-i)'
xmap <expr> ac
      \ dein#tap('vim-textobj-conflict') && <SID>is_conflicted()
      \ ? '<Cmd>Gitsigns select_hunk<CR>'
      \ : '<SID>(textobj-hunk-a)'
