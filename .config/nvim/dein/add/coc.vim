" From: external.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: $COC_DATA_HOME/extensions/node_modules/
" Json: coc-settings.json
" Another: source/coc.vim

augroup myCocAdd
  if exists('#myCocAdd') | au! myCocAdd
  endif
  au BufWinEnter coc-settings.json setl keywordprg=:help
augroup END

" " Note: <c-o> in coc's cmdline get to normal mode of coc.nvim
" nnoremap <expr> <C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
" nnoremap <expr> <C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

" Command!; C-series {{{1
command! Cconfig       :CocOpenConfig

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
nmap <silent> gX <Plug>(coc-diagnostic-info)
noremap <SID>(zv) :<C-u>sleep 5m <bar> norm! zv<CR>

" Mnemonic: get Info
nmap \X <Plug>(coc-fix-current)
map <silent> [x <Plug>(coc-diagnostic-prev)<SID>(zv)
map <silent> ]x <Plug>(coc-diagnostic-next)<SID>(zv)

"nmap [e <Plug>(coc-diagnostic-prev-error)
"nmap ]e <Plug>(coc-diagnostic-next-error)

" CocJump {{{1
" Note: for 'zv', not in Async

"" Jump; as :edit {{{2
nnoremap <silent> gd :call CocAction('jumpDefinition',     'edit')<cr>zv
xnoremap <silent> gd :call CocAction('jumpDefinition',     'edit')<cr>zv
nnoremap <silent> gD :call CocAction('jumpDeclaration',    'edit')<cr>zv
xnoremap <silent> gD :call CocAction('jumpDeclaration',    'edit')<cr>zv
nnoremap <silent> gI :call CocAction('jumpImplementation', 'edit')<cr>zv
xnoremap <silent> gI :call CocAction('jumpImplementation', 'edit')<cr>zv
nnoremap <silent> gy :call CocAction('jumpTypeDefinition', 'edit')<cr>zv
xnoremap <silent> gy :call CocAction('jumpTypeDefinition', 'edit')<cr>zv
nnoremap <silent> gr :call CocAction('jumpReferences',     'edit')<cr>zv
xnoremap <silent> gr :call CocAction('jumpReferences',     'edit')<cr>zv

"" Jump; as :split {{{2
nnoremap <silent> <c-w>d :call CocAction('jumpDefinition',     'split')<cr>zv
xnoremap <silent> <c-w>d :call CocAction('jumpDefinition',     'split')<cr>zv
nnoremap <silent> <c-w>D :call CocAction('jumpDeclaration',    'split')<cr>zv
xnoremap <silent> <c-w>D :call CocAction('jumpDeclaration',    'split')<cr>zv
nnoremap <silent> <c-w>I :call CocAction('jumpImplementation', 'split')<cr>zv
xnoremap <silent> <c-w>I :call CocAction('jumpImplementation', 'split')<cr>zv
nnoremap <silent> <c-w>y :call CocAction('jumpTypeDefinition', 'split')<cr>zv
xnoremap <silent> <c-w>y :call CocAction('jumpTypeDefinition', 'split')<cr>zv
nnoremap <silent> <c-w>r :call CocAction('jumpReferences',     'split')<cr>zv
xnoremap <silent> <c-w>r :call CocAction('jumpReferences',     'split')<cr>zv

"" Jump; as :tabe {{{2
nnoremap <silent> <c-w>gd :call CocAction('jumpDefinition',     'tabe')<cr>zv
xnoremap <silent> <c-w>gd :call CocAction('jumpDefinition',     'tabe')<cr>zv
nnoremap <silent> <c-w>gD :call CocAction('jumpDeclaration',    'tabe')<cr>zv
xnoremap <silent> <c-w>gD :call CocAction('jumpDeclaration',    'tabe')<cr>zv
nnoremap <silent> <c-w>gI :call CocAction('jumpImplementation', 'tabe')<cr>zv
xnoremap <silent> <c-w>gI :call CocAction('jumpImplementation', 'tabe')<cr>zv
nnoremap <silent> <c-w>gy :call CocAction('jumpTypeDefinition', 'tabe')<cr>zv
xnoremap <silent> <c-w>gy :call CocAction('jumpTypeDefinition', 'tabe')<cr>zv
nnoremap <silent> <c-w>gr :call CocAction('jumpReferences',     'tabe')<cr>zv
xnoremap <silent> <c-w>gr :call CocAction('jumpReferences',     'tabe')<cr>zv

"" Jump; as :vsplit {{{2
nnoremap <silent> <c-w><space>d :call CocAction('jumpDefinition',     'vsplit')<cr>zv
xnoremap <silent> <c-w><space>d :call CocAction('jumpDefinition',     'vsplit')<cr>zv
nnoremap <silent> <c-w><space>D :call CocAction('jumpDeclaration',    'vsplit')<cr>zv
xnoremap <silent> <c-w><space>D :call CocAction('jumpDeclaration',    'vsplit')<cr>zv
nnoremap <silent> <c-w><space>I :call CocAction('jumpImplementation', 'vsplit')<cr>zv
xnoremap <silent> <c-w><space>I :call CocAction('jumpImplementation', 'vsplit')<cr>zv
nnoremap <silent> <c-w><space>y :call CocAction('jumpTypeDefinition', 'vsplit')<cr>zv
xnoremap <silent> <c-w><space>y :call CocAction('jumpTypeDefinition', 'vsplit')<cr>zv
nnoremap <silent> <c-w><space>r :call CocAction('jumpReferences',     'vsplit')<cr>zv
xnoremap <silent> <c-w><space>r :call CocAction('jumpReferences',     'vsplit')<cr>zv

" CocFormat {{{1
command! Import :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Note: coc-prettier's editorconfig ability seems useless
"       when prettier is unavailable on the filetype.
"command! FormatOnC :call CocAction('format')
"command! -nargs=? FoldOnC :call CocAction('fold', <f-args>)
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

if exists('#myCocPrettier')
  au! myCocPrettier
endif
augroup myCocPrettier
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

" " CocSnippets {{{1
" " Note: Regex is interpreted by JavaScript while original UltiSnips
" " interprets in Python.
" " Help: $COC_DATA_HOME/extensions/node_modules/coc-snippets
" " Note: it works without ultisnips itself.
" "nmap <a-s><a-p> CocCommand snippets.editSnippets<cr>
" " Trigger Just Snippets; <tab> to General Completion
" imap <c-\> <Plug>(coc-snippets-expand)
" vmap <c-\> <Plug>(coc-snippets-select)
" imap <c-\> <Plug>(coc-snippets-expand-jump)

" " Note: slower than UltiSnips' command, `:UltiSnipsEdit`.
" nnoremap <silent> <a-s><a-p><a-e> :<C-u>CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p><a-s> :<C-u>sp <bar> CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p><a-v> :<C-u>vs <bar> CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p><a-t> :<C-u>tabe <bar> CocCommand snippets.editSnippets<CR>

" nnoremap <silent> <a-s><a-p>e :<C-u>CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p>s :<C-u>sp <bar> CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p>v :<C-u>vs <bar> CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p>t :<C-u>tabe <bar> CocCommand snippets.editSnippets<CR>

" CocCodeAction {{{1
"set equalprg=CocActionAsync('formatSelected')
"set equalprg=CocActionAsync('codeLensAction')
nnoremap \A :call CocActionAsync('codeLensAction')<cr>
nmap \aa <Plug>(coc-codeaction)
nmap \a  <Plug>(coc-codeaction-selected)
xmap \a  <Plug>(coc-codeaction-selected)

" CocWorkspace {{{1
command! -bar Rename :CocCommand workspace.renameCurrentFile
command! -bar Re     :CocCommand workspace.renameCurrentFile
command! -bar Mv     :CocCommand workspace.renameCurrentFile
command! -bar MV     :CocCommand workspace.renameCurrentFile

command! -bar -nargs=? CocDebug :CocCommand workspace.showOutput <args>

" CocSession {{{1
command! -bar -nargs=? LoadSession :exe (<q-args> ==# '')
      \ ? 'CocList session'
      \ : 'CocCommand session.load' <args>
command! -bar -nargs=? SaveSession :CocCommand session.save <args>

nnoremap <silent> <space>cs :<C-u>CocList    sessions<CR>
nnoremap <silent> <space>cS :<C-u>CocCommand session.save<CR>

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
nmap mA <Plug>(coc-bookmark-annotate)
" nmap mj <Plug>(coc-bookmark-next)
" nmap mk <Plug>(coc-bookmark-prev)
nmap md <Plug>(coc-bookmark-toggle)
" nmap mt <Plug>(coc-bookmark-toggle)

command! -bar Bookmarks :Coclist bookmark
nnoremap <silent> <space>cb :Coclist bookmark<cr>

"" CocExplorer {{{1
"command! Cexplorer CocCommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size

" CocGit {{{1
if exists('g:loaded_gitgutter')
  command! GchunkAdd  :CocCommand git.chunkStage
  command! GchunkUndo :CocCommand git.chunkUndo
  " Mnemonic: Git Put (similar to diff-put)
  nnoremap <space>gp :<c-u>GchunkAdd<cr>
  " Mnemonic: Git Omit (similar to diff-obtain)
  nnoremap <space>go :<c-u>GchunkUndo<cr>
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
  map <silent><expr> [c (&diff) ? '[c'
        \ : '<Plug>(coc-git-prevchunk):<c-u>sleep 5m<cr>zv'
        \ . (winline() > winheight('w$') / 2 ? 'zm5k' : '')
  map <silent><expr> ]c (&diff) ? ']c'
        \ : '<Plug>(coc-git-nextchunk):<c-u>sleep 5m<cr>zv'
        \ . (winline() > winheight('w$') / 2 ? 'zm5k' : '')

  " show chunk diff at current position
  nmap <space>gc <Plug>(coc-git-chunkinfo)
  omap ic <Plug>(coc-text-object-inner)
  xmap ic <Plug>(coc-text-object-inner)
  omap ac <Plug>(coc-text-object-outer)
  xmap ac <Plug>(coc-text-object-outer)
endif

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

" " CocYank; {{{1
" " Required?: closes mpreview vindow when completion is done.
" "au! CompleteDone * if pumvisible() == 0 | pclose | endif
" "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" function s:register_hist() abort
"   " Note: <c-o> is necessary to make (a)ppend work in Coclist yank.
"   norm! <c-o>
"   " TODO: select (a)ppend w/o actionmenu
"   CocList yank
" endfunction
" inoremap <c-x><c-y> <c-o>:call <SID>register_hist()<cr>
" inoremap <c-x>y     <c-o>:call <SID>register_hist()<cr>

" CocNot Yet Mapped {{{1
" repeat only coc's util.
"nmap <silent> . <Plug>(coc-command-repeat)
"<Plug>(coc-openlink)
"<Plug>(coc-codelens-action)
"
"<Plug>(coc-float-hide)
"<Plug>(coc-float-jump)
"
