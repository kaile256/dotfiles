" From: tool.toml
" Help: coc-
" Source: neoclide/coc.nvim


" TODO: Make it as Snippet
cnoreabbrev  <expr> ci (getcmdtype() == ':' && getcmdline() =~ '^ci$')? 'call coc#util#install()' : 'ci'

"""" COC-LIST
""" CAUTION: careful not to conflict :checkhealth
"" show yank list
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-emoji',
      \ 'coc-git',
      \ 'coc-gocode',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-neosnippet',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-solargraph',
      \ 'coc-syntax',
      \ 'coc-tag',
      \ 'coc-texlab',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank'
      \ ]

" Coc; Keymap "{{{
"" Keymap; for the message:
" "[coc.nvim] javascript file not found, please compile the code or use release branch."
cnoremap <silent> <a-c><a-i> <c-u>call coc#util#install()

"""" COC-RENAME
nnoremap <silent> <a-c><a-c> :CocList<cr>
nmap <a-c><a-n> <Plug>(coc-rename)
nmap <a-c><a-f> <Plug>(coc-float-jump)

"""" COC-COMPLETION
""" General
"" Coc-Done
" closes mpreview vindow when completion is done.
au! CompleteDone * if pumvisible() == 0 | pclose | endif

""" Keymap
"" Definition
function! s:make_sure_no_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

""" Snippet :echo exists('##CompleteChanged') && exists('*nvim_open_win')s
nmap <a-s><a-p> :CocCommand snippets.editSnippets<cr>

"" Trigger Just Snippets; <tab> to General Completion
"imap <C-s> <Plug>(coc-snippets-expand)
"vmap <C-s> <Plug>(coc-snippets-select)
imap <C-s> <Plug>(coc-snippets-expand-jump)

"" Confirm with <CR>; only <C-y> is by default.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

"" Reset Completion by <tab>
"inoremap <silent><expr> <tab>
"      \ pumvisible() ? "\<TAB>" :
"      \ <SID>make_sure_no_space() ? "\<tab>" :
"      \ "\<tab>"

"" Trigger Completion by <c-n>/<c-p>.
inoremap <silent><expr> <c-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>make_sure_no_space() ? "\<c-n>" :
      \ coc#refresh()
inoremap <silent><expr> <c-p>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>make_sure_no_space() ? "\<c-p>" :
      \ coc#refresh()

"""" COC-GREP
""" Use fzf.vimrc instead.
"""" NOTICE: Coc-Grep is run on Ripgrep by default.
"""" Definition
""" Cg: Hotkey of CocList grep
"command! -nargs=+ -complete=custom,s:GrepArgs Cg exe 'CocList grep '.<q-args>
"
""" s:GrepArgs: list of -complete=custom,{args}
"function! s:GrepArgs(...)
"  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
"        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
"  return join(list, "\n")
"endfunction
"
"function! s:GrepFromSelected(type)
"  let saved_unnamed_register = @@
"  if a:type ==# 'v'
"    normal! `<v`>y
"  elseif a:type ==# 'char'
"    normal! `[v`]y
"  else
"    return
"  endif
"  let word = substitute(@@, '\n$', '', 'g')
"  let word = escape(word, '| ')
"  let @@ = saved_unnamed_register
"  execute 'CocList grep '.word
"endfunction
"
""" Grep Word Under Cursor
"" Use fzf.vimrc
"" By Motion
"vnoremap <space># :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
"nnoremap <space>* :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@
"" In Current Buffer
"nnoremap <silent> <space>#  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" Keymapping for grep word under cursor with interactive mode
"nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>

" Coc; Augroup {{{
augroup MyCocAugroup "{{{0
  au!

  "In case of faileure to install json for coc.
  au VimEnter * call coc#util#install
  "AutoCloseOnWinLeave
  au WinLeave * if &filetype ==# 'coc' | close | endif
augroup END "}}}
