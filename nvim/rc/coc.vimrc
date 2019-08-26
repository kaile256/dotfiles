" From: tool.toml
" Help: coc-
" Source: neoclide/coc.nvim

" In case of faileure to install json for coc.
cnoreabbrev <expr> ci (getcmdtype() == ':' && getcmdline() =~ '^ci$')? 'call coc#util#install()' : 'ci'

" CAUTION: careful not to conflict :checkhealth
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

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

"""" COC-RENAME
noremap <silent> <a-c><a-c> :CocList<cr>
noremap <silent> <a-c><a-f> :CocList files<cr>
noremap <silent> <a-c><a-b> :CocList buffers<cr>
"nmap <a-c><a-n> <Plug>(coc-rename)
"nmap <a-c><a-f> <Plug>(coc-float-jump)

" COC-COMPLETION
" General
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

augroup MyCocAugroup "{{{
  au!
  "au CursorMoved * ++once silent call coc#util#install()
  "AutoCloseOnWinLeave
  au WinLeave * if &filetype ==# 'coc' || 'list' | hide | endif
augroup END "}}}
