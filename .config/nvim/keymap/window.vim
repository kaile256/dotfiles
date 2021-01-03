" From: nvim/init.vim

"" TODO: keep pseudo-cursor while in cmdline/cmdwindow in another color.
"nnoremap <silent> : :let g:cmd_last_cursor = matchaddpos('Cursor', [[line('.'), col('.')]])<cr>:
"augroup DeleteCursorMatch
"  au! CmdlineLeave * if exists('g:cmd_last_cursor') | call matchdelete(g:cmd_last_cursor) | endif
"augroup END

" as default, <F1> do `:help`
noremap <F1> <Nop>

nnoremap <space>/ q/kzb
nnoremap <space>? q?kzb
" open CmdWin
nnoremap <space>: q:kzb

" nnoremap <space>R :<C-u>call <SID>temp_relnum()<CR>
" function! s:temp_relnum() abort
"   " Note: Use [count]j from head instead after all.
"
"   set relativenumber
"   augroup myTmpRelnum
"     au!
"     au CursorMoved * ++once set norelativenumber
"   augroup END
" endfunction

" No Highlight "{{{1
" Ref: compare :redraw with <c-l> or :mode

" TODO: causes some event to append another process easier
nnoremap <silent> <SID>(highlight-off)
      \ :<C-u>noh <bar> redraw! <C-r>=(&diff ? '<bar>diffupdate' : '')<CR><CR>
" :mode once makes screen dirty
inoremap <silent> <SID>(highlight-off) <Cmd>noh  <bar> mode <bar> mode<cr>
"inoremap <silent> <SID>(highlight-off) <Cmd>noh  <bar> redraw!<cr>

nnoremap <script> <c-space><space>   <SID>(highlight-off)
nnoremap <script> <c-space><c-space> <SID>(highlight-off)
inoremap <script> <c-l> <SID>(highlight-off)

" New window "{{{1
nnoremap <SID>(wincopy-in-tab) <c-w>v<c-w>T
nnoremap <script> <c-w>gt <SID>(wincopy-in-tab)
nnoremap <script> <c-w>gT <SID>(wincopy-in-tab)

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

" Close window {{{1
if mapcheck('<c-w>q', 'n') ==# ''
  nnoremap <c-w>q <Nop>
endif
if mapcheck('<c-w><c-q>', 'n') ==# ''
  nnoremap <c-w><c-q> <Nop>
endif

function! s:ignore_floating_windows(ZZ) abort
  try
    call feedkeys(a:ZZ, 'n')
  catch /E5601/ " We cannot leave a floating window in a tab.
    only
    call feedkeys(a:ZZ, 'n')
  endtry
endfunction

nnoremap <silent> ZZ :<C-u>call <SID>ignore_floating_windows('ZZ')<CR>
nnoremap <silent> ZZ :<C-u>call <SID>ignore_floating_windows('ZZ')<CR>
nmap <c-w>Z ZZ
nmap <c-w>Q ZQ
nmap Zz ZZ
nmap Zq ZQ

if !dein#tap('undoquit.vim')
  " Note: look after that ZQ, as :q!, locates higher than ZZ, as :wq
  " Mnemonic: Close all
  nnoremap <silent> ZC     :<c-u>up <bar> windo norm! ZQ<cr>
  nnoremap <silent> Zc     :<c-u>up <bar> windo norm! ZQ<cr>
  nnoremap <silent> <c-w>C :<c-u>up <bar> windo norm! ZQ<cr>

  " Mnemonic: Eliminate current tabpage
  nnoremap <silent> ZE :<c-u>windo norm! ZQ<cr>
  nnoremap <silent> Ze :<c-u>windo norm! ZQ<cr>
  " Mnemonic: <c-w>c is for :close as default
  nnoremap <silent> <c-w>e :<c-u>windo norm! ZQ<cr>
  nnoremap <silent> <c-w>E :<c-u>windo norm! ZQ<cr>

  nnoremap <silent> <C-w>O :<C-u>tabonly<CR>
endif

" Mnemonic: $ yes
nnoremap <silent> Zy :<c-u>qa <cr>
nnoremap <silent> ZY :<c-u>qa <cr>
nnoremap <silent> Zn :<c-u>xa <cr>
nnoremap <silent> ZN :<c-u>xa <cr>

command! -bar HelpCloseAll :call s:helpclose_all() "{{{2
function! s:helpclose_all() abort
  for bufnr in tabpagebuflist()
    if getbufvar(bufnr, '&filetype') !=# 'help' | continue | endif
    if getbufvar(bufnr, '&modifiable') | continue | endif

    let winnr = bufwinnr(bufnr)
    exe winnr 'close'
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
nnoremap <A-S-H> <c-w>H
nnoremap <A-S-J> <c-w>J
nnoremap <A-S-K> <c-w>K
nnoremap <A-S-L> <c-w>L

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

