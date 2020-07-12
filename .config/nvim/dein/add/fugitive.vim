" From: fugitive.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

runtime add/fugitive.gf.vim

" auto substitute url for ssh to github
command! -bar -nargs=1
      \ GsetUrlToOrigin
      \ :exe 'Git remote set-url origin' substitute(<q-args>,
      \   '\(^\|https://github.com/\)\([^/]\+/[^/]\+\).*',
      \   'github:\2.git', '')

" Note: :Gpush works asynchronous with 'tpope/vim-dispatch'
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#PushComplete
      \ Gush
      \ :exe <q-mods> 'Git push' (<q-args> ==# '' ? 'origin HEAD': <q-args>)

command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#PullComplete
      \ Gull
      \ :<mods> Git pull <args>

" FIXME
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#GrepComplete
      \ Gfunctions
      \ :Glgrep --show-function --line-number <args>

" Note: practically, no such command as git-unstage
" TODO: make it work to unstage all the other not to commit one unitentionally
command! -nargs=? -bar -complete=customlist,fugitive#CommitComplete
      \ Gunstage
      \ :silent Git reset HEAD <args>

command! -bar -nargs=* GcommitBottom :bot 20 Git commit <args>

" Note: `:Gw --only` just stages a file named '--only'.
command! -nargs=? -bar -complete=customlist,fugitive#EditComplete
      \ GwOnly
      \ :Gunstage | Gw

" Note: -range=-1 is correct; either no -complete
" Ref: tpope/vim-fugitive/plugin/fugitive.vim @368
command! -bang -bar -range=-1 -addr=tabs
      \ Gvstatus
      \ :call s:Gvstatus(<q-args>)

function! s:Gdiff_keymaps() abort "{{{1
  if !&diff | return | endif
  " U works like coc-gitchunk-undo, by :diffget
  nnoremap U do
endfunction

function! s:Gvstatus(...) abort "{{{1
  let args = a:0 > 0 ? join(a:000) : ''
  " Note: cannot use :Gvstatus itself, of course
  exe 'vert bot 45 Gstatus' args
  if bufwinnr('\.git/index') == -1 | return | endif

  if has('nvim')
    call nvim_win_set_width(0, 45)
  endif
  setl winfixwidth
  wincmd =
  " go to Staged section
  norm gs
  norm! zz
  wincmd p
  wincmd p
endfunction

" Functions: Pretreatment for Windows in Tab {{{1
let s:std = {}
let s:std.buftype = ['terminal', '', 'help']
let s:weed = {}
" WARNING: for the case to compare only commits, keep such functions private,
"          which close all '.git/' or 'fugitive://'
let s:weed.bufname = ['\.git\/', 'FZF$']
"let s:weed.filetype = ['fzf']

function! s:is_nobuffers(bufnr, ...) abort "{{{2
  let buftype = getbufvar(a:bufnr, '&buftype')
  let bufname = bufname(a:bufnr)
  return index(s:std.buftype, buftype) < 0
        \ || bufname =~# join(s:weed.bufname, '\|')
endfunction

"function! s:is_nobuffers(bufnr, ...) abort "{{{2
"  let bufname = bufname(a:bufnr)
"  for l:key in keys(s:std)
"    if l:key ==? 'bufname' | break | endif
"    let l:key = getbufvar(a:bufnr, '&'. l:key)
"  endfor
"
"  let std  = {}
"  let weed = {}
"
"  for l:key in keys(s:std)
"    if l:key ==? 'bufname' | break | endif
"    let std[l:key]  = a:0 > 0 ? a:1 : s:std[l:key]
"    let is_weed .= '&& '. index(std.filetype, l:key) > 0
"  endfor
"  for l:key in keys(s:weed)
"    if l:key ==? 'bufname' | break | endif
"    let weed[l:key] = a:0 > 0 ? a:1 : s:weed[l:key]
"    let is_weed .= '&& '. index(weed.filetype, l:key) < 0
"  endfor
"
"  let is_weed .=
"        \ '&&'. bufname =~# join(weed.bufname, '\|')
"        \ && bufname !~# join(std.bufname, '\|')
"
"  return is_weed
"endfunction

function! s:winreduce(...) abort "{{{2
  let winID = bufwinid('%')

  if a:0 > 0
    let bufdict = a:1
  endif

  for bufnr in tabpagebuflist()
    if s:is_nobuffers(bufnr, a:0 > 0 ? a:1 : [])
      let winnr = bufwinnr(bufnr)
      exe winnr 'windo close'
    endif
  endfor
  call win_gotoid(winID)

  wincmd =
endfunction
command! WinReduce :call s:winreduce()
nnoremap <silent> <a-space><a-space> :<c-u>WinReduce<cr>
nnoremap <silent> <a-space><space>   :<c-u>WinReduce<cr>

function! s:winpick() abort "{{{2
  call s:winreduce()
  silent! wincmd T
  call s:winsave()
endfunction

function! s:winsave() abort "{{{2
  let t:my_fugitive_save_winid = bufwinid('%')
endfunction

" Functions: Fugitive {{{1
function! s:Gvdiffw(...) abort "{{{2
  " Keep to show diff w/ HEAD while editting commit-message.
  let obj = a:0 > 0 ? a:1 : ''

  exe 'Gvdiffsplit!' obj
  GwOnly

  "" Note: 'wrap' causes gaps when text lengths are different each other
  "setl wrap
  "wincmd p
  "setl wrap
  "wincmd p

  call s:check_scrollable()
  call s:additional()
endfunction

function! s:check_scrollable() abort "{{{2
  norm! G
  if line('w0') != 1
    let b:is_scrollable = 1
  endif
  " Note: 'gg' makes user notice if any other changes in the buffer.
  norm! gg
endfunction

function! s:additional() abort "{{{2
  if !&diff | return | endif
  if exists('b:is_scrollable')
    unlet b:is_scrollable
    norm! ]c
    return
  endif
endfunction

" Blame {{{1
nnoremap <silent> <space>gb :<c-u>Gblame<cr>

" Status {{{1
nnoremap <silent> <space>gs :<c-u>Gvstatus<cr>
nnoremap <silent> <space>gS :<c-u>tab Gstatus<cr>

" Staging {{{1
nnoremap <silent> <space>gu :<C-u>Gunstage % <CR>
nnoremap <silent> <space>gU :<C-u>Gunstage <bar> echo 'Reset all'<CR>

nnoremap <silent> <space>ga :<C-u>Gw<CR>
nnoremap <silent> <space>gA :<C-u>Gw <bar> GcommitBottom <CR>

nnoremap <silent> <space>gw :<c-u>Gw <bar> GwdiffOnly HEAD<cr>

command! -bar -nargs=* GwdiffOnly
      \ :HelpCloseAll
      \ | call s:winpick()
      \ | call s:Gvdiffw(<q-args>)

" Add to Diff {{{2
nnoremap <silent> <space>go :<c-u>silent Gw <bar> only<cr>
nnoremap <silent> <space>gO :<c-u>GwToDiff HEAD<cr>

command! -bar -nargs=*
      \ GwToDiff
      \ :silent Gw
      \ | only
      \ | call s:Gvdiffw (<q-args>)

" Diff {{{1
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd :<c-u>GdiffOnly<cr>
" Note: should be compared in current buffer
nnoremap <silent> <space>gD :<c-u>GwdiffOnly HEAD<cr>

command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete
      \ GdiffOnly
      \ :HelpCloseAll
      \ | call s:winpick()
      \ | Gvdiffsplit! <args>

" Commit {{{1
nnoremap <silent> <space>gC :<c-u>GcommitBottom<cr>

" Note: <space>cc/ca would be used to distinguish whether register should be
" '_' or 'unnamed'.
function! s:is_nothing_staged() abort
  let git_root = shellescape(FindRootDirectory()) .'/.git'
  let git_diff_cached = system('git --git-dir='. git_root .' diff --cached')
  let is_nothing_staged = len(git_diff_cached) == 0
  return is_nothing_staged
endfunction
nnoremap <silent><expr> <space>gcc
      \ <SID>is_nothing_staged()
      \ ? ':<C-u> echo "[fugitive] nothing staged" <CR>'
      \ : ':<C-u> GcommitBottom <CR>'
nnoremap <silent> <space>gca :<c-u>GcommitBottom --amend<cr>
nnoremap <silent><expr> <space>gce
      \ input('Amend the staged changes? y[es]/n[o] ') =~# 'y\%[es]'
      \ ? ':<C-u> GcommitBottom --amend --no-edit<CR>'
      \ : ':<C-u> echo "abort commit"<CR>'
