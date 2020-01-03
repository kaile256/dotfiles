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

" Ref: $XDG_CONFIG_HOME/coc/extensions/node_modules/coc-vimlsp/README.md
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'sh',
      \ 'go',
      \ 'json',
      \ 'toml',
      \ 'python',
      \ 'help'
      \]

" Note: <c-o> in coc's cmdline get to normal mode of coc.nvim
" the List of CocExtentions; "{{{1
" Note: have to install LSPs independently.
" Note: coc-highlight made CPU overwork
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
      \ 'coc-fish',
      \ 'coc-flow',
      \ 'coc-flutter',
      \ 'coc-git',
      \ 'coc-gitignore',
      \ 'coc-go',
      \ 'coc-homeassistant',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-lua',
      \ 'coc-markdownlint',
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
"}}}
nnoremap <expr> <C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr> <C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

" Command!; C-series {{{1
command! CopenLog      :call coc#rpc#notify('openLog',  [])
command! ClistResume   :call coc#rpc#notify('listResume', [])
command! Cprev         :call coc#rpc#notify('listPrev', [])
command! Cnext         :call coc#rpc#notify('listNext', [])
command! Crestart      :call coc#rpc#restart()
command! Cstart        :call coc#rpc#start_server()
command! Crebuild      :call coc#util#rebuild()
command! CInfo         :CocInfo

command! Cdisable      :CocDisable
command! Cenable       :CocEnable
command! Cconfig       :CocOpenConfig
command! ClocalConfig  :CocOpenLocalConfig

command! -nargs=* -range CAction
      \ :call coc#rpc#notify('codeActionRange', [<line1>, <line2>, <f-args>])
command! -nargs=* -range Cfix
      \ :call coc#rpc#notify('codeActionRange', [<line1>, <line2>, 'quickfix'])
command! -nargs=0 Cupdate
      \ :call coc#util#update_extensions(1)
command! -nargs=0 -bar CupdateSync
      \ :call coc#util#update_extensions()

" TODO: complete in autoload-function
"command! -nargs=+ -complete=custom,s:SearchOptions  Csearch
"      \ :call coc#rpc#notify('search', [<f-args>])
"command! -nargs=* -bar -complete=custom,s:InstallOptions Cinstall
"      \ :call coc#util#install_extension([<f-args>])
"command! -nargs=+ -complete=custom,s:ExtensionList  Cuninstall
"      \ :call coc#rpc#notify('CocAction', ['uninstallExtension', <f-args>])
"command! -nargs=* -range -complete=custom,s:CommandList Ccommand
"      \ :call coc#rpc#notify('runCommand', [<f-args>])

command! -nargs=* -complete=custom,coc#list#options Clist
      \ :call coc#rpc#notify('openList', [<f-args>])

" Original {{{2
command! -nargs=? Se :CocCommand session.save <args>
" Mnemonic: Load sessions
"command! L        :Clist sessions
"command! Sessions :Clist sessions
"command! SessionLoadC :CocCommand session.load
command! -nargs=* -complete=custom,coc#list#options Cremove    :CocUninstall <args>
command! Ccmd     :CocCommand
command! Ccommand :CocCommand
command! Cextensions :CocList extensions
nnoremap <silent> <space>cx :Cextensions<cr>
"command! -nargs=+ Csearch        :Csearch <f-args>
"command! -nargs=+ Cgrep        :Clist grep -regex <f-args>
"command! Ctemplate   CocCommand template.templateTop
"command! Cinit       CocCommand template.templateTop
"command! Init        CocCommand template.templateTop
" Note: fzf.vim is better, which has regex-like specification method.
"command! Cfiles    :Clist files
"command! Cmru      :Clist mru
"command! Cbuffers  :Clist buffers

command! CifHasProvider :call s:has_provider()
command! ChasProvider   :call s:has_provider()
command! Cprovider      :call s:has_provider()
function! s:has_provider() "{{{3
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
      call add(available, cntT .'. '. provider)
      let cntT = cntT +1
    elseif CocHasProvider(provider) == v:false
      call add(unavailable, cntF .'. '. provider)
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
      \ <SID>no_space_before() ? "\<c-n>" :
      \ coc#refresh()
inoremap <silent><expr> <c-p>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>no_space_before() ? "\<c-p>" :
      \ coc#refresh()
function! s:no_space_before() abort "{{{2
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" CocDiagnostic {{{1
" Note: Unnecessary? pop up auto.
nmap <silent> gW <Plug>(coc-diagnostic-info)
" Mnemonic: get Wrong line
nmap \w <Plug>(coc-fix-current)
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)
"nmap [e <Plug>(coc-diagnostic-prev-error)
"nmap ]e <Plug>(coc-diagnostic-next-error)
" CocJump {{{1
"" Jump; as :edit {{{2
nnoremap <silent> gd :call CocActionAsync('jumpDefinition',     'edit')<cr>zv
xnoremap <silent> gd :call CocActionAsync('jumpDefinition',     'edit')<cr>zv
nnoremap <silent> gD :call CocActionAsync('jumpDeclaration',    'edit')<cr>zv
xnoremap <silent> gD :call CocActionAsync('jumpDeclaration',    'edit')<cr>zv
nnoremap <silent> gI :call CocActionAsync('jumpImplementation', 'edit')<cr>zv
xnoremap <silent> gI :call CocActionAsync('jumpImplementation', 'edit')<cr>zv
nnoremap <silent> gy :call CocActionAsync('jumpTypeDefinition', 'edit')<cr>zv
xnoremap <silent> gy :call CocActionAsync('jumpTypeDefinition', 'edit')<cr>zv
nnoremap <silent> gr :call CocActionAsync('jumpReferences',     'edit')<cr>zv
xnoremap <silent> gr :call CocActionAsync('jumpReferences',     'edit')<cr>zv
"" Jump; as :split {{{2
nnoremap <silent> <c-w>d :call CocActionAsync('jumpDefinition',     'split')<cr>zv
xnoremap <silent> <c-w>d :call CocActionAsync('jumpDefinition',     'split')<cr>zv
nnoremap <silent> <c-w>D :call CocActionAsync('jumpDeclaration',    'split')<cr>zv
xnoremap <silent> <c-w>D :call CocActionAsync('jumpDeclaration',    'split')<cr>zv
nnoremap <silent> <c-w>I :call CocActionAsync('jumpImplementation', 'split')<cr>zv
xnoremap <silent> <c-w>I :call CocActionAsync('jumpImplementation', 'split')<cr>zv
nnoremap <silent> <c-w>y :call CocActionAsync('jumpTypeDefinition', 'split')<cr>zv
xnoremap <silent> <c-w>y :call CocActionAsync('jumpTypeDefinition', 'split')<cr>zv
nnoremap <silent> <c-w>r :call CocActionAsync('jumpReferences',     'split')<cr>zv
xnoremap <silent> <c-w>r :call CocActionAsync('jumpReferences',     'split')<cr>zv

"" Jump; as :tabe {{{2
nnoremap <silent> <c-w>gd :call CocActionAsync('jumpDefinition',     'tabe')<cr>zv
xnoremap <silent> <c-w>gd :call CocActionAsync('jumpDefinition',     'tabe')<cr>zv
nnoremap <silent> <c-w>gD :call CocActionAsync('jumpDeclaration',    'tabe')<cr>zv
xnoremap <silent> <c-w>gD :call CocActionAsync('jumpDeclaration',    'tabe')<cr>zv
nnoremap <silent> <c-w>gI :call CocActionAsync('jumpImplementation', 'tabe')<cr>zv
xnoremap <silent> <c-w>gI :call CocActionAsync('jumpImplementation', 'tabe')<cr>zv
nnoremap <silent> <c-w>gy :call CocActionAsync('jumpTypeDefinition', 'tabe')<cr>zv
xnoremap <silent> <c-w>gy :call CocActionAsync('jumpTypeDefinition', 'tabe')<cr>zv
nnoremap <silent> <c-w>gr :call CocActionAsync('jumpReferences',     'tabe')<cr>zv
xnoremap <silent> <c-w>gr :call CocActionAsync('jumpReferences',     'tabe')<cr>zv
"" Jump; as :vsplit {{{2
nnoremap <silent> <c-w><space>d :call CocActionAsync('jumpDefinition',     'vsplit')<cr>zv
xnoremap <silent> <c-w><space>d :call CocActionAsync('jumpDefinition',     'vsplit')<cr>zv
nnoremap <silent> <c-w><space>D :call CocActionAsync('jumpDeclaration',    'vsplit')<cr>zv
xnoremap <silent> <c-w><space>D :call CocActionAsync('jumpDeclaration',    'vsplit')<cr>zv
nnoremap <silent> <c-w><space>I :call CocActionAsync('jumpImplementation', 'vsplit')<cr>zv
xnoremap <silent> <c-w><space>I :call CocActionAsync('jumpImplementation', 'vsplit')<cr>zv
nnoremap <silent> <c-w><space>y :call CocActionAsync('jumpTypeDefinition', 'vsplit')<cr>zv
xnoremap <silent> <c-w><space>y :call CocActionAsync('jumpTypeDefinition', 'vsplit')<cr>zv
nnoremap <silent> <c-w><space>r :call CocActionAsync('jumpReferences',     'vsplit')<cr>zv
xnoremap <silent> <c-w><space>r :call CocActionAsync('jumpReferences',     'vsplit')<cr>zv

" CocFormat {{{1
" Note: coc-prettier's editorconfig ability seems useless
"       when prettier is unavailable on the filetype.
"command! FormatOnC :call CocAction('format')
"command! -nargs=? FoldOnC :call CocAction('fold', <f-args>)
command! OR :call CocAction('runCommand', 'editor.action.organizeImport')
" Mnemonic: Change the Structure.
nmap cs <Plug>(coc-refactor)

" Mnemonic: Change the lhs of Equal Sign
function! s:quick_format() abort
  let save_view = winsaveview()

  if index(['javascript', 'typescript', 'css', 'json'], &ft) > 0
    " TODO: detect if coc-prettier is provided.
    CocCommand prettier.formatFile
  elseif CocHasProvider('format') && (index(['bash', 'sh'], &ft) < 0)
    let num = line('$')
    echomsg num 'lines should be indented by COC...'
    " keep ':norm' from <bang> to use <Plug>-map.
    call CocActionAsync('format')
  else
    norm! gg=G
    " Note: echomsg '<num> line indented' as default
  endif

  call winrestview(save_view)
endfunction
command! -bar QuickFormat :call s:quick_format()

" TODO: make a fork if prettier is available.
"omap <expr><silent> =
"      \ (v:operator ==# 'c')?
"      \   '<esc><Plug>(coc-rename)':
"      \ (v:operator ==# '=')?
"      \   '<esc>:QuickFormat<cr>':
"      \   '='

nmap c= <Plug>(coc-rename)
nmap <silent> == :<c-u>QuickFormat<cr>

augroup myCocPrettier
  au!
  au FileType javascript,typescript,css,json call s:prettier()
augroup END
function! s:prettier() abort "{{{2
  " overrides :QuickFormat; omap is still available
  command! -buffer Prettier    :CocCommand prettier.formatFile
  xnoremap <buffer> = <Plug>(coc-format-selected)
  nnoremap <buffer> = <Plug>(coc-format-selected)
endfunction

" Note: coc-prettier has lower priority; when the document has other
" format provider, prettier would not work.
" Prettier's range format only support languageId including: {{{2
" `javascript`, `javascriptreact`,
" `typescript`, `typescriptreact`,
" `json` and `graphql`.

" CocText-Object {{{1
" Note: mapped already as default?
vmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
vmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" CocCodeAction {{{1
"set equalprg=CocActionAsync('formatSelected')
"set equalprg=CocActionAsync('codeLensAction')
nnoremap \A :call CocActionAsync('codeLensAction')<cr>
nmap \aa <Plug>(coc-codeaction)
nmap \a  <Plug>(coc-codeaction-selected)
xmap \a  <Plug>(coc-codeaction-selected)
" CocWorkspace {{{1
command! Rename :CocCommand workspace.renameCurrentFile

" CocRange, or Multiple Cursor {{{1
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
"" Mnemonic: Mark
"xmap <silent> m <Plug>(coc-cursors-range)
"nmap <silent> m <Plug>(coc-cursors-operator)
" Mnemonic: Macro of Cursor
"nmap <silent> qc <Plug>(coc-cursors-operator)
"xmap <silent> qc <Plug>(coc-cursors-range)
"nnoremap <silent> cq CocCommand document.renameCurrentWord<cr>
""nmap <silent> <c-j> <Plug>(coc-range-select)
""nmap <silent> <c-k> <Plug>(coc-range-select-backward)
""nmap <silent> * <Plug>(coc-cursors-word)
""nmap <silent> n <Plug>(coc-cursors-position)
" CocColor; {{{1
command! ColoFormat  :call CocAction('colorPresentation')
command! ColoPalette :call CocAction('pickColor')
nnoremap <space>cp :ColoPalette<cr>

" CocList; {{{1
" show commit contains current position
nnoremap <silent> <space>cl :CocList<cr>
nnoremap <silent> <space>cf :CocList files<cr>
nnoremap <silent> <space>cb :CocList buffers<cr>

" CocBookmark; {{{1
nmap ma <Plug>(coc-bookmark-annotate)
nmap mj <Plug>(coc-bookmark-next)
nmap mk <Plug>(coc-bookmark-prev)
nmap md <Plug>(coc-bookmark-toggle)
nmap mt <Plug>(coc-bookmark-toggle)

command! Bookmarks :Clist bookmark
nnoremap <silent> <space>cb :Clist bookmark<cr>
"" CocExplorer {{{1
"command! CExplorer CocCommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size

" CocGit {{{1
command! GaddChunk :CocCommand git.chunkStage
command! GchunkAdd :CocCommand git.chunkStage
" Mnemonic: Git Put (similar to dp as diffput)
nnoremap <space>gp :<c-u>GaddChunk<cr>
" TODO: for-loop in range because no range available yet.
xmap <space>ga <Plug>(coc-git-add-chunk)
" Note: :Gstatus within one command/keymap doesn't work.
xnoremap <silent> <Plug>(coc-git-add-chunk)
      \ :call coc#git_add_chunks()<cr>

function coc#git_add_chunks() abort range
  let save_view = winsaveview()
  exe a:firstline
  let c_line = line('.')
  " TODO: be available in normal mode as an operator
  while c_line <= a:lastline
    " FIXME: still useless, even freezes vim.
    "call feedkeys(":CocCommand git.chunkStage\<cr>", 'n')
    "call feedkeys('j', 'n')
    CocCommand git.chunkStage
    norm! j
    let c_line += 1
  endwhile
  " Note: only to scroll down a fugitive-buffer.
  "Gstatus
  "call feedkeys(":call winrestview(save_view)\<cr>", 'n')
  call winrestview(save_view)
endfunction

nnoremap U :CocCommand git.chunkUndo<cr>

command! -nargs=? Gfold :CocCommand git.foldUnchanged
function! coc#git_fold_toggle() abort
  if &l:fdm !=# 'manual'
    let b:coc#_save_fdm = &l:fdm
    Ccommand git.foldUnchanged
  elseif exists('b:fdm')
    exe 'set fdm='. b:coc#_save_fdm
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
"augroup CocPairsDisable
"  au!
"  au FileType vim let b:coc_pairs_disabled = ['"']
"augroup END

" CocTranslator {{{1
" Note: CANNOT replace 'toLang' before translator yet.
"command! CJapaneseEcho    :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand  translator.echo
"command! CJapaneseReplace :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand translator.replace
"command! CJapanesePum     :call coc#config("translator", {"toLang": "ja"}) <bar> CocCommand  translator.popup
command! CEnglishEcho    :call coc#config("translator", {"toLang": "en"}) <bar> CocCommand translator.echo
command! CEnglishReplace :call coc#config("translator", {"toLang": "en"}) <bar> CocCommand translator.replace
command! CEnglishPum     :call coc#config("translator", {"toLang": "en"}) <bar> CocCommand translator.popup

" CocTodo, or Task {{{1
command! Ctask         CocCommand todolist.create
command! CshowTaskList :Clist    todolist
nnoremap <silent> <space>ct :Ctask<cr>
nnoremap <silent> <space>cs :CshowTaskList<cr>

" CocYank; {{{1

" Required?: closes mpreview vindow when completion is done.
"au! CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

function s:register_hist() abort
  " Note: <c-o> is necessary to make (a)ppend work in Coclist yank.
  norm! <c-o>
  " TODO: select (a)ppend w/o actionmenu
  Coclist yank
endfunction
inoremap <c-x><c-y> <c-o>:call <SID>register_hist()<cr>
inoremap <c-x>y     <c-o>:call <SID>register_hist()<cr>

" CocSnippet; {{{1
" TODO: See doc to Assign the dir where snippets will be saved.
"nmap <a-s><a-p> CocCommand snippets.editSnippets<cr>
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
