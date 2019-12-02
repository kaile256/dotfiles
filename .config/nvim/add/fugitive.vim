" From: git.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

"command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete
"      \ Gw
"      \ :call fugitive#WriteCommand(<line1>, <count>, +<q-range>, <bang>0, <q-mods>, <q-args>, [<f-args>])
"      \ | wincmd p
"      \ | wincmd p

command! -nargs=+ -bar -complete=file Gremote :Git remote <args>

command! -nargs=+ -bar Gclone :Git clone <args>

" unstage all the other not to commit one unitentionally
" Note: practically, no such command as git-unstage
command! -nargs=? -bar -complete=customlist,fugitive#CommitComplete
      \ Gunstage
      \ :silent exe <args>0
      \ ? 'Git reset' <args>
      \ : 'Git reset HEAD'

command! -nargs=? -bar -complete=customlist,fugitive#EditComplete
      \ GaddSingle
      \ :Gunstage
      \ | Gw

command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete
      \ Gvdiffsplit
      \ :exe fugitive#Diffsplit(0, <bang>0, "vert <mods>", <q-args>, [<f-args>])
      \ :call s:Gdiff_keymaps()

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
  exe 'vert bot 35 Gstatus' args
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
let s:weed.bufname = ['.git\/', 'FZF$']
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

  if exists('a:1')
    let bufdict = a:1
  endif

  for bufnr in tabpagebuflist()
    if s:is_nobuffers(bufnr, a:0 > 0 ? a:1 : [])
      let winnr = bufwinnr(bufnr)
      exe winnr 'windo quit'
    endif
  endfor
  call win_gotoid(winID)
endfunction
command! WinReduce   :call s:winreduce()
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
  GaddSingle

  "" Note: 'wrap' causes gaps when text lengths are different each other
  "setl wrap
  "wincmd p
  "setl wrap
  "wincmd p

  call s:check_scrollable()
  call s:Gvstatus()
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
  " back to a buffer of status if there
  call win_gotoid(bufwinid('.git/index'))
endfunction

" Info; Blame {{{1
nnoremap <silent> <space>gb :<c-u>Gblame<cr>
" Info; Status {{{1
nnoremap <silent> <space>gs :<c-u>Gvstatus<cr>
" Add; {{{1
" Note: <c-w>p<c-w>p is necessary to update signcolumn
nnoremap <silent> <space>ga :<c-u>Gw <bar> Gvstatus<cr><c-w>p<c-w>p
nnoremap <silent> <space>gw :<c-u>GwWinpickVDiffStaging HEAD<cr>
" Command! GwWinpickVDiff {{{2
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete
      \ GwWinpickVDiff
      \ :Gw
      \ | HelpCloseAll
      \ | call s:winpick()
      \ | Gvdiffsplit! <args>
command! -bar -nargs=?
      \ GwWinpickVDiffStaging
      \ :Gw
      \ | HelpCloseAll
      \ | call s:winpick()
      \ | call s:Gvdiffw(<q-args>)

"}}}
nnoremap <silent> <space>go :<c-u>Gw <bar> only<cr>
nnoremap <silent> <space>gO :<c-u>GwOnlyVDiffStaging HEAD<cr>
" Command! GwOnlyVDiff {{{2
command! -bar -bang -nargs=? -complete=customlist,fugitive#EditComplete
      \ GwOnlyVDiff
      \ :Gw
      \ | only
      \ | Gvdiffsplit! <args>
command! -bar -nargs=?
      \ GwOnlyVDiffStaging
      \ :Gw
      \ | only
      \ | call s:Gvdiffw (<q-args>)
"}}}
" in new tab, if any unnecessary windows are there.
" TODO: set unstage; should trace <SNR> via :scriptnames.
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :execute <SNR>219_Do('Unstage',0)
"noremap <silent> <space>g<a-u> :Gunstage<cr>
" Diff; {{{1
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd :<c-u>GwWinpickVDiff<cr>
" Note: should be compared in current buffer
nnoremap <silent> <space>gD :<c-u>GwWinpickVDiff HEAD<cr>
