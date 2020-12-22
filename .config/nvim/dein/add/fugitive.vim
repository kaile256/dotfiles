" From: fugitive.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

" Note: :Gpush works asynchronous with 'tpope/vim-dispatch'
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#PushComplete
      \ Gush
      \ :exe '<mods> Git push' (<q-args> ==# '' ? 'origin HEAD': <q-args>)
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#PullComplete
      \ Gull
      \ :<mods> Git pull <args>

" FIXME
command! -bang -nargs=? -range=-1 -addr=tabs
      \ -complete=customlist,fugitive#GrepComplete
      \ Gfunctions
      \ :Glgrep --show-function --line-number <args>

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
