" From: lsp.toml
" Repo: neoclide/coc.nvim
" Branch: neoclide/coc.nvim_release
" XDG: $COC_DATA_HOME/extensions/node_modules/
" Json: coc-settings.json
" Another: source/coc.vim

augroup myCoc-Keywordprg
  let &g:keywordprg = ':silent! call CocActionAsync("showSignatureHelp") | silent! call CocActionAsync("doHover")'
  au BufWinEnter coc-settings.json setlocal keywordprg=:help
augroup END

function! s:CommandList(...) abort
  let list = coc#rpc#request('CommandList', a:000)
  return join(list, "\n")
endfunction
command! -nargs=* -complete=custom,s:CommandList -range Coc :CocCommand

function! s:jump_to_window()
  function! s:should_goto_float() abort
    const winid = win_getid()
    const float_ids = coc#float#get_float_win_list()
    if len(float_ids) == 0
      return 0
    endif

    const is_in_float = index(float_ids, winid) >= 0
    return !is_in_float
  endfunction

  if s:should_goto_float()
    let s:save_winid = win_getid()
    return "\<Plug>(coc-float-jump)"
  endif

  if exists('s:save_winid')
    const GetBack = printf(":\<C-u>call win_gotoid(%s)\<CR>", s:save_winid)
    unlet s:save_winid
    return GetBack
  endif

  return "\<C-w>w"
endfunction
nmap <silent><expr> <C-w>w     <SID>jump_to_window()
nmap <silent><expr> <C-w><C-w> <SID>jump_to_window()

" Mnemonic: Eliminate floating/popup windows
nnoremap <expr> <C-w>e     coc#float#close_all()
nnoremap <expr> <C-w><C-e> coc#float#close_all()

nnoremap <silent> <space>cx :<C-u>CocList extensions<cr>
"command! -nargs=+ Csearch :CocSearch <f-args>
"command! -nargs=+ Cgrep :CocList grep -regex <f-args>

" Completion {{{1
inoremap <silent><expr> <C-n>
      \ pumvisible() ? "\<C-n>" : coc#refresh()
inoremap <silent><expr> <C-p>
      \ pumvisible() ? "\<C-p>" : coc#refresh()

" Diagnostic {{{1
" Note: Unnecessary? pop up auto.
nmap <silent> gX <Plug>(coc-diagnostic-info)
noremap <silent> <SID>(zv) :<C-u>sleep 5m<CR>zv

