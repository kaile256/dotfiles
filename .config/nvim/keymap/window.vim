" From: nvim/init.vim

"" TODO: keep pseudo-cursor while in cmdline/cmdwindow in another color.
"nnoremap <silent> : :let g:cmd_last_cursor = matchaddpos('Cursor', [[line('.'), col('.')]])<cr>:
"augroup DeleteCursorMatch
"  au! CmdlineLeave * if exists('g:cmd_last_cursor') | call matchdelete(g:cmd_last_cursor) | endif
"augroup END

if mapcheck('<c-w>q', 'n') ==# ''
      \ || mapcheck('<c-w><c-q>', 'n') ==# ''
  nnoremap <c-w>q <Nop>
  nnoremap <c-w><c-q> <Nop>
endif

nnoremap <c-w>Z ZZ
nnoremap <c-w>Q ZQ
nnoremap Zz ZZ
nnoremap Zq ZQ
" Mnemonic: $ yes
nnoremap <silent> Zy :<c-u>qa  <cr>
nnoremap <silent> ZY :<c-u>qa! <cr>

nnoremap <silent> <c-w><space>n :<c-u>vnew<cr>

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

nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

nnoremap <silent> <c-w>C :<c-u>tabclose<cr>
nnoremap <silent> <c-w>O :<c-u>tabonly<cr>
nnoremap <c-w>gt <c-w>v<c-w>T
nnoremap <c-w>gT <c-w>v<c-w>T

" Redraw; No Highlight
" Ref: see <c-l> or :mode
inoremap <silent> <c-l>              <Cmd>noh  <bar> redraw!<cr>
nnoremap <silent> <c-space><space>   :<c-u>noh <bar> redraw!<cr>
nnoremap <silent> <c-space><c-space> :<c-u>noh <bar> redraw!<cr>

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=

noremap <silent> <c-w>o     <c-w>o:diffoff!<cr>
noremap <silent> <c-w><c-o> <c-w>o:diffoff!<cr>

" Resize {{{1
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
nnoremap <c-down> <c-w>-
nnoremap <c-up> <c-w>+
