" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: .config/coc/extensions
" Json: coc-settings.json

augroup CocMyAutoConf
  au!
  au BufWinEnter coc-settings.json setl keywordprg=:help
  "au BufLeave * if &ft ==# 'coc' || 'list' | hide | endif
  au FileType coc,list setl laststatus=0
        \ | au BufWinEnter,WinLeave,BufLeave * ++once set laststatus=2
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
      \ 'coc-flutter',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-go',
      \ 'coc-highlight',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-omni',
      \ 'coc-phpls',
      \ 'coc-post',
      \ 'coc-prettier',
      \ 'coc-project',
      \ 'coc-python',
      \ 'coc-rust-analyzer',
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

command! -nargs=* -complete=custom,coc#list#options Cl  :Clist <f-args>
command! -nargs=* -complete=custom,coc#list#options Cli :Clist <f-args>
command! S :Ccommand session.save
" Mnemonic: Load sessions
command! L        :Clist sessions
command! Sessions :Clist sessions
"command! SessionLoadC :CocCommand session.load
command! -nargs=* Cremove  :Cuninstall <f-args>
command! -nargs=+ -complete=custom,coc#list#options Cremove :Cuninstall <f-args>
command! Ccmd       :Ccommand
command! Cextensions :Clist    extensions
"command! -nargs=+ Csearch        :Csearch <f-args>
"command! -nargs=+ Cgrep        :Clist grep -regex <f-args>
"command! Ctemplate   :Ccommand template.templateTop
"command! Cinit       :Ccommand template.templateTop
"command! Init        :Ccommand template.templateTop
" Note: fzf.vim is better,
"       which has regex-like specification method on fuzzy-matcher.
"command! Cfiles    :Clist files
"command! Cmru      :Clist mru
"command! Cbuffers  :Clist buffers

command! ChasProvider :call <SID>has_provider()
function! s:has_provider() "{{{2
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
  let available   = []
  let cntT = 1
  let unavailable = []
  let cntF = 1
  for provider in l:coc_provider_list
    if CocHasProvider(provider) == v:true
      call add(available, cntT .". ". provider)
      let cntT = cntT +1
    elseif CocHasProvider(provider) == v:false
      call add(unavailable, cntF .". ". provider)
      let cntF = cntF +1
    endif
  endfor

  echohl Normal
  echon " The providers below are available on this buffer: \n\n"
  echohl Type
  echon " ======== True ==================================\n\t  "
  echohl Identifier
  echon join(available, "\n\t  ")
  echohl Normal
  echohl Type
  echon "\n\n"
  echon " ======== False =================================\n\t  "
  echohl WarningMsg
  echon join(unavailable, "\n\t  ")
  echon "\n"
endfunction

"}}}
" CocCompletion; {{{1
" TODO: add fugitive#EditComplete to coc#refresh's list.
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
" Note: coc-prettier's editorconfig ability seems useless
"       when prettier is unavailable on the filetype.
"command! FormatOnC :call CocAction('format')
"command! -nargs=? FoldOnC :call CocAction('fold', <f-args>)
command! OR          :call Caction('runCommand', 'editor.action.organizeImport')
command! Format :Ccommand prettier.formatFile
" Mnemonic: Change the Structure.
nmap cs <Plug>(coc-refactor)
"set equalprg=CocActionAsync('formatSelected')
"set equalprg=CocActionAsync('codeLensAction')
nnoremap ql :call CocActionAsync('codeLensAction')<cr>

" Note: coc-prettier has lower priority; when the document has other
" format provider, prettier would not work.
" Prettier's range format only support languageId including: {{{2
" `javascript`, `javascriptreact`,
" `typescript`, `typescriptreact`,
" `json` and `graphql`.
"xnoremap <expr> = (CocHasProvider('format'))?
"      \ '<Plug>(coc-format-selected)': '='
"nnoremap <expr> = (CocHasProvider('format'))?
"      \ '<Plug>(coc-format-selected)': '='

" Mnemonic: Change the lhs of Equal Sign
function! s:quick_format() abort
  let save_view = winsaveview()

  if CocHasProvider('format')
    " keep ':norm' from <bang> to use <Plug>-map.
    norm gg<Plug>(coc-format-selected)G
    "elseif CocHasProvider('prettier')
    " TODO: detect if coc-prettier is provided.
    "  CocCommand prettier.formatFile
  else
    norm! gg=G
  endif

  call winrestview(save_view)
endfunction
command! -bar QuickFormat :call <SID>quick_format()