if !dein#tap('ale')
  if dein#tap('repmo-vim')
    map <expr> [x repmo#Key('<Plug>(coc-diagnostic-prev)', '<Plug>(coc-diagnostic-next)') .'<SID>(zv)'
    map <expr> ]x repmo#Key('<Plug>(coc-diagnostic-next)', '<Plug>(coc-diagnostic-prev)') .'<SID>(zv)'
  else
    map ]x <Plug>(coc-diagnostic-next)
    map [x <Plug>(coc-diagnostic-prev)
  endif
endif

nmap \x         <Plug>(coc-fix-current)
imap <C-x>x     <C-o><Plug>(coc-fix-current)
imap <C-x><C-x> <C-o><Plug>(coc-fix-current)

"nmap [e <Plug>(coc-diagnostic-prev-error)
"nmap ]e <Plug>(coc-diagnostic-next-error)

" Refactor {{{1

" Mnemonic: Change the Structure.
nmap cS <Plug>(coc-refactor)

" Format {{{1
command! Import :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Note: coc-prettier's editorconfig ability seems useless
"       when prettier is unavailable on the filetype.
"command! FormatOnC :call CocAction('format')
"command! -nargs=? FoldOnC :call CocAction('fold', <f-args>)

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

" Mnemonic: Change the name in Sync
nmap cs <Plug>(coc-rename)
nmap <silent> == :<c-u>QuickFormat<cr>

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

" Text-Object {{{1
" Mnemonic: Respects ]m/[m
xmap im <Plug>(coc-funcobj-i)
omap im <Plug>(coc-funcobj-i)
xmap am <Plug>(coc-funcobj-a)
omap am <Plug>(coc-funcobj-a)

" for class/struct/interface
xmap iM <Plug>(coc-classobj-i)
omap iM <Plug>(coc-classobj-i)
xmap aM <Plug>(coc-classobj-a)
omap aM <Plug>(coc-classobj-a)

" Snippets {{{1
" Note: Regex is interpreted by JavaScript while UltiSnips does in Python.
" Help: $COC_DATA_HOME/extensions/node_modules/coc-snippets
" Note: it works without ultisnips itself.

augroup myCocSnippets
  au BufWritePost *.snippets call coc#refresh()
augroup END

" xmap <c-\> <Plug>(coc-snippets-select)
" imap <c-\> <Plug>(coc-snippets-expand-jump)
" smap <expr> <C-\> coc#expandableOrJumpable()
"       \ ? '<Plug>(coc-snippets-expand-jump)'
"       \ : (coc#rpc#request('snippetNext', []) ? '' : '')

" " Note: slower than UltiSnips' command, `:UltiSnipsEdit`.
" nnoremap <silent> <a-s><a-p><a-e> :<C-u>CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p><a-s> :<C-u>sp <bar> CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p><a-v> :<C-u>vs <bar> CocCommand snippets.editSnippets<CR>
" nnoremap <silent> <a-s><a-p><a-t> :<C-u>tabe <bar> CocCommand snippets.editSnippets<CR>

" " CodeAction {{{1
" "set equalprg=CocActionAsync('formatSelected')
" "set equalprg=CocActionAsync('codeLensAction')
" nnoremap \A :call CocActionAsync('codeLensAction')<cr>
nmap \aa <Plug>(coc-codeaction)
nmap \a  <Plug>(coc-codeaction-selected)
xmap \a  <Plug>(coc-codeaction-selected)

" Workspace {{{1
" nnoremap <silent> <space>cr :<C-u>CocCommand workspace.renameCurrentFile<CR>

command! -bar -nargs=? CocDebug :CocCommand workspace.showOutput <args>

" Session {{{1
command! -bar -nargs=? LoadSession :exe (<q-args> ==# '')
      \ ? 'CocList session'
      \ : 'CocCommand session.load' <args>
command! -bar -nargs=? SaveSession :CocCommand session.save <args>

nnoremap <silent> <space>cs :<C-u>CocList    sessions<CR>
nnoremap <silent> <space>cS :<C-u>CocCommand session.save<CR>

" Range, or Multiple Cursor {{{1
hi CocCursorRange guibg=#79976a guifg=#e7c56c
" Mnemonic: Mark X
nmap mx <Plug>(coc-cursors-position)
xmap mx <Plug>(coc-cursors-range)
nmap \m <Plug>(coc-cursors-operator)

" Mnemonic: Macro of Cursor
"nmap <silent> qc <Plug>(coc-cursors-operator)
"xmap <silent> qc <Plug>(coc-cursors-range)
"nnoremap <silent> cq CocCommand document.renameCurrentWord<cr>
""nmap <silent> <c-j> <Plug>(coc-range-select)
""nmap <silent> <c-k> <Plug>(coc-range-select-backward)
""nmap <silent> * <Plug>(coc-cursors-word)
""nmap <silent> n <Plug>(coc-cursors-position)

" Search {{{1
nnoremap <silent> <space>G :<C-u>CocSearch
      \ --word-regexp
      \ --follow
      \ --smart-case
      \ --fixed-strings
      \ <C-r>=expand('<cword>')<CR><CR>
xnoremap <silent> <space>G :<C-u>CocSearch
      \ --follow
      \ --smart-case
      \ --fixed-strings
      \ <C-r>=substitute(getline('.')[col("'<") - 1 : col("'>") - 1],
      \                  '\zs\s\+', '\\1', 'g')<CR><CR>

" Color {{{1
command! -bar ColorReformat    :call CocAction('colorPresentation')
command! -bar ColorShowPalette :call CocAction('pickColor')
nnoremap <space>cp :ColorShowPalette<cr>

" List {{{1
" show commit contains current position
nnoremap <silent> <space>cl :CocList<cr>
" nnoremap <silent> <space>cf :CocList files<cr>
" nnoremap <silent> <space>cb :CocList buffers<cr>
nnoremap <silent> <space>cx :CocList extensions<cr>

" " Bookmark {{{1
" " nmap ma <Plug>(coc-bookmark-annotate)
" nmap mm <Plug>(coc-bookmark-toggle)
" nmap ]b <Plug>(coc-bookmark-next)
" nmap [b <Plug>(coc-bookmark-prev)
"
" command! -bar Bookmarks :Coclist bookmark
" nnoremap <silent> <space>cb :Coclist bookmark<cr>
"
"" Explorer {{{1
"command! Cexplorer CocCommand explorer
"      \ --toggle
"      \ --width=35
"      \ --sources=buffer+,file+
"      \ --file-columns=icon,git,selection,clip,indent,filename,size

" Git {{{1
" " Slower than cohama/agit.vim
" nnoremap <silent> <space>cg :<C-u>CocList --normal --auto-preview --tab bcommits<CR>
" nnoremap <silent> <space>cG :<C-u>CocList --normal --auto-preview --tab commits<CR>

nnoremap <silent> <space>gm :<C-u>CocCommand git.showCommit<CR>

function! s:goto_chunk(direction) abort
  let conflict_marker = '^[=><]\{7} '
  let is_conflicted = search(conflict_marker, 'cnw')
  if &diff
    let next = ']c'
    let prev = '[c'
  elseif is_conflicted
    let next = "\<Plug>(coc-git-nextconflict)"
    let prev = "\<Plug>(coc-git-prevconflict)"
  else
    if dein#tap('vim-gitgutter')
      " Coc's next/prev chunk doesn't notice indexed chunks; thus, their
      " motions are different from those expected by signcolumn.
      let next = "\<Plug>(GitGutterNextHunk)"
      let prev = "\<Plug>(GitGutterPrevHunk)"
    else
      let next = "\<Plug>(coc-git-nextchunk)"
      let prev = "\<Plug>(coc-git-prevchunk)"
    endif
  endif

  let forward  = a:direction ==# 'next' ? next : prev
  let backward = a:direction ==# 'next' ? prev : next

  if dein#tap('repmo-vim')
    return repmo#Key(forward, backward)
  endif
  return forward
endfunction
nmap <expr> [c <SID>goto_chunk('prev')
nmap <expr> ]c <SID>goto_chunk('next')
xmap <expr> [c <SID>goto_chunk('prev')
xmap <expr> ]c <SID>goto_chunk('next')

" Note: Use gitgutter instead which has less delay.
" command! GchunkAdd  :CocCommand git.chunkStage
" command! GchunkUndo :CocCommand git.chunkUndo
" " Mnemonic: Git Put (similar to diff-put)
" nnoremap <space>gp :<c-u>GchunkAdd<cr>
" " Mnemonic: Git Omit (similar to diff-obtain)
" nnoremap <space>go :<c-u>GchunkUndo<cr>
" " TODO: for-loop in range because no range available yet.
" xmap <space>ga <Plug>(coc-git-add-chunk)
" " Note: :Gstatus within one command/keymap doesn't work.
" xnoremap <silent> <Plug>(coc-git-add-chunk)
"      \ :call coc#git_add_chunks()<cr>

" function coc#git_add_chunks() abort
"   let save_view = winsaveview()
"   norm '<
"   while line('.') <= line("'>")
"     silent! CocCommand git.chunkStage
"     norm! j
"     let c_line += 1
"   endwhile
"   " Note: only to scroll down a fugitive-buffer.
"   "Gstatus
"   "call feedkeys(":call winrestview(save_view)\<cr>", 'n')
"   call winrestview(save_view)
" endfunction

" nnoremap U :CocCommand git.chunkUndo<cr>

" command! -nargs=? Gfold :CocCommand git.foldUnchanged
" function! coc#git_fold_toggle() abort
"   if &l:fdm !=# 'manual'
"     let b:coc#_save_fdm = &l:fdm
"     Ccommand git.foldUnchanged
"   elseif exists('b:fdm')
"     exe 'set fdm='. b:coc#_save_fdm
"   else
"     set fdm=syntax
"   endif
" endfunction

" " Similar to the navigation on &diff
" map <silent><expr> [c (&diff) ? '[c'
"      \ : '<Plug>(coc-git-prevchunk):<c-u>sleep 5m<cr>zv'
"      \ . (winline() > winheight('w$') / 2 ? 'zm5k' : '')
" map <silent><expr> ]c (&diff) ? ']c'
"      \ : '<Plug>(coc-git-nextchunk):<c-u>sleep 5m<cr>zv'
"      \ . (winline() > winheight('w$') / 2 ? 'zm5k' : '')

" " show chunk diff at current position
" nmap <space>gc <Plug>(coc-git-chunkinfo)
" omap ic <Plug>(coc-text-object-inner)
" xmap ic <Plug>(coc-text-object-inner)
" omap ac <Plug>(coc-text-object-outer)
" xmap ac <Plug>(coc-text-object-outer)

" " Yank {{{1
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

" Not Yet Mapped {{{1
" repeat only coc's util.
"nmap <silent> . <Plug>(coc-command-repeat)
"<Plug>(coc-openlink)
"<Plug>(coc-codelens-action)
"
"<Plug>(coc-float-hide)
"<Plug>(coc-float-jump)
"
