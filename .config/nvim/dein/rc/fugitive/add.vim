" From: fugitive.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

command! -bar -bang -nargs=* -range=-1 -addr=other
      \ -complete=customlist,fugitive#ReadComplete
      \ Gv
      \ exe <count> <mods> 'Gvsplit<bang>' <q-args>

" Note: :Gpush works asynchronous with 'tpope/vim-dispatch'
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#PushComplete
      \ Gush
      \ :exe '<mods> Git push' (<q-args> ==# '' ? 'origin HEAD': <q-args>)
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#PullComplete
      \ Gull
      \ :<mods> Git pull <args>

" Mappings {{{1
nnoremap <space>gu <Cmd>silent G reset HEAD %<CR>
nnoremap <space>gU <Cmd>silent G reset HEAD<CR>

nnoremap <space>grf <Cmd>Git fetch --all<CR>
nnoremap <space>grF <Cmd>Git fetch --unshallow<CR>

nnoremap <space>grp <Cmd>Git pull<CR>
nnoremap <space>grP <Cmd>Git push<CR>

nnoremap <SID>(copy-to-remote-branch) <Cmd>exe 'Git push -u origin' FugitiveHead()<CR>
nmap <space>grU <SID>(copy-to-remote-branch)

function! s:Gvstatus() abort
  vert bot Gstatus
  if bufwinnr('\.git/index') == -1 | return | endif

  vert resize 70
  setl winfixwidth
  let Go_to_Staged_section = 'norm gs'
  exe Go_to_Staged_section
  norm! zz
endfunction
nnoremap <space>gs <Cmd>call <SID>Gvstatus()<CR>
nnoremap <space>gS <Cmd>tab Gstatus<CR>

function! s:is_nothing_staged() abort
  let git_root = shellescape(FindRootDirectory() .'/.git')
  let git_diff_cached = system('git --git-dir='. git_root .' diff --cached')
  let is_nothing_staged = len(git_diff_cached) == 0
  return is_nothing_staged
endfunction
function! s:CommitAtBottom(...) abort
  let opts = join(a:000)
  const is_amending = opts =~# '--amend\>'

  if !is_amending && s:is_nothing_staged()
    echo '[fugitive] nothing staged yet'
    return
  elseif is_amending && opts =~# '--no-edit\>'
        \ && input('[fugitive] Amend the staged changes? y[es]/n[o] ')
        \         !~# 'y\%[es]'
    echo "\nabort"
    return
  endif

  exe 'Git commit' opts
  wincmd J
  resize 25
endfunction
nnoremap <SID>(git-commit-edit)   <Cmd>call <SID>CommitAtBottom()<CR>
nnoremap <SID>(git-commit-amend)  <Cmd>call <SID>CommitAtBottom('--amend')<CR>
nnoremap <SID>(git-commit-squash) <Cmd>call <SID>CommitAtBottom('--amend --no-edit')<CR>

nmap <space>gcc <SID>(git-commit-edit)
nmap <space>gca <SID>(git-commit-amend)
nmap <space>gce <SID>(git-commit-squash)

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

augroup myFugitiveAdd-OverrideGitCommands "{{{1
  au BufWinEnter */gclasp**/* call s:gclasp_mappings()
augroup END
function! s:gclasp_mappings() abort
  command! -buffer -bar -nargs=* G   :!gclasp <args>
  command! -buffer -bar -nargs=* Git :!gclasp <args>

  command! -buffer -bar -nargs=* Gull :!gclasp pull <args>
  command! -buffer -bar -nargs=* Gush :!gclasp push <args>
endfunction
