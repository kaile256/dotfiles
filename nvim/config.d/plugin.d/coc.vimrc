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

"""" COC-GREP
""" NOTICE: Coc-Grep is run on Ripgrep by default.
""" Definition
"" Cg: Hotkey of CocList grep
command! -nargs=+ -complete=custom,s:GrepArgs Cg exe 'CocList grep '.<q-args>

"" s:GrepArgs: list of -complete=custom,{args}
function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

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

nnoremap <a-r> :Cg<cr>
nnoremap <a-g> :Cg<cr>
""" Grep Word Under Cursor
"" By Motion
vnoremap <space># :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <space>* :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@
"" In Current Buffer
nnoremap <silent> <space>#  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

"""" COC-LIST
""" CAUTION: careful not to conflict :checkhealth
"" show yank list
" --no-sort: Disable sort by mru.
nnoremap <silent> <a-c> :<c-u>CocList --normal --no-sort<cr>
nnoremap <silent> <a-p> :<c-u>CocList --auto-preview --normal yank<cr>
"" Show Buffer List
nnoremap <silent> <a-c><a-b> :<c-u>CocList --ignore-case --auto-preview buffer<cr>
nnoremap <silent> <a-c>b     :<c-u>CocList --ignore-case --auto-preview buffer<cr>

"""" COC-SNIPPETS
let g:coc_cnippet_next = '\<c-n>'
let g:coc_cnippet_prev = '\<c-p>'

""" Keymap
"" Unmap
nnoremap <buffer> <c-j>
"" Newmap
nnoremap <buffer> <c-n> <c-j>
nnoremap <buffer> <c-p> <c-k>

"""" COMPLETION
""" General
"" Coc-Done
" closes preview vindow when completion is done.
au! CompleteDone * if pumvisible() == 0 | pclose | endif

""" Definition
"" use <tab> for trigger completion and navigate to the next complete item
function! s:make_sure_no_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

""" Keymap
"" Confirm with <CR>; only <C-y> is by default.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
"" Trigger Completion by <c-n>/<c-p>.
inoremap <silent><expr> <c-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>make_sure_no_space() ? "\<c-n>" :
      \ coc#refresh()
inoremap <silent><expr> <c-p>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>make_sure_no_space() ? "\<c-p>" :
      \ coc#refresh()
