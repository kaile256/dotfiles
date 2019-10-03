" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" Func: neoclide/coc.nvim_release/plugin/coc.vim
" XDG: .config/coc/extensions

augroup CocMyAutoConf
  au!
  au BufWinEnter coc-settings.json setl keywordprg=:help
  "au BufLeave * if &ft ==# 'coc' || 'list' | hide | endif
  au FileType coc,list setl laststatus=0 noshowmode noruler
        \ | au BufWinEnter,WinLeave,BufLeave * ++once set laststatus=2 showmode ruler
  "" Only for snippet's feature?
  "au User     CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight symbol under cursor on CursorHold
  "au CursorHold * silent call CocActionAsync('highlight')
augroup END

" Highlight on yanked
hi HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29

" Note: <c-o> in coc's cmdline get to normal mode of coc.nvim
" Command!; C-series {{{1
command! CocIfHasProvider :call <SID>coc_if_has_provider()
command! CIfHasProvider   :call <SID>coc_if_has_provider()
command! CUninstall :CocUninstall g:coc_global_extensions
command! CConfig     :CocConfig
command! CCmd        :CocCommand
command! CList       :CocList
command! Coc         :CocList
command! CExtensions :CocList extensions
command! CTemplate :CocCommand template.templateTop
command! CInit     :CocCommand template.templateTop
command! Init      :CocCommand template.templateTop
" Note: fzf.vim is better,
"       which has regex-like specification method on fuzzy-matcher.
command! CFiles    :CocList files
command! CMru      :CocList mru
command! CBuffers  :CocList buffers
command! CLocalLog :CocList bcommits
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
      \ 'coc-highlight',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-todolist',
      \ 'coc-translator',
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
function! s:coc_if_has_provider() "{{{1
  let l:coc_provider_list = [
        \ 'hover',
        \ 'rename',
        \ 'format',
        \ 'codeAction',
        \ 'onTypeEdit',
        \ 'definition',
        \ 'declaration',
        \ 'typeDefinition',
        \ 'reference',
        \ 'implementation',
        \ 'codeLens',
        \ 'documentColor',
        \ 'documentHighlight',
        \ 'documentLink',
        \ 'documentSymbol',
        \ 'workspaceSymbols',
        \ 'formatRange',
        \ 'foldingRange',
        \ 'selectionRange',
        \ ]
  for provider in l:coc_provider_list
    if CocHasProvider(provider) == v:true
      let l:judge = 'true'
    elseif CocHasProvider(provider) == v:false
      let l:judge = 'χ'
    endif
    echo '  +' . provider . '		== ' l:judge
  endfor
endfunction
"}}}
" CocCommand; Git {{{1
nnoremap U  :CocCommand git.chunkUndo<cr>
" Similar to the navigation on &diff
nmap <expr> [c (&diff)? '[c': '<Plug>(coc-git-prevchunk)'
nmap <expr> ]c (&diff)? ']c': '<Plug>(coc-git-nextchunk)'
" show chunk diff at current position
nmap <a-y>c <Plug>(coc-git-chunkinfo)
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ac <Plug>(coc-text-object-outer)
xmap ac <Plug>(coc-text-object-outer)
"" CocCommand; Explorer {{{1
"command! CExplorer :CocCommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size
""}}}
" CocCommand; extensions {{{1
command! CocExtensions :CocList extensions
command! CExtensions   :CocList extensions
nnoremap <a-c>e        :CocExtensions<cr>
nnoremap <a-c><a-e>    :CocExtensions<cr>
" CocCommand; Todo, or Task {{{1
command! CocTask         :CocCommand todolist.create
command! CTask           :CocCommand todolist.create
command! CocShowTaskList :CocList    todolist
command! CShowTaskList   :CocList    todolist
nnoremap <silent> <a-c>t     :CocTask<cr>
nnoremap <silent> <a-c>s     :CocShowTaskList<cr>
nnoremap <silent> <a-c><a-t>     :CocTask<cr>
nnoremap <silent> <a-c><a-s>     :CocShowTaskList<cr>
" CocCommand; Translator {{{1
" Not work well yet on Japanese
"command! -nargs=+ CEchoOnJapanese :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand translator.echo <q-args>
"command! -nargs=+ CReplaceOnJapanese :call coc#config("translator", {"toLang": "ja"}) <bar> :CocCommand translator.echo <q-args>
"command! -nargs=+ CPumOnJapanese :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand translator.echo <q-args>
" CocCommand; Workspace {{{1
noremap! <c-x><c-;> <esc>q:
noremap! <c-x><c-/> <esc>q/
command! Rename :CocCommand workspace.renameCurrentFile
command! R      :CocCommand workspace.renameCurrentFile

