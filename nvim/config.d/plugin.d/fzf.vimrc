"""" Info: https://github.com/junegunn/fzf.vim
"""" Help: fzf-vim
"""" From: Initial.toml

" FZF; Function! {{{
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! s:fzf_buffer_keymap() "{{{
  noremap <buffer><silent> <a-a> <c-\><c-n>:<c-u>quit<cr><a-a>
  noremap <buffer><silent> <a-r> <c-\><c-n>:<c-u>quit<cr><a-r>
  noremap <buffer><silent> <a-q> <c-\><c-n>:<c-u>quit<cr><a-q>
endfunction
"}}}
"}}}

" FZF; Augroup {{{

augroup FzfAugroup
  au!
  au User FzfStatusLine call <SID>fzf_statusline()
  au FileType fzf call <SID>fzf_buffer_keymap()
augroup END
" }}}

" FZF; Let {{{
" [Buffers] Jump to existing window if possible.
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"" down/up/left/right
let g:fzf_layout = { 'down': '~20%' }

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-c': function('s:build_quickfix_list'),
      \ 'ctrl-z': '',
      \ 'ctrl-b': 'tab split',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-o': 'split',
      \ 'ctrl-s': 'split' }

"" Execute Selected Command
let g:fzf_commands_expect = 'ctrl-r,ctrl-x'

"" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \   'bg':      ['bg', 'Normal'],
      \   'hl':      ['fg', 'Comment'],
      \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \   'hl+':     ['fg', 'Statement'],
      \   'info':    ['fg', 'PreProc'],
      \   'border':  ['fg', 'Ignore'],
      \   'prompt':  ['fg', 'Conditional'],
      \   'pointer': ['fg', 'Exception'],
      \   'marker':  ['fg', 'Keyword'],
      \   'spinner': ['fg', 'Label'],
      \   'header':  ['fg', 'Comment'] }
"}}}

" FZF; Command! {{{
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%'),
      \                 <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('down:60%')
      \           : fzf#vim#with_preview('right:50%'),
      \   <bang>0)

command! -bang -nargs=? -complete=dir BFiles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"}}}

" FZF; Keymap {{{

"" Keymap; Ag {{{
if executable('ag') == 0

  nnoremap <silent><nowait> <a-a> :<c-u>echo "You don't have executable 'silver searcher'"<cr>

else
  tnoremap <silent> <a-a><a-k> <c-u>cd ~/vimwiki/diary <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>k     <c-u>cd ~/vimwiki/diary <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-i> <c-u>cd ~/vimwiki       <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>i     <c-u>cd ~/vimwiki       <c-\><c-n>:<c-u> Ag<cr>

  tnoremap <silent> <a-a>      <c-u><c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-c> <c-u><c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>c     <c-u><c-\><c-n>:<c-u> Ag<cr>

  tnoremap <silent> <a-a><a-r> <c-u>cd /<cr>              <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>r     <c-u>cd /<cr>              <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-w> <c-u>cd %:p:h<cr>          <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>w     <c-u>cd %:p:h<cr>          <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-h> <c-u>cd ~<cr>              <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>h     <c-u>cd ~<cr>              <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-o> <c-u>cd ~/org<cr>          <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>o     <c-u>cd ~/org<cr>          <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-d> <c-u>cd ~/dotfiles<cr>     <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>d     <c-u>cd ~/dotfiles<cr>     <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-.> <c-u>cd ~/dotfiles<cr>     <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>.     <c-u>cd ~/dotfiles<cr>     <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-g> <c-u>cd ~/.config<cr>      <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>g     <c-u>cd ~/.config<cr>      <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a><a-n> <c-u>cd ~/.config/nvim<cr> <c-\><c-n>:<c-u> Ag<cr>
  tnoremap <silent> <a-a>n     <c-u>cd ~/.config/nvim<cr> <c-\><c-n>:<c-u> Ag<cr>

  nnoremap <silent> <a-a><a-k> :<c-u>cd ~/vimwiki/diary<cr> :<c-u> Ag<cr>
  nnoremap <silent> <a-a>k     :<c-u>cd ~/vimwiki/diary<cr> :<c-u> Ag<cr>

  nnoremap <silent> <a-a>      :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-c> :<c-u> Ag<cr>
  nnoremap <silent> <a-a>c     :<c-u> Ag<cr>

  nnoremap <silent> <a-a><a-r> :<c-u>cd /<cr>              :<c-u> Ag<cr>
  nnoremap <silent> <a-a>r     :<c-u>cd /<cr>              :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-w> :<c-u>cd %:p:h<cr>          :<c-u> Ag<cr>
  nnoremap <silent> <a-a>w     :<c-u>cd %:p:h<cr>          :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-h> :<c-u>cd ~<cr>              :<c-u> Ag<cr>
  nnoremap <silent> <a-a>h     :<c-u>cd ~<cr>              :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-o> :<c-u>cd ~/org<cr>          :<c-u> Ag<cr>
  nnoremap <silent> <a-a>o     :<c-u>cd ~/org<cr>          :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-d> :<c-u>cd ~/dotfiles<cr>     :<c-u> Ag<cr>
  nnoremap <silent> <a-a>d     :<c-u>cd ~/dotfiles<cr>     :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-.> :<c-u>cd ~/dotfiles<cr>     :<c-u> Ag<cr>
  nnoremap <silent> <a-a>.     :<c-u>cd ~/dotfiles<cr>     :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-g> :<c-u>cd ~/.config<cr>      :<c-u> Ag<cr>
  nnoremap <silent> <a-a>g     :<c-u>cd ~/.config<cr>      :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-n> :<c-u>cd ~/.config/nvim<cr> :<c-u> Ag<cr>
  nnoremap <silent> <a-a>n     :<c-u>cd ~/.config/nvim<cr> :<c-u> Ag<cr>

endif
"}}}

"" Keymap; Ripgrep {{{
if executable('rg') == 0

  nnoremap <silent><nowait> <a-r> :<c-u>echo "You don't have executable 'ripgrep'"<cr>

else
  tnoremap <silent> <a-r><a-k> <c-u>cd ~/vimwiki/diary <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>k     <c-u>cd ~/vimwiki/diary <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>      <c-u><c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-c> <c-u><c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>c     <c-u><c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-r> <c-u>cd /<cr>          <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>r     <c-u>cd /<cr>          <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-w> <c-u>cd %:p:h<cr>      <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>w     <c-u>cd %:p:h<cr>      <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-h> <c-u>cd ~<cr>          <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>h     <c-u>cd ~<cr>          <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-o> <c-u>cd ~/org<cr>      <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>o     <c-u>cd ~/org<cr>      <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-d> <c-u>cd ~/dotfiles<cr> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>d     <c-u>cd ~/dotfiles<cr> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-.> <c-u>cd ~/dotfiles<cr> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>.     <c-u>cd ~/dotfiles<cr> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r><a-g> <c-u>cd ~/.config<cr>  <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>g     <c-u>cd ~/.config<cr>  <c-\><c-n>:<c-u> Rg<cr>

  nnoremap <silent> <a-r><a-k> :<c-u>cd ~/vimwiki/diary<cr> :<c-u> Rg<cr>
  nnoremap <silent> <a-r>k     :<c-u>cd ~/vimwiki/diary<cr> :<c-u> Rg<cr>
  nnoremap <silent> <a-r>      :<c-u>:<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-c> :<c-u>:<c-u> Rg<cr>
  nnoremap <silent> <a-r>c     :<c-u>:<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-r> :<c-u>cd /<cr>           :<c-u> Rg<cr>
  nnoremap <silent> <a-r>r     :<c-u>cd /<cr>           :<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-w> :<c-u>cd %:p:h<cr>       :<c-u> Rg<cr>
  nnoremap <silent> <a-r>w     :<c-u>cd %:p:h<cr>       :<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-h> :<c-u>cd ~<cr>           :<c-u> Rg<cr>
  nnoremap <silent> <a-r>h     :<c-u>cd ~<cr>           :<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-o> :<c-u>cd ~/org<cr>       :<c-u> Rg<cr>
  nnoremap <silent> <a-r>o     :<c-u>cd ~/org<cr>       :<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-d> :<c-u>cd ~/dotfiles<cr>  :<c-u> Rg<cr>
  nnoremap <silent> <a-r>d     :<c-u>cd ~/dotfiles<cr>  :<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-.> :<c-u>cd ~/dotfiles<cr>  :<c-u> Rg<cr>
  nnoremap <silent> <a-r>.     :<c-u>cd ~/dotfiles<cr>  :<c-u> Rg<cr>
  nnoremap <silent> <a-r><a-g> :<c-u>cd ~/.config<cr>   :<c-u> Rg<cr>
  nnoremap <silent> <a-r>g     :<c-u>cd ~/.config<cr>   :<c-u> Rg<cr>
endif
"}}}

"" Keymap; Various {{{
" Mnemonic: File-path
imap <c-f> <plug>(fzf-complete-path)
" NOTE: Too Slow to Acivate Ag
"imap <c-f> <plug>(fzf-complete-file-ag)
" :FZF! starts fzf on full-window.

tnoremap <silent> <a-q><a-h> <c-u>cd ~<cr>          <c-\><c-n>:<c-u> FZF<cr>
tnoremap <silent> <a-q>h     <c-u>cd ~<cr>          <c-\><c-n>:<c-u> FZF<cr>
tnoremap <silent> <a-q><a-.> <c-u>cd ~/dotfiles<cr> <c-\><c-n>:<c-u> FZF<cr>
tnoremap <silent> <a-q>.     <c-u>cd ~/dotfiles<cr> <c-\><c-n>:<c-u> FZF<cr>

tnoremap <silent> <a-q>q     <c-\><c-n>:<c-u> BLines<cr>
tnoremap <silent> <a-q><a-q> <c-\><c-n>:<c-u> BLines<cr>
tnoremap <silent> <a-q><a-b> <c-\><c-n>:<c-u> Buffers<cr>
tnoremap <silent> <a-q>b     <c-\><c-n>:<c-u> Buffers<cr>
tnoremap <silent> <a-q><a-l> <c-\><c-n>:<c-u> Helptags<cr>
tnoremap <silent> <a-q>l     <c-\><c-n>:<c-u> Helptags<cr>
tnoremap <silent> <a-q><a-w> <c-\><c-n>:<c-u> Windows<cr>
tnoremap <silent> <a-q>w     <c-\><c-n>:<c-u> Windows<cr>

nnoremap <silent> <a-q><a-h> :<c-u> cd ~          <bar> FZF<cr>
nnoremap <silent> <a-q>h     :<c-u> cd ~          <bar> FZF<cr>
nnoremap <silent> <a-q><a-.> :<c-u> cd ~/dotfiles <bar> FZF<cr>
nnoremap <silent> <a-q>.     :<c-u> cd ~/dotfiles <bar> FZF<cr>
nnoremap <silent> <a-q><a-w> :<c-u> cd %:p:h      <bar> FZF<cr>
nnoremap <silent> <a-q>w     :<c-u> cd %:p:h      <bar> FZF<cr>
nnoremap <silent> <a-q><a-b> :<c-u> Buffers<cr>
nnoremap <silent> <a-q>b     :<c-u> Buffers<cr>
nnoremap <silent> <a-q><a-l> :<c-u> Helptags<cr>
nnoremap <silent> <a-q>l     :<c-u> Helptags<cr>
"" Marks: Useless?
nnoremap <silent> <a-q><a-m> :<c-u> Marks<cr>
nnoremap <silent> <a-q>m     :<c-u> Marks<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <a-q><a-q> :<c-u> BLines<cr>
nnoremap <silent> <a-q>q     :<c-u> BLines<cr>

"" Search
nnoremap <silent> <a-q><a-/> :<c-u> History/<cr>
nnoremap <silent> <a-q>/     :<c-u> History/<cr>
nnoremap <silent> <a-q><a-;> :<c-u> Commands<cr>
nnoremap <silent> <a-q>;     :<c-u> Commands<cr>
""" Preview Only
nnoremap <silent> <a-q><a-p> :<c-u> Maps<cr>
nnoremap <silent> <a-q>p     :<c-u> Maps<cr>
"}}}
"}}}
