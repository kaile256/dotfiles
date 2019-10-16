" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" Func: neoclide/coc.nvim_release/plugin/coc.vim
" XDG: .config/coc/extensions
" Json: coc-settings.json

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

" Ref: coc/extensions/node_modules/coc-vimlsp/README.md
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" Note: <c-o> in coc's cmdline get to normal mode of coc.nvim
" the List of CocExtentions; "{{{1
" Note: Have to install LSPs independently.
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-bookmark',
      \ 'coc-conjure',
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-elixir',
      \ 'coc-emoji',
      \ 'coc-flow',
      \ 'coc-git',
      \ 'coc-gitignore',
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
      \ 'coc-rust-analyzer',
      \ 'coc-python',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tag',
      \ 'coc-texlab',
      \ 'coc-todolist',
      \ 'coc-translator',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ ]
" TODO: convert the list into string.
"let g:coc_extensions_all = substitute(g:coc_global_extensions, )
"}}}
nnoremap <expr> <C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr> <C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

" Command!; C-series {{{1

command! CocCheckHasProvider :call <SID>has_provider()
command! CcheckHasProvider   :call <SID>has_provider()
command! -nargs=+ Cinstall :CocInstall <q-args>
command! -nargs=+ Cuninstall :CocUninstall <q-args>
command! -nargs=+ CocRemove  :CocUninstall <q-args>
command! -nargs=+ Cremove    :CocUninstall <q-args>
command! Cconfig    :CocConfig
command! Ccmd       :CocCommand
command! Clist      :CocList
command! Coc        :CocList
command! Cextensions :CocList    extensions
"command! -nargs=+ Csearch        :CocSearch <q-args>
"command! -nargs=+ Cgrep        :CocList grep -regex <q-args>
"command! Ctemplate   :CocCommand template.templateTop
"command! Cinit       :CocCommand template.templateTop
"command! Init        :CocCommand template.templateTop
" Note: fzf.vim is better,
"       which has regex-like specification method on fuzzy-matcher.
"command! Cfiles    :CocList files
"command! Cmru      :CocList mru
"command! Cbuffers  :CocList buffers

function! s:has_provider() "{{{1
  let l:coc_provider_list = [
        \ 'hover',
        \ 'rename',
        \ 'format',
        \ 'codeAction',
        \ 'onTypeEdit',
        \ 'reference',
        \ 'definition',
        \ 'declaration',
        \ 'typeDefinition',
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
" CocCompletion; {{{1
inoremap <silent><expr> <c-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>make_sure_no_space() ? "\<c-n>" :
      \ coc#refresh()
inoremap <silent><expr> <c-p>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>make_sure_no_space() ? "\<c-p>" :
      \ coc#refresh()
function! s:make_sure_no_space() abort "{{{2
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
" CocDiagnostic {{{1
" Note: Unnecessary? pop up auto.
nmap qi <Plug>(coc-diagnostic-info)
nmap <silent> qf <Plug>(coc-fix-current)
nmap <silent> qp <Plug>(coc-diagnostic-prev)
nmap <silent> qn <Plug>(coc-diagnostic-next)
nmap <silent> [q <Plug>(coc-diagnostic-prev)
nmap <silent> ]q <Plug>(coc-diagnostic-next)
"nmap [e <Plug>(coc-diagnostic-prev-error)
"nmap ]e <Plug>(coc-diagnostic-next-error)
" CocJump {{{1
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

" CocFormat {{{1
command! FormatOnCoc :call CocAction('format')
command! -nargs=? FoldOnCoc :call CocAction('fold', <f-args>)
command! OR          :call CocAction('runCommand', 'editor.action.organizeImport')
" Mnemonic: Change the Structure.
nmap cs <Plug>(coc-refactor)
"set equalprg=CocActionAsync('formatSelected')
"set equalprg=CocActionAsync('codeLensAction')
nnoremap ql :call CocActionAsync('codeLensAction')<cr>

xnoremap <expr> = (CocHasProvider('format'))?
      \ '\<Plug>(coc-format-selected)': '='
nnoremap <expr> = (CocHasProvider('format'))?
      \ '\<Plug>(coc-format-selected)': '='

" CocRename {{{1
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
" CocText-Object {{{1
" Note: mapped already as default?
vmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
vmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" CocCodeAction {{{1
nmap qA  <Plug>(coc-codeaction)
nmap qaa <Plug>(coc-codeaction)
nmap qa  <Plug>(coc-codeaction-selected)
xmap qa  <Plug>(coc-codeaction-selected)
" CocWorkspace {{{1
noremap! <c-x><c-;> <esc>q:
noremap! <c-x><c-/> <esc>q/
command! Rename :CocCommand workspace.renameCurrentFile

" CocRange, or Multiple Cursor {{{1
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
"" Mnemonic: Mark
"xmap <silent> m <Plug>(coc-cursors-range)
"nmap <silent> m <Plug>(coc-cursors-operator)
" Mnemonic: Macro of Cursor
"nmap <silent> qc <Plug>(coc-cursors-operator)
"xmap <silent> qc <Plug>(coc-cursors-range)
"nnoremap <silent> cq :CocCommand document.renameCurrentWord<cr>
""nmap <silent> <c-j> <Plug>(coc-range-select)
""nmap <silent> <c-k> <Plug>(coc-range-select-backward)
""nmap <silent> * <Plug>(coc-cursors-word)
""nmap <silent> n <Plug>(coc-cursors-position)
" CocColor; {{{1
command! ColoFormat  :call CocAction('colorPresentation')
command! ColoPalette :call CocAction('pickColor')
nnoremap <space>cp :ColoPalette<cr>
" CocExtensions {{{1
command! CocExtensions :CocList extensions
command! CExtensions   :CocList extensions
nnoremap <silent> <space>cx :CocExtensions<cr>
" CocList; {{{1
" show commit contains current position
nnoremap <silent> <space>cl :CocList<cr>
nnoremap <silent> <space>cf :CocList files<cr>
nnoremap <silent> <space>cb :CocList buffers<cr>
" CocBookmark; {{{1
nmap <space>cm <Plug>(coc-bookmark-annotate)
nmap <silent> <space>cb :CocList bookmark<cr>
" CocSession {{{1
command! MksessionCoc   :CocCommand session.save
command! SaveSessionCoc :CocCommand session.save
command! LoadSessionCoc :CocCommand session.load
cnoreabbr <expr> mks (getcmdtype() == ':' && getcmdline() =~ '^mks$')?
      \ 'MksessionCoc' : 'mks'
cnoreabbr <expr> lds (getcmdtype() == ':' && getcmdline() =~ '^lds$')?
      \ 'LoadSessionCoc' : 'lds'
"" CocExplorer {{{1
"command! CExplorer :CocCommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size
""}}}
" CocGit {{{1
command! GaddChunk :CocCommand git.chunkStage
" Mnemonic: Git Put (similar to dp as diffput)
nnoremap <space>gp :GaddChunk<cr>

nnoremap U  :CocCommand git.chunkUndo<cr>
" Ref: add/winpick.vim

" Similar to the navigation on &diff
nmap <expr> [c (&diff)? '[c': '<Plug>(coc-git-prevchunk)'
nmap <expr> ]c (&diff)? ']c': '<Plug>(coc-git-nextchunk)'
" show chunk diff at current position
nmap <space>gc <Plug>(coc-git-chunkinfo)
omap ic <Plug>(coc-text-object-inner)
xmap ic <Plug>(coc-text-object-inner)
omap ac <Plug>(coc-text-object-outer)
xmap ac <Plug>(coc-text-object-outer)
" CocPairs {{{1
augroup CocPairsDisable
  au!
  au FileType vim let b:coc_pairs_disabled = ['"']
augroup END
" CocTranslator {{{1
" Note: CANNOT replace 'toLang' before translator yet.
"command! CJapaneseEcho    :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand  translator.echo
"command! CJapaneseReplace :call coc#config("translator", {"toLang": "ja"}) <bar> :CocCommand translator.replace
"command! CJapanesePum     :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand  translator.popup
command! CEnglishEcho    :call coc#config("translator", {"toLang": "en"}) <bar> CocCommand  translator.echo
command! CEnglishReplace :call coc#config("translator", {"toLang": "en"}) <bar> :CocCommand translator.replace
command! CEnglishPum     :call coc#config("translator", {"toLang": "en"}) <bar> CocCommand  translator.popup

" CocTodo, or Task {{{1
command! CocTask         :CocCommand todolist.create
command! CTask           :CocCommand todolist.create
command! CocShowTaskList :CocList    todolist
command! CShowTaskList   :CocList    todolist
nnoremap <silent> <space>ct :CocTask<cr>
nnoremap <silent> <space>cs :CocShowTaskList<cr>
" CocYank; {{{1
" Highlight on yanked
hi HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29

" Required?: closes mpreview vindow when completion is done.
"au! CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <c-x><c-y> <Cmd>CocList yank<cr>
inoremap <c-x>y     <Cmd>CocList yank<cr>
" CocSnippet; {{{1
" TODO: See doc to Assign the dir where snippets will be saved.
"nmap <a-s><a-p> :CocCommand snippets.editSnippets<cr>
"" Trigger Just Snippets; <tab> to General Completion
"imap <C-s> <Plug>(coc-snippets-expand)
"vmap <C-s> <Plug>(coc-snippets-select)
"imap <C-s> <Plug>(coc-snippets-expand-jump)
" CocNot Yet Mapped {{{1
" repeat only coc's util.
"nmap <silent> . <Plug>(coc-command-repeat)
"<Plug>(coc-openlink)
"<Plug>(coc-codelens-action)
"
"<Plug>(coc-float-hide)
"<Plug>(coc-float-jump)
"
