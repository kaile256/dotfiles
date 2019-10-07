" From: nvim/init.vim

if execute('map <c-w>q') !=# '' || execute('map <c-w><c-q>') !=# ''
  noremap <c-w>q <Nop>
  noremap <c-w><c-q> <Nop>
endif

nnoremap <c-w>Q :<c-u>q! <cr>
nnoremap <c-w>Z :<c-u>qa  <cr>

nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

nnoremap <silent> <c-w>C :<c-u>tabclose<cr>
nnoremap <silent> <c-w>O :<c-u>tabonly<cr>
nnoremap <c-w><c-t> <c-w>v<c-w>T
nnoremap <c-w><a-t> <c-w>v<c-w>T

" Redraw; No Highlight
inoremap <silent> <c-l>              <Cmd>noh<cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh      <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh      <cr><c-l>
nnoremap <silent> <a-space><space>   :QuickClose<cr>
nnoremap <silent> <a-space><a-space> :QuickClose<cr>
command! QuickClose :call window#weed_out()
let g:weed_windows = [
      \ 'fugitive:\/\/',
      \ 'twiggy:\/\/',
      \ ]
function! window#weed_out() abort "{{{1
  " Note: it's almost the same as smart_diffoff()
  let l:id = win_getid()

  windo
        \ if &bt ==# 'nofile'
        \ || &bt ==# 'nowrite'
        \ || &bt ==# 'quickfix'
        \ |  quit
        \ | endif

  for i in g:weed_windows
    windo
          \ if bufname('%') =~# i
          \ |  quit
          \ | endif
  endfor

  diffoff!
  if exists('b:fdm_before_diff')
    exe 'setl foldmethod='. b:fdm_before_diff
  endif

  call win_gotoid(l:id)

endfunction "}}}1
onoremap <expr> q (v:operator ==# 'd')? ':<c-u>call window#weed_out()<cr>': 'q'
nnoremap <expr> <c-w><c-o> (&diff)? ':<c-u>call window#weed_out()<cr><c-w>o': '<c-w>o'
nnoremap <expr> <c-w>o     (&diff)? ':<c-u>call window#weed_out()<cr><c-w>o': '<c-w>o'

function! window#extract() abort "{{{1
  call window#weed_out()
  silent wincmd T
  let t:extracted_window = win_getid()
endfunction "}}}1
command! WinExtract :<c-u>call window#extract()

function! window#floating() abort "{{{1
  " Ref: https://github.com/junegunn/fzf.vim/issues/664
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns - (&columns * 1 / 10))
  let height = &lines - 2
  let y = &lines - 10
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction "}}}1

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

augroup OnEditNewNoFixedWindow
  au! BufWinLeave * if &l:winfixwidth || &l:winfixheight | setl nowinfixwidth nowinfixheight
augroup END

" Resize {{{
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
nnoremap <c-down> <c-w>-
nnoremap <c-up> <c-w>+
"}}}
