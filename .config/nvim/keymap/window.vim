" From: nvim/init.vim

"" TODO: keep pseudo-cursor while in cmdline/cmdwindow in another color.
"nnoremap <silent> : :let g:cmd_last_cursor = matchaddpos('Cursor', [[line('.'), col('.')]])<cr>:
"augroup DeleteCursorMatch
"  au! CmdlineLeave * if exists('g:cmd_last_cursor') | call matchdelete(g:cmd_last_cursor) | endif
"augroup END

nnoremap <space>/ q/
nnoremap <space>? q?
" open CmdWin
nnoremap <space>: q:i

" No Highlight "{{{1
" Ref: compare :redraw with <c-l> or :mode
inoremap <silent> <c-l>              <Cmd>noh  <bar> redraw!<cr>
nnoremap <silent> <c-space><space>   :<c-u>noh <bar> redraw!<cr>
nnoremap <silent> <c-space><c-space> :<c-u>noh <bar> redraw!<cr>

" New window "{{{1
nnoremap <Plug>(wincopy-in-tab) <c-w>v<c-w>T
nmap <c-w>gt <Plug>(wincopy-in-tab)
nmap <c-w>gT <Plug>(wincopy-in-tab)

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
nnoremap <silent> ZC     :w <bar> windo q!<cr>
nnoremap <silent> Zc     :w <bar> windo q!<cr>
nnoremap <silent> <c-w>C :w <bar> windo q!<cr>
function! s:writeable() abort "{{{2
  if &modifiable && !&ro
    write
  endif
endfunction
"}}}

" Mnemonic: Eliminate current tabpage
nnoremap <silent> ZE :windo q!<cr>
nnoremap <silent> Ze :windo q!<cr>

" Mnemonic: <c-w>c is for :close as default
nnoremap <silent> <c-w>e :<c-u>windo q!<cr>
nnoremap <silent> <c-w>E :<c-u>windo q!<cr>

" Mnemonic: $ yes
nnoremap <silent> Zy :<c-u>qa  <cr>
nnoremap <silent> ZY :<c-u>qa! <cr>

command! -bar HelpCloseAll :call s:helpclose_all() "{{{2
function! s:helpclose_all() abort
  for bufnr in tabpagebuflist()
    helpclose
  endfor
endfunction

" Swap window {{{1
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

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

