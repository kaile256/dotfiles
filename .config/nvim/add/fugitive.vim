" From: git.toml
" Repo: tpope/vim-fugitive
" Another: source/fugitive.vim

command! -nargs=+ -complete=file Gremote :Git remote <args>

command! -nargs=+ Gclone :Git clone <args>

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
command! -bang -bar -range=-1 -addr=tabs Gvstatus :vert bot 35 Gstatus <args> | setl winfixwidth

function! s:diff_mode() abort "{{
  " Keep to show diff w/ HEAD while editting commit-message.
  Gvdiffsplit! HEAD
  " For: makes user notice if any other changes in the buffer.
  norm gg
  Gvstatus
  setl winfixwidth
  wincmd =
endfunction "}}}
command! Gstage
      \ :Gw | WindowPKpick | call s:diff_mode()
command! Gsolo
      \ :Gw | WindowPKonly | call s:diff_mode()
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete Glive
      \ :Gw | WindowPKpick | Gvdiffsplit! HEAD
" in new tab, if any unnecessary windows are there.
" TODO: set unstage; should trace <SNR> via :scriptnames.
" &@:<C-U>execute <SNR>277_Do('Unstage',0)<CR>
" &@:exe <SNR>277_EchoExec('reset', '-q')<CR>
"command! Gunstage :execute <SNR>219_Do('Unstage',0)
"noremap <silent> <space>g<a-u> :Gunstage<cr>
command! -bar -bang -nargs=* -complete=customlist,fugitive#EditComplete GvdiffMode
      \ WindowPKpick
      \ | Gvdiffsplit! <args>
"}}}

" Info; Blame {{{1
nnoremap <silent> <space>gb     :<c-u>Gblame<cr>
" Info; Status {{{1
nnoremap <silent> <space>gs     :<c-u>vert bot 35 Gstatus<cr>
" Add; Only {{{1
nnoremap <silent> <space>ga     :<c-u>Gw<cr>
" Add; w/ diff && status {{{1
nnoremap <silent> <space>gw     :<c-u>Gstage<cr>
nnoremap <silent> <space>go     :<c-u>Gsolo<cr>
nnoremap <silent> <space>gW     :<c-u>Gw <bar> GvdiffMode HEAD<cr>
" Diff; {{{1
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
nnoremap <silent> <space>gd     :<c-u>GvdiffMode<cr>
