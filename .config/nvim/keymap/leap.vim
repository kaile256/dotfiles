scriptencoding utf-8
" From: init.vim

" TODO: make it work anywhere
nnoremap <silent> gX :call <SID>xdg_open()<cr>
function! s:xdg_open() abort "{{{1
  exe 'silent !xdg-open' matchstr(get(b:, 'term_title', getcwd()), '/\S\+') . '/<cfile> &'
endfunction

"" Buffers; {{{1
"nnoremap <c-p> <Cmd>bprev<cr>
"nnoremap <c-n> <Cmd>bnext<cr>

"" n/N for Search {{{1
" researched word will come up at middle of current window.
"nnoremap n nzz
"nnoremap N Nzz

" Jump; via Tags {{{1
" Note: g<c-]> jumps via ctags,
"       or if <cword> links more than two tags, shows a list of tags.
noremap <c-]> g<c-]>zz
" Note: stjump means split-tag-jump.
noremap <silent> g<c-]> :<c-u>vert stjump <c-r><c-w><CR>zz

" Tags; to Newest
" :silent! to supress 'E556: at top of tag stack'
nnoremap <silent> <c-q> :silent! $tag<cr>

" to Definition on &path {{{1
" if a number follows filename/path, jump to the linenumber on the buffer:
"     init.vim:10
"     init.vim @ 20
"     init.vim (30)
"     /init.vim 40
nnoremap <silent> gf gF
xnoremap <silent> gf gF
" in horizontal
nnoremap <silent> <c-w>f <c-w>F
xnoremap <silent> <c-w>f <c-w>F

" Note: sfind denys range and to follow number.
nnoremap <silent> <c-w><space>f :<c-u>vert wincmd F<cr>
" Note: :vert forbids any range, keep using <Cmd>.
xnoremap <silent> <c-w><space>f <Cmd>vert wincmd F<cr>

" in new tab
"nnoremap <silent> <c-w>F <c-w>gF
xnoremap <silent> <c-w>F <c-w>gF
nnoremap <silent> gF     <c-w>gF
xnoremap <silent> gF     <c-w>gF

augroup findAlter
  au!
  au BufWinEnter **/.config/nvim/**/* call s:find_alter()
augroup END

function! s:find_alter() abort "{{{1
  let s:alter = expand('#:t')
  if !search(s:alter, 'cWn') | return | endif

  call search(s:alter, 'cW')
  norm! zv
  let @/ = s:alter
  au! findAlter BufLeave * if exists('s:alter') | call s:hist_remove(s:alter) | endif
endfunction

function! s:hist_remove(word) abort "{{{1
  if !search(a:word, 'cWn') && histget('/') ==# a:word
    call histdel('/', -1)
    let @/ = histget('/', -1)
    unlet s:alter
  endif
endfunction

" Switch; Pane {{{1
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" avoid a stack on command-line
cnoremap <a-k> <c-c>

" Switch; Tab Page {{{1
"" Move between Tabs
nnoremap <c-h> gT
nnoremap <c-l> gt
nnoremap <a-]> gt
nnoremap <a-[> gT
inoremap <a-[> <esc>gT
inoremap <a-]> <esc>gt
tnoremap <a-]> <c-\><c-n>gt
tnoremap <a-[> <c-\><c-n>gT

