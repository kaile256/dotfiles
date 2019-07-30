"""" From: 'tool.toml'
"""" Help: 'coc#'
"""" Source: 'neoclide/coc.nvim'

"""" CONFIG
set updatetime=300 " shorter for CursorHold & CursorHoldI
" shorter message
" c-option: not give ins-c><a-ompletion-menu message.
"set shortmess+=c
" signcolumn is the line beside numbers.
set signcolumn=yes

augroup CocConfig
  au!
  au User CocNvimInit        call s:coc_general()
  au User CocNvimInit        call s:coc_keymap()
  au User CocJumpPlaceholder call s:coc_buffer()
augroup END

function! s:coc_general()
  "" Coc-Done
  " closes preview vindow when completion is done.
  au! CompleteDone * if pumvisible() == 0 | pclose | endif
endfunction

"""" KEYMAP
function! s:coc_keymap()
  """ CAUTION: careful not to conflict :checkhealth
  "" show yank list
  nnoremap <silent> <a-c> :<c-u>CocList<cr>
  nnoremap <silent> <a-p> :<c-u>CocList -A --normal yank<cr>
endfunction

function! s:coc_buffer()
  "" Unmap
  "" Newmap
  nnoremap <buffer> <c-n> <c-j>
  nnoremap <buffer> <c-p> <c-k>
endfunction

""" USE <TAB>
" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1] =~ '\s'
"endfunction
