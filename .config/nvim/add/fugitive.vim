" From: git.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

command! -nargs=+ -complete=file Gremote :Git remote <args>

command! -nargs=+ Gclone :Git clone <args>

let s:std = {}
let s:std.buftypes = ['terminal', '']
let s:weed = {}
let s:weed.bufnames = ['.git\/']

" Functions: Pretreatment for Windows in Tab {{{1
function! s:is_nobuffers(bufnr) abort "{{{2
  let buftype = getbufvar(a:bufnr, '&buftype')
  let bufname = bufname(a:bufnr)
  return index(s:std.buftypes, buftype) < 0
        \ || bufname =~# join(s:weed.bufnames, '\|')
endfunction

function! s:winreduce(...) abort "{{{2
  let winID = bufwinid('%')

  if a:0 > 0
    let bufdict = [s:std, s:weed]
  endif

  for bufnr in tabpagebuflist()
    if s:is_nobuffers(bufnr)
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

command! -bang -bar -range=-1 -addr=tabs Gvstatus
      \ :call s:gvstatus(<q-args>)

" Functions: Fugitive {{{1
function! s:vdiffw(...) abort "{{{2
  " Keep to show diff w/ HEAD while editting commit-message.
  let obj = a:0 > 0 ? a:1 : ''

  exe 'Gvdiffsplit!' obj
  let s:with_diff     = 1
  let s:single_staged = 1

  "" Note: 'wrap' causes gaps when text lengths are different each other
  "setl wrap
  "wincmd p
  "setl wrap
  "wincmd p

  norm! L
  if winline() >= winheight('.')
    let s:scrollable = 1
  endif
  " Note: 'gg' makes user notice if any other changes in the buffer.
  norm! gg

  let s:gstatus_flag = 1
  call s:gvstatus()
endfunction

function! s:gvstatus(...) abort "{{{2
  let args = a:0 > 0 ? join(a:000) : ''
  exe 'vert bot 35 Gstatus' args
  setl winfixwidth
  wincmd =

  if !exists('s:gstatus_flag') | return | endif
  unlet s:gstatus_flag
  call s:additional()
endfunction

function! s:additional() abort "{{{2
  if exists('s:single_staged')
    unlet s:single_staged
    " unstage all the other not to commit unitentional diff
    norm U
    wincmd p
    :Gw
  endif

  if !exists('s:with_diff') | return | endif
  unlet s:with_diff

  if exists('s:scrollable')
    unlet s:scrollable
    norm! ]c
  else
    " back to a buffer of status
    Gstatus
  endif
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
      \ | call s:winpick()
      \ | Gvdiffsplit! <args>
command! -bar -nargs=?
      \ GwWinpickVDiffStaging
      \ :Gw
      \ | call s:winpick()
      \ | call s:vdiffw(<q-args>)
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
      \ | call s:vdiffw (<q-args>)
"}}}
" in new tab, if any unnecessary windows are there.
" TODO: set unstage; should trace <SNR> via :scriptnames.
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :execute <SNR>219_Do('Unstage',0)
"noremap <silent> <space>g<a-u> :Gunstage<cr>
" Diff; {{{1
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd :<c-u>GwinpickVDiff<cr>
" Note: should be compared in current buffer
nnoremap <silent> <space>gD :<c-u>GwWinpickVDiff HEAD<cr>
