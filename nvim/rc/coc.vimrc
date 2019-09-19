" From: external.toml
" Branch: neoclide/coc.nvim_release
" Func: neoclide/coc.nvim_release/plugin/coc.vim
" Repo: neoclide/coc.nvim

augroup CocMyAutoConf
  au!
  au BufWinEnter coc-settings.json setl keywordprg=:help
  "au BufWinEnter coc-settings.json setl keywordprg=:SensibleSplit\ vim
  "au BufLeave * if &ft ==# 'coc' || 'list' | hide | endif
  au FileType coc,list setl laststatus=0 noshowmode noruler
        \ | au BufWinLeave,BufLeave * ++once set laststatus=2 showmode ruler
  au FileType typescript,json    setl formatexpr=CocAction('formatSelected')
  "" Only for snippet's feature?
  "au User     CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" Highlight on yanked
"hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A
hi  HighlightedyankRegion ctermfg=232 ctermbg=166 guifg=#000000 guibg=#df5f00

" the List of CocExtentions; "{{{1
" Note: Have to install LSPs independently.
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-flow',
      \ 'coc-conjure',
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-elixir',
      \ 'coc-emoji',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-gocode',
      \ 'coc-highlight',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-project',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tag',
      \ 'coc-template',
      \ 'coc-texlab',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]
"}}}
" CmdAbbr; Clear All coc-extentions to reset extentions.
cnoreabbr <expr> cun  (getcmdtype() == ':' && getcmdline() =~ '^cun$')?  'CocUninstall g:coc_global_extensions' : 'cun'
cnoreabbr <expr> cclr (getcmdtype() == ':' && getcmdline() =~ '^cclr$')? 'CocUninstall g:coc_global_extensions' : 'cclr'
cnoreabbr <expr> coc (getcmdtype() == ':' && getcmdline() =~ '^coc$')? 'CocList' : 'coc'
" Command!; C-series {{{1
command! Ccmd :CocCommand
command! Coc :CocList
command! Clist :CocList
command! CList :CocList
command! Cmru :CocList mru
command! CMru :CocList mru
command! Cextensions :CocList extensions
command! ClocalLog :CocList bcommits
command! CLocalLog :CocList bcommits
command! Cbuffers :CocList buffers
command! CBuffers :CocList buffers
" Command; Original
command! CocIfHasProvider :call <SID>coc_if_has_provider()
command! CIfHasProvider :CocIfHasProvider
command! CifHasProvider :CocIfHasProvider
function! s:coc_if_has_provider() "{{{2
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
      let l:judge = 'x'
    endif
    echo '  +' . provider . '		== ' l:judge
  endfor
endfunction
"}}}
"}}}
" Keymaps;
"nnoremap q: :CocList cmdhistory<cr>
"nnoremap q/ :CocList searchhistory<cr>
" CocCommand; Git {{{1
" Similar to the navigation on &diff
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gC <Plug>(coc-git-chunkinfo)
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ac <Plug>(coc-text-object-outer)
xmap ac <Plug>(coc-text-object-outer)
"" CocCommand; Explorer {{{1
"command! Cexplorer :CocCommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size
""}}}
" CocList; {{{1
" show commit contains current position
noremap <silent> qp         :CocList yank<cr>
noremap <silent> <a-c><a-c> :CocList<cr>
noremap <silent> <a-c><a-f> :CocList files<cr>
noremap <silent> <a-c><a-b> :CocList buffers<cr><M-k>
" CocList; Session {{{1
command! MksessionCoc   :CocCommand session.save
command! SaveSessionCoc :CocCommand session.save
command! LoadSessionCoc :CocCommand session.load
cnoreabbr <expr> mks (getcmdtype() == ':' && getcmdline() =~ '^mks$')? 'MksessionCoc' : 'mks'
cnoreabbr <expr> lds (getcmdtype() == ':' && getcmdline() =~ '^lds$')? 'LoadSessionCoc' : 'lds'
" CocList; Fuzzy-Buffers {{{1
noremap <silent> <a-q><a-b> :<c-u>CocList buffers<cr>
noremap <silent> <a-q>b     :<c-u>CocList buffers<cr>
" CocList; Diagnostic {{{1
" Note: Unnecessary? pop up auto.
"map gC <Plug>(coc-diagnostic-info)
nmap [q <Plug>(coc-diagnostic-prev)
nmap ]q <Plug>(coc-diagnostic-next)
nmap [e <Plug>(coc-diagnostic-prev-error)
nmap ]e <Plug>(coc-diagnostic-next-error)
" CocList; Jump {{{1
"" Jump; as :edit {{{2
nmap <silent> gd <Plug>(coc-definition)
xmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
xmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gI <Plug>(coc-implementation)
xmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
xmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
xmap <silent> gr <Plug>(coc-references)
"" Jump; as :vsplit {{{2
" TODO: Suppress new window if no definition is found and so on.
nmap <silent> <c-w>d <c-w>v<Plug>(coc-definition)
xmap <silent> <c-w>d <c-w>v<Plug>(coc-definition)
nmap <silent> <c-w>D <c-w>v<Plug>(coc-declaration)
xmap <silent> <c-w>D <c-w>v<Plug>(coc-declaration)
nmap <silent> <c-w>I <c-w>v<Plug>(coc-implementation)
xmap <silent> <c-w>I <c-w>v<Plug>(coc-implementation)
nmap <silent> <c-w>y <c-w>v<Plug>(coc-type-definition)
xmap <silent> <c-w>y <c-w>v<Plug>(coc-type-definition)
nmap <silent> <c-w>r <c-w>v<Plug>(coc-references)
xmap <silent> <c-w>r <c-w>v<Plug>(coc-references)
"" Jump; as :split {{{2
nmap <silent> <c-w>gd <c-w>s<Plug>(coc-definition)
xmap <silent> <c-w>gd <c-w>s<Plug>(coc-definition)
nmap <silent> <c-w>gD <c-w>s<Plug>(coc-declaration)
xmap <silent> <c-w>gD <c-w>s<Plug>(coc-declaration)
nmap <silent> <c-w>gI <c-w>s<Plug>(coc-implementation)
xmap <silent> <c-w>gI <c-w>s<Plug>(coc-implementation)
nmap <silent> <c-w>gy <c-w>s<Plug>(coc-type-definition)
xmap <silent> <c-w>gy <c-w>s<Plug>(coc-type-definition)
nmap <silent> <c-w>gr <c-w>s<Plug>(coc-references)
xmap <silent> <c-w>gr <c-w>s<Plug>(coc-references)
"" Jump; as :tabe {{{2
nmap <silent> <c-w><space>d <c-w>v<c-w>T<Plug>(coc-definition)
xmap <silent> <c-w><space>d <c-w>v<c-w>T<Plug>(coc-definition)
nmap <silent> <c-w><space>D <c-w>v<c-w>T<Plug>(coc-declaration)
xmap <silent> <c-w><space>D <c-w>v<c-w>T<Plug>(coc-declaration)
nmap <silent> <c-w><space>I <c-w>v<c-w>T<Plug>(coc-implementation)
xmap <silent> <c-w><space>I <c-w>v<c-w>T<Plug>(coc-implementation)
nmap <silent> <c-w><space>y <c-w>v<c-w>T<Plug>(coc-type-definition)
xmap <silent> <c-w><space>y <c-w>v<c-w>T<Plug>(coc-type-definition)
nmap <silent> <c-w><space>r <c-w>v<c-w>T<Plug>(coc-references)
xmap <silent> <c-w><space>r <c-w>v<c-w>T<Plug>(coc-references)
"}}}
" CocList; Format {{{1
xmap <expr> =  (CocHasProvider('format') == v:true)? '<Plug>(coc-format-selected)' : '='
nmap <expr> =  (CocHasProvider('format') == v:true)? '<Plug>(coc-format-selected)' : '='
nmap <expr> == (CocHasProvider('format') == v:true)? '<Plug>(coc-format)'          : '=='
" CocList; Text-Object {{{1
" Note: mapped already as default?
vmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
vmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" CocList; Rename {{{1
" Mnemonic: Change Name
nmap cn <Plug>(coc-rename)
xmap cn <Plug>(coc-rename)
" CocList; Quick Run {{{1
nmap qR   <Plug>(coc-codeaction)
nmap qrr  <Plug>(coc-codeaction)
nmap qrqr <Plug>(coc-codeaction)
nmap qr   <Plug>(coc-codeaction-selected)
xmap qr   <Plug>(coc-codeaction-selected)
" CocList; Not Yet Mapped {{{1
"<Plug>(coc-openlink)
"<Plug>(coc-codelens-action)
"
"<Plug>(coc-fix-current)
"<Plug>(coc-float-hide)
"<Plug>(coc-float-jump)
"
"<Plug>(coc-refactor)
"<Plug>(coc-range-select)
"<Plug>(coc-range-select-backward)
""}}}

" CocCompletion; {{{1
" Necessary?: closes mpreview vindow when completion is done.
"au! CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
"" Completion; Trigger {{{2
inoremap <silent><expr> <c-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>make_sure_no_space() ? "\<c-n>" :
      \ coc#refresh()
inoremap <silent><expr> <c-p>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>make_sure_no_space() ? "\<c-p>" :
      \ coc#refresh()
function! s:make_sure_no_space() abort "{{{3
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
" CocSnippet; Do NOT use it {{{1
" TODO: Assign the dir where snippets will be saved.
"nmap <a-s><a-p> :CocCommand snippets.editSnippets<cr>
"" Trigger Just Snippets; <tab> to General Completion
"imap <C-s> <Plug>(coc-snippets-expand)
"vmap <C-s> <Plug>(coc-snippets-select)
"imap <C-s> <Plug>(coc-snippets-expand-jump)