" CocList; {{{1
" show commit contains current position
noremap <silent> <a-c><a-c> :CocList<cr>
noremap <silent> <a-c><a-f> :CocList files<cr>
noremap <silent> <a-c><a-b> :CocList buffers<cr><M-k>
noremap <silent> <a-c>c :CocList<cr>
noremap <silent> <a-c>f :CocList files<cr>
noremap <silent> <a-c>b :CocList buffers<cr><M-k>
" CocList; Session {{{1
command! MksessionCoc   :CocCommand session.save
command! SaveSessionCoc :CocCommand session.save
command! LoadSessionCoc :CocCommand session.load
cnoreabbr <expr> mks (getcmdtype() == ':' && getcmdline() =~ '^mks$')?
      \ 'MksessionCoc' : 'mks'
cnoreabbr <expr> lds (getcmdtype() == ':' && getcmdline() =~ '^lds$')?
      \ 'LoadSessionCoc' : 'lds'
" CocList; Fuzzy-Buffers {{{1
noremap <silent> <a-q><a-b> :<c-u>CocList buffers<cr>
noremap <silent> <a-q>b     :<c-u>CocList buffers<cr>
" CocList; Diagnostic {{{1
" Note: Unnecessary? pop up auto.
nmap qi <Plug>(coc-diagnostic-info)
nmap <silent> qf <Plug>(coc-fix-current)
nmap <silent> qk <Plug>(coc-diagnostic-prev)
nmap <silent> qj <Plug>(coc-diagnostic-next)
nmap <silent> [q <Plug>(coc-diagnostic-prev)
nmap <silent> ]q <Plug>(coc-diagnostic-next)
"nmap [e <Plug>(coc-diagnostic-prev-error)
"nmap ]e <Plug>(coc-diagnostic-next-error)
" CocList; Jump {{{1
"" Jump; as :edit {{{2
nnoremap <silent> gd :call CocActionAsync('jumpDefinition',     'edit')<cr>
xnoremap <silent> gd :call CocActionAsync('jumpDefinition',     'edit')<cr>
nnoremap <silent> gD :call CocActionAsync('jumpDeclaration',    'edit')<cr>
xnoremap <silent> gD :call CocActionAsync('jumpDeclaration',    'edit')<cr>
nnoremap <silent> gI :call CocActionAsync('jumpImplementation', 'edit')<cr>
xnoremap <silent> gI :call CocActionAsync('jumpImplementation', 'edit')<cr>
nnoremap <silent> gy :call CocActionAsync('jumpTypeDefinition', 'edit')<cr>
xnoremap <silent> gy :call CocActionAsync('jumpTypeDefinition', 'edit')<cr>
nnoremap <silent> gr :call CocActionAsync('jumpReferences',     'edit')<cr>
xnoremap <silent> gr :call CocActionAsync('jumpReferences',     'edit')<cr>
"" Jump; as :split {{{2
nnoremap <silent> <c-w>d :call CocActionAsync('jumpDefinition',     'split')<cr>
xnoremap <silent> <c-w>d :call CocActionAsync('jumpDefinition',     'split')<cr>
nnoremap <silent> <c-w>D :call CocActionAsync('jumpDeclaration',    'split')<cr>
xnoremap <silent> <c-w>D :call CocActionAsync('jumpDeclaration',    'split')<cr>
nnoremap <silent> <c-w>I :call CocActionAsync('jumpImplementation', 'split')<cr>
xnoremap <silent> <c-w>I :call CocActionAsync('jumpImplementation', 'split')<cr>
nnoremap <silent> <c-w>y :call CocActionAsync('jumpTypeDefinition', 'split')<cr>
xnoremap <silent> <c-w>y :call CocActionAsync('jumpTypeDefinition', 'split')<cr>
nnoremap <silent> <c-w>r :call CocActionAsync('jumpReferences',     'split')<cr>
xnoremap <silent> <c-w>r :call CocActionAsync('jumpReferences',     'split')<cr>

"" Jump; as :tabe {{{2
nnoremap <silent> <c-w>gd :call CocActionAsync('jumpDefinition',     'tabe')<cr>
xnoremap <silent> <c-w>gd :call CocActionAsync('jumpDefinition',     'tabe')<cr>
nnoremap <silent> <c-w>gD :call CocActionAsync('jumpDeclaration',    'tabe')<cr>
xnoremap <silent> <c-w>gD :call CocActionAsync('jumpDeclaration',    'tabe')<cr>
nnoremap <silent> <c-w>gI :call CocActionAsync('jumpImplementation', 'tabe')<cr>
xnoremap <silent> <c-w>gI :call CocActionAsync('jumpImplementation', 'tabe')<cr>
nnoremap <silent> <c-w>gy :call CocActionAsync('jumpTypeDefinition', 'tabe')<cr>
xnoremap <silent> <c-w>gy :call CocActionAsync('jumpTypeDefinition', 'tabe')<cr>
nnoremap <silent> <c-w>gr :call CocActionAsync('jumpReferences',     'tabe')<cr>
xnoremap <silent> <c-w>gr :call CocActionAsync('jumpReferences',     'tabe')<cr>
"" Jump; as :vsplit {{{2
nnoremap <silent> <c-w><space>d :call CocActionAsync('jumpDefinition',     'vsplit')<cr>
xnoremap <silent> <c-w><space>d :call CocActionAsync('jumpDefinition',     'vsplit')<cr>
nnoremap <silent> <c-w><space>D :call CocActionAsync('jumpDeclaration',    'vsplit')<cr>
xnoremap <silent> <c-w><space>D :call CocActionAsync('jumpDeclaration',    'vsplit')<cr>
nnoremap <silent> <c-w><space>I :call CocActionAsync('jumpImplementation', 'vsplit')<cr>
xnoremap <silent> <c-w><space>I :call CocActionAsync('jumpImplementation', 'vsplit')<cr>
nnoremap <silent> <c-w><space>y :call CocActionAsync('jumpTypeDefinition', 'vsplit')<cr>
xnoremap <silent> <c-w><space>y :call CocActionAsync('jumpTypeDefinition', 'vsplit')<cr>
nnoremap <silent> <c-w><space>r :call CocActionAsync('jumpReferences',     'vsplit')<cr>
xnoremap <silent> <c-w><space>r :call CocActionAsync('jumpReferences',     'vsplit')<cr>

" CocList; Format {{{1
command! -nargs=0 FormatOnCoc :call CocAction('format')
command! -nargs=? FoldOnCoc   :call CocAction('fold',       <f-args>)
command! -nargs=0 OR          :call CocAction('runCommand', 'editor.action.organizeImport')
" Mnemonic: Change the Structure.
nmap cs <Plug>(coc-refactor)
"set equalprg=CocActionAsync('formatSelected')
"set equalprg=CocActionAsync('codeLensAction')

xnoremap <expr> = (CocHasProvider('format'))?
      \ ':call CocActionAsync("formatSelected")<cr>': '='
nnoremap <expr> = (CocHasProvider('format'))?
      \ ':call CocActionAsync("formatSelected")<cr>': '='

" CocList; Rename {{{1
" Mnemonic: Change the lhs of Equal Sign
function! s:quick_format() abort
  let l:view = winsaveview()
  " Note: should keep ':norm' without 'bang';
  "       `=` may be mapped by such as coc.nvim.
  keepjump norm gg=G
  call winrestview(l:view)
endfunction
command! -bar QuickFormat :call <SID>quick_format()

omap <expr> =
      \ (v:operator ==# 'c')
      \ ?'<esc><Plug>(coc-rename)'
      \ :(v:operator ==# '=')
      \ ?'<esc>:QuickFormat<cr>'
      \ :'='
" CocList; Text-Object {{{1
" Note: mapped already as default?
vmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
vmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" CocList; CodeAction {{{1
nmap qA   <Plug>(coc-codeaction)
nmap qaa  <Plug>(coc-codeaction)
nmap qa   <Plug>(coc-codeaction-selected)
xmap qa   <Plug>(coc-codeaction-selected)
" CocList; Not Yet Mapped {{{1
" repeat only coc's util.
"nmap <silent> . <Plug>(coc-command-repeat)
"<Plug>(coc-openlink)
"<Plug>(coc-codelens-action)
"
"<Plug>(coc-float-hide)
"<Plug>(coc-float-jump)
"
" CocList; if selectionRange == v:true {{{2
"nmap <silent> n <Plug>(coc-range-select)
"nmap <silent> N <Plug>(coc-range-select-backward)
"vmap <silent> <Plug>(coc-cursors-range)
"nmap <silent> n <Plug>(coc-cursors-operator)
"nmap <silent> * <Plug>(coc-cursors-word)
"nmap <silent> n <Plug>(coc-cursors-position)
""}}}

" CocCompletion; {{{1
" Necessary?: closes mpreview vindow when completion is done.
"au! CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <c-x><c-y> <Cmd>CocList yank<cr>
inoremap <c-x>y     <Cmd>CocList yank<cr>
"" Completion; Trigger {{{2
function! s:make_sure_no_space() abort "{{{3
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
inoremap <silent><expr> <c-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>make_sure_no_space() ? "\<c-n>" :
      \ coc#refresh()
inoremap <silent><expr> <c-p>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>make_sure_no_space() ? "\<c-p>" :
      \ coc#refresh()
" CocSnippet; Do NOT use it {{{1
" TODO: Assign the dir where snippets will be saved.
"nmap <a-s><a-p> :CocCommand snippets.editSnippets<cr>
"" Trigger Just Snippets; <tab> to General Completion
"imap <C-s> <Plug>(coc-snippets-expand)
"vmap <C-s> <Plug>(coc-snippets-select)
"imap <C-s> <Plug>(coc-snippets-expand-jump)
" CocColor; {{{1
command! ColorFormat  :call CocAction('colorPresentation')
command! ColorPalette :call CocAction('pickColor')
