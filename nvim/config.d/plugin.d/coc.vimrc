"""" From: Init.toml
"""" Help: coc#
"""" Source: neoclide/coc.nvim

"""" GENERAL
" shorter for CursorHold & CursorHoldI
set updatetime=300
" shorter message
" c-option: not give ins-c><a-ompletion-menu message.
"set shortmess+=c

" signcolumn is the line beside numbers.
set signcolumn=yes

"" Coc-Done
" closes preview vindow when completion is done.
au! CompleteDone * if pumvisible() == 0 | pclose | endif
"""" DEFINITION
""" NOTICE: Coc-Grep is run on Ripgrep by default.

"" Global
command! -nargs=+ -complete=custom,s:GrepArgs Cg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

"" By Motion
vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

"""" KEYMAP
""" Coc-Ripgrep
nnoremap <a-r> :Cg<cr>
nnoremap <a-g> :Cg<cr>
""" Grep Word Under Cursor
"" In Current Buffer
nnoremap <silent> <space>#  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>


""" CAUTION: careful not to conflict :checkhealth
"" show yank list
" --no-sort: Disable sort by mru.
nnoremap <silent> <a-c> :<c-u>CocList --normal --no-sort<cr>
nnoremap <silent> <a-p> :<c-u>CocList --auto-preview --normal yank<cr>
"" Show Buffer List
nnoremap <silent> <a-c><a-b> :<c-u>CocList --ignore-case --auto-preview buffer<cr>
nnoremap <silent> <a-c>b     :<c-u>CocList --ignore-case --auto-preview buffer<cr>

""" Snippets
let g:coc_cnippet_next = '\<c-n>'
let g:coc_cnippet_prev = '\<c-p>'

"" Unmap
"" Newmap
nnoremap <buffer> <c-n> <c-j>
nnoremap <buffer> <c-p> <c-k>

""" USE <TAB>
" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1] =~ '\s'
"endfunction


