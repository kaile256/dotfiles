" From: nvim/init.vim

"" TODO: keep pseudo-cursor while in cmdline/cmdwindow in another color.
"nnoremap <silent> : :let g:cmd_last_cursor = matchaddpos('Cursor', [[line('.'), col('.')]])<cr>:
"augroup DeleteCursorMatch
"  au! CmdlineLeave * if exists('g:cmd_last_cursor') | call matchdelete(g:cmd_last_cursor) | endif
"augroup END

nnoremap <space>/ q/kzb
nnoremap <space>? q?kzb
" open CmdWin
nnoremap <space>: q:kzb

" No Highlight "{{{1
" Ref: compare :redraw with <c-l> or :mode

inoremap <silent> <Plug>(highlight-off) <Cmd>noh  <bar> redraw!<cr>
nnoremap <silent> <Plug>(highlight-off) :<c-u>noh <bar> redraw!<cr>
imap     <silent> <c-l>                  <Plug>(highlight-off)
nmap     <silent> <c-space><space>       <Plug>(highlight-off)
nmap     <silent> <c-space><c-space>     <Plug>(highlight-off)

" New window "{{{1
nnoremap <Plug>(wincopy-in-tab) <c-w>v<c-w>T
nmap <c-w>gt <Plug>(wincopy-in-tab)
nmap <c-w>gT <Plug>(wincopy-in-tab)

nnoremap <silent> <c-w><space>T :<c-u>call <SID>wincopy_to_another_proc()<cr>
nnoremap <silent> <c-w><space>t :<c-u>call <SID>wincopy_to_another_proc()<cr>
function! s:wincopy_to_another_proc() abort
  if executable('nvim-qt')
    silent !nvim-qt %:p &
  elseif executable('nvim')
    silent !xterm -e nvim %:p &
  elseif executable('vim')
    silent !xterm -e vim %:p &
  elseif executable('vi')
    silent !xterm -e vi %:p &
  else
    echoerr 'You have no executable vi-like editor!'
  endif

  quit
endfunction

" <c-w>^ behaves like ':sp#'
" ':9vs#' works like ':vs#9' but with ruin of winwidth
" TODO: make v:count work
nnoremap <silent><expr> <c-w><space>^ ':<c-u>vs#'.   v:count .'<cr>'
nnoremap <silent><expr> <c-w><space>^ ':<c-u>vs#'.   v:count .'<cr>'
nnoremap <silent><expr> <c-w>g^       ':<c-u>tabe#'. v:count .'<cr>'
nnoremap <silent><expr> <c-w>g^       ':<c-u>tabe#'. v:count .'<cr>'

function! s:scratch(edit) abort "{{{2
  let path = '/tmp/myscratch.vim'
  exe a:edit path
endfunction

nnoremap <silent> <c-w>N        :<c-u>call <SID>scratch('e')<cr>
nnoremap <silent> <c-w>n        :<c-u>call <SID>scratch('sp')<cr>
nnoremap <silent> <c-w><space>n :<c-u>call <SID>scratch('vs')<cr>
nnoremap <silent> <c-w>gn       :<c-u>call <SID>scratch('tabe')<cr>

" Close window {{{1
if mapcheck('<c-w>q', 'n') ==# ''
  nnoremap <c-w>q <Nop>
endif
if mapcheck('<c-w><c-q>', 'n') ==# ''
  nnoremap <c-w><c-q> <Nop>
endif

nnoremap <silent> <c-w><c-o> <c-w>o:diffoff!<cr>
nnoremap <silent> <c-w>o     <c-w>o:diffoff!<cr>
nnoremap <silent> <c-w>O     :<c-u>tabonly<cr>

nnoremap <c-w>Z ZZ
nnoremap <c-w>Q ZQ
nnoremap Zz ZZ
nnoremap Zq ZQ

" Note: look after that ZQ, as :q!, locates higher than ZZ, as :wq
" Mnemonic: Close all
nnoremap <silent> ZC     :<c-u>w <bar> windo norm! ZQ<cr>
nnoremap <silent> Zc     :<c-u>w <bar> windo norm! ZQ<cr>
nnoremap <silent> <c-w>C :<c-u>w <bar> windo norm! ZQ<cr>

" Mnemonic: Eliminate current tabpage
nnoremap <silent> ZE :<c-u>windo norm! ZQ<cr>
nnoremap <silent> Ze :<c-u>windo norm! ZQ<cr>
" Mnemonic: <c-w>c is for :close as default
nnoremap <silent> <c-w>e :<c-u>windo norm! ZQ<cr>
nnoremap <silent> <c-w>E :<c-u>windo norm! ZQ<cr>

" Mnemonic: $ yes
nnoremap <silent> Zy :<c-u>qa  <cr>
nnoremap <silent> ZY :<c-u>qa  <cr>
nnoremap <silent> Zn :<c-u>wqa <cr>
nnoremap <silent> ZN :<c-u>wqa <cr>

command! -bar HelpCloseAll :call s:helpclose_all() "{{{2
function! s:helpclose_all() abort
  for bufnr in tabpagebuflist()
    helpclose
  endfor
endfunction

" Move in Window {{{1
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

" avoid a stack on command-line
cnoremap <a-k> <c-c>

" Move in Tab Page {{{1
"" Move between Tabs
nnoremap <c-h> gT
nnoremap <c-l> gt
nnoremap <a-]> gt
nnoremap <a-[> gT
inoremap <a-[> <esc>gT
inoremap <a-]> <esc>gt
tnoremap <a-]> <c-\><c-n>gt
tnoremap <a-[> <c-\><c-n>gT

" Swap window {{{1
nnoremap <a-H> <c-w>H
nnoremap <a-J> <c-w>J
nnoremap <a-K> <c-w>K
nnoremap <a-L> <c-w>L

" Resize window {{{1
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
nnoremap <c-down> <c-w>-
nnoremap <c-up> <c-w>+
" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

function! s:wincmd_resize(wcmd) abort
  exe 'wincmd' wcmd
  if wcmd =~# 'v'
    vertical resize v:
  endif
endfunction
"command! -range -bar WincmdS
"      \ :<range> sp
"      \ | let s:fixed = &winfixheight | setl winfixheight
"      \ | wincmd p | close | wincmd p
"      \ | let &winfixheight = s:fixed
"
"command! -range -bar WincmdV
"      \ :<range> vs
"      \ | let s:fixed = &winfixwidth | setl winfixwidth
"      \ | wincmd p | close | wincmd p
"      \ | let &winfixwidth = s:fixed
"
"nnoremap <silent> <c-w>s :WincmdS<cr>
"nnoremap <silent> <c-w>v :WincmdV<cr>

