" From: git.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

command! -nargs=+ -complete=file Gremote :Git remote <args>

command! -nargs=+ Gclone :Git clone <args>

let s:stdBuftypes = ['terminal', '']
let s:weedBufnames = ['.git\/']
function! s:nobuffers(bufnr) abort "{{{1
  let buftype = getbufvar(a:bufnr, '&buftype')
  let bufname = bufname(a:bufnr)
  return index(s:stdBuftypes, buftype) < 0
        \ || bufname =~# join(s:weedBufnames, '\|')
endfunction

function! s:winreduce() abort "{{{1
  for bufnr in tabpagebuflist()
    if s:nobuffers(bufnr)
      let winnr = bufwinnr(bufnr)
      exe winnr 'windo quit'
    endif
  endfor
endfunction
nnoremap <silent> <a-space><a-space> :<c-u>call <SID>winreduce()<cr>
nnoremap <silent> <a-space><space>   :<c-u>call <SID>winreduce()<cr>

function! s:winpick() abort "{{{1
  call s:winreduce()
  silent! wincmd T
endfunction

command! -bang -bar -range=-1 -addr=tabs Gvstatus
      \ :vert bot 35 Gstatus <args>
      \ | setl winfixwidth

function! s:staging_HEAD_diff() abort "{{{1
  " Keep to show diff w/ HEAD while editting commit-message.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  Gvstatus
  setl winfixwidth
  wincmd =
endfunction

" command! Gw- {{{1
command! GwStage
      \ :Gw | call s:winpick() | call s:staging_HEAD_diff()
command! GwOnlyDiffStage
      \ :Gw | only | call s:staging_HEAD_diff()
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete GwOnlyDiff
      \ :Gw | only | Gvdiffsplit! HEAD
" in new tab, if any unnecessary windows are there.
" TODO: set unstage; should trace <SNR> via :scriptnames.
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :execute <SNR>219_Do('Unstage',0)
"noremap <silent> <space>g<a-u> :Gunstage<cr>
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete GwinpickVDiff
      \ :call s:winpick()
      \ | Gvdiffsplit! <args>
" Info; Blame {{{1
nnoremap <silent> <space>gb :<c-u>Gblame<cr>
" Info; Status {{{1
nnoremap <silent> <space>gs :<c-u>vert bot 35 Gstatus<cr>
" Add; Only {{{1
nnoremap <silent> <space>ga :<c-u>Gw<cr>
" Add; w/ diff && status {{{1
nnoremap <silent> <space>gw :<c-u>GwStage<cr>
nnoremap <silent> <space>go :<c-u>GwOnlyDiffStage<cr>
nnoremap <silent> <space>gW :<c-u>Gw <bar> GwinpickVDiff HEAD<cr>
" Diff; {{{1
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd :<c-u>GwinpickVDiff<cr>
