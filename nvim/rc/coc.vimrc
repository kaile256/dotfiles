" From: tool.toml
" Help: coc-
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release

augroup CocAutoToggle
  au!
  au BufWinEnter coc-settings.json setl keywordprg=:help
  au BufWinEnter coc-settings.json setl keywordprg=:SensibleK\ vim
  au BufLeave * if &ft ==# 'coc' || 'list' | hide | endif
  au FileType coc,list setl laststatus=0 noshowmode noruler
        \ | au BufWinLeave,BufLeave * ++once set laststatus=2 showmode ruler
augroup END

" CAUTION: careful not to conflict :checkhealth
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" List; Coc-Extentions "{{{1
" Note: Have to install LSPs independently.
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-emoji',
      \ 'coc-git',
      \ 'coc-gocode',
      \ 'coc-tabnine',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
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
"}}}

" Command! p:if has('coc_providers') {{{
command! CocIfHasProvider :call <SID>coc_if_has_provider()<cr>
function! s:coc_if_has_provider()
  let s:coc_provider_list = [
        \ 'rename',
        \ 'onTypeEdit',
        \ 'documentLink',
        \ 'documentColor',
        \ 'foldingRange',
        \ 'format',
        \ 'codeAction',
        \ 'workspaceSymbols',
        \ 'formatRange',
        \ 'hover',
        \ 'signature',
        \ 'documentSymbol',
        \ 'documentHighlight',
        \ 'definition',
        \ 'declaration',
        \ 'typeDefinition',
        \ 'reference',
        \ 'implementation',
        \ 'codeLens',
        \ 'selectionRange'
        \ ]
  for provider in s:coc_provider_list
    if CocHasProvider(provider) == v:true
      let l:judge = 'true'
    else
      let l:judge = 'X'
    endif
    echo '  +' . provider . '		=>' l:judge
  endfor
endfunction
"}}}
" CmdAbbr; Clear All coc-extentions to reset extentions.
cnoreabbr <expr> cun  (getcmdtype() == ':' && getcmdline() =~ '^cun$')?  'CocUninstall g:coc_global_extensions' : 'cun'
cnoreabbr <expr> cclr (getcmdtype() == ':' && getcmdline() =~ '^cclr$')? 'CocUninstall g:coc_global_extensions' : 'cclr'

" Keymap; Navigate Chunks
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)

" Keymap; CocList
" show commit contains current position
noremap <silent> qp :CocList yank<cr>
noremap <silent> <a-c><a-c> :CocList<cr>
noremap <silent> <a-c><a-f> :CocList files<cr>
noremap <silent> <a-c><a-b> :CocList buffers<cr><M-k>

"nnoremap <silent> <a-i> :<c-u>botleft vert sp \| CocList outline<cr>

"map gC <Plug>(coc-diagnostic-info)
"<Plug>(coc-diagnostic-next) 
"<Plug>(coc-diagnostic-prev) 
"<Plug>(coc-diagnostic-next-error) 
"<Plug>(coc-diagnostic-prev-error) 

"" Jump; {{{1
nmap <silent> gd <Plug>(coc-definition)
xmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration) 
xmap <silent> gD <Plug>(coc-declaration) 
nmap <silent> gG <Plug>(coc-implementation) 
xmap <silent> gG <Plug>(coc-implementation) 
nmap <silent> gy <Plug>(coc-type-definition) 
xmap <silent> gy <Plug>(coc-type-definition) 
nmap <silent> gR <Plug>(coc-references) 
xmap <silent> gR <Plug>(coc-references) 
"" Jump; vertical {{{1
nmap <silent> <c-w>d <c-w>v<Plug>(coc-definition)
xmap <silent> <c-w>d <c-w>v<Plug>(coc-definition)
nmap <silent> <c-w>D <c-w>v<Plug>(coc-declaration) 
xmap <silent> <c-w>D <c-w>v<Plug>(coc-declaration) 
nmap <silent> <c-w>G <c-w>v<Plug>(coc-implementation) 
xmap <silent> <c-w>G <c-w>v<Plug>(coc-implementation) 
nmap <silent> <c-w>y <c-w>v<Plug>(coc-type-definition) 
xmap <silent> <c-w>y <c-w>v<Plug>(coc-type-definition) 
nmap <silent> <c-w>R <c-w>v<Plug>(coc-references) 
xmap <silent> <c-w>R <c-w>v<Plug>(coc-references) 
"" Jump; on horizontal {{{1
nmap <silent> <c-w>gd <c-w>s<Plug>(coc-definition)
xmap <silent> <c-w>gd <c-w>s<Plug>(coc-definition)
nmap <silent> <c-w>gD <c-w>s<Plug>(coc-declaration) 
xmap <silent> <c-w>gD <c-w>s<Plug>(coc-declaration) 
nmap <silent> <c-w>gG <c-w>s<Plug>(coc-implementation) 
xmap <silent> <c-w>gG <c-w>s<Plug>(coc-implementation) 
nmap <silent> <c-w>gy <c-w>s<Plug>(coc-type-definition) 
xmap <silent> <c-w>gy <c-w>s<Plug>(coc-type-definition) 
nmap <silent> <c-w>gR <c-w>s<Plug>(coc-references) 
xmap <silent> <c-w>gR <c-w>s<Plug>(coc-references) 
"" Jump; on new tab {{{1
nmap <silent> <c-w><space>d <c-w>v<c-w>T<Plug>(coc-definition)
xmap <silent> <c-w><space>d <c-w>v<c-w>T<Plug>(coc-definition)
nmap <silent> <c-w><space>D <c-w>v<c-w>T<Plug>(coc-declaration) 
xmap <silent> <c-w><space>D <c-w>v<c-w>T<Plug>(coc-declaration) 
nmap <silent> <c-w><space>G <c-w>v<c-w>T<Plug>(coc-implementation) 
xmap <silent> <c-w><space>G <c-w>v<c-w>T<Plug>(coc-implementation) 
nmap <silent> <c-w><space>y <c-w>v<c-w>T<Plug>(coc-type-definition) 
xmap <silent> <c-w><space>y <c-w>v<c-w>T<Plug>(coc-type-definition) 
nmap <silent> <c-w><space>R <c-w>v<c-w>T<Plug>(coc-references) 
xmap <silent> <c-w><space>R <c-w>v<c-w>T<Plug>(coc-references) 
"}}}

"<Plug>(coc-format-selected) 
"<Plug>(coc-format) 
"
" Change Name
nmap cn <Plug>(coc-rename)
xmap cn <Plug>(coc-rename)
"<Plug>(coc-codeaction) 
"<Plug>(coc-codeaction-selected) 
"
"<Plug>(coc-openlink) 
"<Plug>(coc-codelens-action) 
"
"<Plug>(coc-fix-current) 
"<Plug>(coc-float-hide) 
"<Plug>(coc-float-jump) 
"
"<Plug>(coc-refactor) 
"<Plug>(coc-range-select) 
"<Plug>(coc-range-select) 
"<Plug>(coc-range-select-backward) 

" Keymap; Text-Object
vmap if <Plug>(coc-funcobj-i)
vmap if <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-a)

"nmap <a-c><a-n> <Plug>(coc-rename)
"nmap <a-c><a-f> <Plug>(coc-float-jump)

" COC-COMPLETION
" General
" Necessary?: closes mpreview vindow when completion is done.
"au! CompleteDone * if pumvisible() == 0 | pclose | endif

""" Keymap
"" Definition
function! s:make_sure_no_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

""" Snippet :echo exists('##CompleteChanged') && exists('*nvim_open_win')s
"nmap <a-s><a-p> :CocCommand snippets.editSnippets<cr>
"" Trigger Just Snippets; <tab> to General Completion
"imap <C-s> <Plug>(coc-snippets-expand)
"vmap <C-s> <Plug>(coc-snippets-select)
"imap <C-s> <Plug>(coc-snippets-expand-jump)
"" Confirm with <CR>; only <C-y> is by default.

" Keymap; Completion {{{
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
"}}}
