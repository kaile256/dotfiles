" From: git.toml
" Repo: tpope/vim-fugitive

command! -nargs=+ -complete=file Gremote :Git remote <q-args>

command! -nargs=+ Gclone :Git clone <q-args>

" Dependent commands {{{
" Note: no use yet.
"command! -nargs=* -complete=dir HubCreate call <SID>hub_create(<f-args>)
function! s:hub_create(path, ...) abort "{{{
  " TODO: distinguish flag and path
  if a:path ==# '.'
    FindRoot
    let l:dir_path = execute('pwd')
    "elseif system('-f'. a:path)
    "  let l:dir_path = a:path:p:h
  endif
  !hub create a:000 l:dir_path
endfunction "}}}

function! fugitive#commit_with_diff() abort "{{2 "{{{
  WindowPickOne
  " Keep to show diff w/ HEAD while editting commit-message.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  vert bot 35 Gstatus
  setl winfixwidth
  wincmd =
endfunction "}}}2
command! Gstage
      \ :Gw | call fugitive#commit_with_diff()
" in new tab, if any unnecessary windows are there.
" TODO: set unstage; should trace <SNR> via :scriptnames.
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :execute <SNR>219_Do('Unstage',0)
"noremap <silent> <space>g<a-u> :Gunstage<cr>
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete GvdiffMode
      \ WindowPickOne
      \ | Gvdiffsplit! <args>
"}}}

" Info; Blame {{{
nnoremap <silent> <space>gb     :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
nnoremap <silent> <space>gs     :<c-u>vert bot 35 Gstatus<cr>
"}}}
" Add; Only {{{
nnoremap <silent> <space>ga     :<c-u>Gw <bar> vert bot 35 Gstatus<cr>
"}}}
" Add; && Commit w/ diff {{{1
nnoremap <silent> <space>gw     :<c-u>Gstage<cr>
"}}}
" Diff; {{{
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd     :<c-u>GvdiffMode<cr>
"}}}
