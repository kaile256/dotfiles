" From: nvim/init.vim

if execute('map <c-w>q') !=# '' || execute('map <c-w><c-q>') !=# ''
  noremap <c-w>q <Nop>
  noremap <c-w><c-q> <Nop>
endif

nnoremap <c-w>Q :<c-u>q! <cr>
nnoremap <c-w>Z :<c-u>qa  <cr>

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

function! window#extract() abort "{{{1
  call window#weed_out()
  silent wincmd T
endfunction "}}}1

command! WinExtract :call window#extract()

function! window#floating() "{{{1
  " Ref: https://github.com/junegunn/fzf.vim/issues/664
  " TODO: relative to the winwidth of editor, not current window.
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let winheight = winheight(0)
  let winwidth = winwidth(0)

  let width = float2nr(winwidth-(winwidth*1/10))

  let opts = {
        \ 'relative': 'editor',
        \ 'row': &lines - 3,
        \ 'col': float2nr((winwidth-width)/2),
        \ 'width': width,
        \ 'height': &lines - 3
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction "}}}1

" Close; Tab-page
noremap <silent> <c-w>C :<c-u>tabclose<cr>

" Move Window
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

" Resize
nnoremap <C-left>  <c-w>>
nnoremap <C-down>  <c-w>-
nnoremap <C-up>    <c-w>+
nnoremap <C-right> <c-w><
nnoremap <A-left>  <c-w>>
nnoremap <A-down>  <c-w>-
nnoremap <A-up>    <c-w>+
nnoremap <A-right> <c-w><

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

augroup OnEditNewNoFixedWindow
  au! BufWinLeave * if &l:winfixwidth || &l:winfixheight | setl nowinfixwidth nowinfixheight
augroup END