omap <expr> s (v:operator ==# '=')? ':echo "@"<cr>': ':echo "nothing"<cr>'

" TODO: make a fork if prettier is available.
omap <expr><silent> =
      \ (v:operator ==# 'c')?
      \   '<esc><Plug>(coc-rename)':
      \ (v:operator ==# '=')?
      \   '<esc>:QuickFormat<cr>':
      \   '='

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
command! Rename :Ccommand workspace.renameCurrentFile

" CocRange, or Multiple Cursor {{{1
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
"" Mnemonic: Mark
"xmap <silent> m <Plug>(coc-cursors-range)
"nmap <silent> m <Plug>(coc-cursors-operator)
" Mnemonic: Macro of Cursor
"nmap <silent> qc <Plug>(coc-cursors-operator)
"xmap <silent> qc <Plug>(coc-cursors-range)
"nnoremap <silent> cq :Ccommand document.renameCurrentWord<cr>
""nmap <silent> <c-j> <Plug>(coc-range-select)
""nmap <silent> <c-k> <Plug>(coc-range-select-backward)
""nmap <silent> * <Plug>(coc-cursors-word)
""nmap <silent> n <Plug>(coc-cursors-position)
" CocColor; {{{1
command! ColoFormat  :call Caction('colorPresentation')
command! ColoPalette :call Caction('pickColor')
nnoremap <space>cp :ColoPalette<cr>
" CocExtensions {{{1
command! Cextensions :CocList extensions
command! CExtensions   :Clist extensions
nnoremap <silent> <space>cx :Cextensions<cr>
" CocList; {{{1
" show commit contains current position
nnoremap <silent> <space>cl :Clist<cr>
nnoremap <silent> <space>cf :Clist files<cr>
nnoremap <silent> <space>cb :Clist buffers<cr>
" CocBookmark; {{{1
nmap ma <Plug>(coc-bookmark-annotate)
command! Bookmarks :Clist bookmark
nnoremap <silent> <space>cb :Clist bookmark<cr>
"" CocExplorer {{{1
"command! CExplorer :Ccommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size
""}}}
" CocGit {{{1
command! GaddChunk :Ccommand git.chunkStage
command! GchunkAdd :Ccommand git.chunkStage
" Mnemonic: Git Put (similar to dp as diffput)
nnoremap <space>gp :<c-u>GaddChunk<cr>
" TODO: for-loop in range because no range available yet.
xmap <space>gp <Plug>(coc-git-add-chunk)

function coc#git_add_chunk() abort range
  " TODO: find out what's wrong.
  let save_view = winsaveview()
  exe line("'<")
  " TODO: be available in normal mode
  while line('.') <= line("'>")
    " FIXME: still useless, even freezes vim.
    call feedkeys(":Ccommand git.chunkStage<cr>", 'n')
    call feedkeys('gj', 'n')
  endwhile
  " Note: only to scroll down a fugitive-buffer.
  "Gstatus
  "call feedkeys(":call winrestview(save_view)<cr>", 'n')
endfunction
" Note: :Gstatus within one command/keymap doesn't work.
xnoremap <silent> <Plug>(coc-git-add-chunk)
      \ :<c-u>call coc#git_add_chunk()<cr>

nnoremap U :Ccommand git.chunkUndo<cr>
command! -nargs=? Gfold :Ccommand git.foldUnchanged
function! coc#git_fold_toggle() abort
  if &l:fdm !=# 'manual'
    let b:fdm = &l:fdm
    Ccommand git.foldUnchanged
  elseif exists('b:fdm')
    exe 'set fdm='. b:fdm
  else
    set fdm=syntax
  endif
endfunction

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
"command! CJapaneseEcho    :call coc#config("translator", {"toLang": "ja"}) <bar> :Ccommand  translator.echo
"command! CJapaneseReplace :call coc#config("translator", {"toLang": "ja"}) <bar> :Ccommand translator.replace
"command! CJapanesePum     :call coc#config("translator", {"toLang": "ja"}) <bar> :Ccommand  translator.popup
command! CEnglishEcho    :call coc#config("translator", {"toLang": "en"}) <bar> :Ccommand  translator.echo
command! CEnglishReplace :call coc#config("translator", {"toLang": "en"}) <bar> :Ccommand translator.replace
command! CEnglishPum     :call coc#config("translator", {"toLang": "en"}) <bar> :Ccommand  translator.popup

" CocTodo, or Task {{{1
command! Ctask         :Ccommand todolist.create
command! CshowTaskList :Clist    todolist
nnoremap <silent> <space>ct :Ctask<cr>
nnoremap <silent> <space>cs :CshowTaskList<cr>
" CocYank; {{{1
" Highlight on yanked
hi HighlightedyankRegion ctermfg=232 ctermbg=66 guifg=#000000 guibg=#df5f29

" Required?: closes mpreview vindow when completion is done.
"au! CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

function s:register_hist() abort
  " Note: <c-o> is necessary to make (a)ppend work in Clist yank.
  norm! <c-o>
  " TODO: select (a)ppend w/o actionmenu
  Clist yank
endfunction
inoremap <c-x><c-y> <c-o>:call <SID>register_hist()<cr>
inoremap <c-x>y     <c-o>:call <SID>register_hist()<cr>

" CocSnippet; {{{1
" TODO: See doc to Assign the dir where snippets will be saved.
"nmap <a-s><a-p> :Ccommand snippets.editSnippets<cr>
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
