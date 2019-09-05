scriptencoding utf-8
" From: Initial.toml
" Repo: junegunn/fzf.vim
" Help: fzf || fzf-vim

" CmdAbbr; :Helptags {{{
cnoreabbr <silent><expr> C (getcmdtype() == ':' && getcmdline() =~ '^C$')? 'Colors' : 'C'
cnoreabbr <silent><expr> H (getcmdtype() == ':' && getcmdline() =~ '^H$')? 'Helptags' : 'H'
cnoreabbr <silent><expr> h  (getcmdtype() == ':' && getcmdline() =~ '^h$')?  'Helptags<cr>' : 'h'
"}}}

function! s:fzf_buffer_statusline() "{{{

  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23  ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251

  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction "}}}

augroup CallMyFzfFunctions "{{{
  au!
  " CAUTION: WinLeave's current file is next file, i.e., fzf when opening fzf-buffer.
  au BufLeave * if &ft =~# 'fzf' | hide | if &l:statusline == v:false | setl laststatus=2 showmode ruler| endif
  au User     FzfStatusLine call <SID>fzf_buffer_statusline()
  au FileType fzf           call <SID>fzf_buffer_keymap()
augroup END "}}}

" [Buffers] Rather Jump to window if existed.
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"" down/up/left/right
let g:fzf_layout = { 'down': '~20%' }

function! s:fzf_buffer_keymap() "{{{
  " Execute selected command
  let g:fzf_commands_expect = 'ctrl-r,ctrl-x'

  function! s:fzf_open_in_quickfix_list(lines) "{{{
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction "}}}
  let g:fzf_action = {
        \ 'ctrl-q': function('s:fzf_open_in_quickfix_list'),
        \ 'ctrl-c': function('s:fzf_open_in_quickfix_list'),
        \ 'ctrl-z': '',
        \ 'ctrl-b': 'tab split',
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-v': 'vsplit',
        \ 'ctrl-o': 'split',
        \ 'ctrl-s': 'split' }
endfunction "}}}

" on FZF Buffer; Color Config {{{
let g:fzf_colors =
      \ { 'fg':      ['fg', 'None'],
      \   'bg':      ['bg', 'None'],
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

" Mnemonic: File-path
" NOTE: too slow if parmission denied.
"imap <c-f> <plug>(fzf-complete-path)
"imap <c-f> <plug>(fzf-complete-file)
imap <c-f> <plug>(fzf-complete-file-ag)
" :FZF! starts fzf on full-window.

" Keymap; Command! Ag/Rg/FZF {{{
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
" Keymap; Ag {{{
if executable('ag') == 0

  noremap <silent><nowait> <a-a> :<c-u>echo "You don't have executable 'silver searcher'"<cr>

else
  tnoremap <silent> <a-a><a-k> <c-u>cd ~/vimwiki/diary <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>k     <c-u>cd ~/vimwiki/diary <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-i> <c-u>cd ~/vimwiki       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>i     <c-u>cd ~/vimwiki       <c-\><c-n>: Ag<cr>

  tnoremap <silent> <a-a>      <c-u><c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-c> <c-u><c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>c     <c-u><c-\><c-n>: Ag<cr>

  tnoremap <silent> <a-a><a-r> <c-u>cd /<cr>              <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>r     <c-u>cd /<cr>              <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-.> <c-u>cd %:p:h<cr>          <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>.     <c-u>cd %:p:h<cr>          <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-w> <c-u>cd <space>          <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>w     <c-u>cd <space>          <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-h> <c-u>cd ~<cr>              <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>h     <c-u>cd ~<cr>              <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-o> <c-u>cd ~/org<cr>          <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>o     <c-u>cd ~/org<cr>          <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-d> <c-u>cd ~/dotfiles<cr>     <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>d     <c-u>cd ~/dotfiles<cr>     <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-c> <c-u>cd ~/.cache<cr>       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>c     <c-u>cd ~/.cache<cr>       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-g> <c-u>cd ~/.config<cr>      <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>g     <c-u>cd ~/.config<cr>      <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-v> <c-u>cd ~/.config/nvim<cr> <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>v     <c-u>cd ~/.config/nvim<cr> <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-l> <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>l     <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>: Ag<cr>

  noremap <silent> <a-a><a-k> :<c-u>cd ~/vimwiki/diary<cr> : Ag<cr>
  noremap <silent> <a-a>k     :<c-u>cd ~/vimwiki/diary<cr> : Ag<cr>

  noremap <silent> <a-a>      :<c-u> Ag<cr>
  noremap <silent> <a-a><a-c> :<c-u> Ag<cr>
  noremap <silent> <a-a>c     :<c-u> Ag<cr>

  noremap <silent> <a-a><a-r> :<c-u>cd /<cr>                           :Ag<cr>
  noremap <silent> <a-a>r     :<c-u>cd /<cr>                           :Ag<cr>
  noremap <silent> <a-a><a-.> :<c-u>cd %:p:h<cr>                       :Ag<cr>
  noremap <silent> <a-a>.     :<c-u>cd %:p:h<cr>                       :Ag<cr>
  noremap <silent> <a-a><a-w> :<c-u>   <space>                         :Ag<cr>
  noremap <silent> <a-a>w     :<c-u>   <space>                         :Ag<cr>
  noremap <silent> <a-a><a-h> :<c-u>cd ~<cr>                           :Ag<cr>
  noremap <silent> <a-a>h     :<c-u>cd ~<cr>                           :Ag<cr>
  noremap <silent> <a-a><a-o> :<c-u>cd ~/org<cr>                       :Ag<cr>
  noremap <silent> <a-a>o     :<c-u>cd ~/org<cr>                       :Ag<cr>
  noremap <silent> <a-a><a-d> :<c-u>cd ~/dotfiles<cr>                  :Ag<cr>
  noremap <silent> <a-a>d     :<c-u>cd ~/dotfiles<cr>                  :Ag<cr>
  noremap <silent> <a-a><a-c> :<c-u>cd ~/.cache<cr>                    :Ag<cr>
  noremap <silent> <a-a>c     :<c-u>cd ~/.cache<cr>                    :Ag<cr>
  noremap <silent> <a-a><a-g> :<c-u>cd ~/.config<cr>                   :Ag<cr>
  noremap <silent> <a-a>g     :<c-u>cd ~/.config<cr>                   :Ag<cr>
  noremap <silent> <a-a><a-v> :<c-u>cd ~/.config/nvim<cr>              :Ag<cr>
  noremap <silent> <a-a>v     :<c-u>cd ~/.config/nvim<cr>              :Ag<cr>
  noremap <silent> <a-a><a-l> :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Ag<cr>
  noremap <silent> <a-a>l     :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Ag<cr>

endif
"}}}
" Keymap; Ripgrep {{{
if executable('rg') == 0

  noremap <silent><nowait> <a-r> :<c-u>echo "You don't have executable 'ripgrep'"<cr>

else
  tnoremap <silent> <a-r><a-c> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>c     <c-\><c-n>:<c-u> Rg<cr>

  tnoremap <silent> <a-r><a-k> <c-u>cd ~/vimwiki/diary    <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>k     <c-u>cd ~/vimwiki/diary    <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-r> <c-u>cd /<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>r     <c-u>cd /<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-.> <c-u>cd %:p:h<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>.     <c-u>cd %:p:h<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-w> <c-u>cd <space>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>w     <c-u>cd <space>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-h> <c-u>cd ~<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>h     <c-u>cd ~<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-o> <c-u>cd ~/org<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>o     <c-u>cd ~/org<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-d> <c-u>cd ~/dotfiles<cr>     <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>d     <c-u>cd ~/dotfiles<cr>     <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-c> <c-u>cd ~/.cache<cr>       <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>c     <c-u>cd ~/.cache<cr>       <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-g> <c-u>cd ~/.config<cr>      <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>g     <c-u>cd ~/.config<cr>      <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-v> <c-u>cd ~/.config/nvim<cr> <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>v     <c-u>cd ~/.config/nvim<cr> <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-l> <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>l     <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>:<c-u> Rg<cr>

  noremap <silent> <a-r><a-c> :<c-u>Rg<cr>
  noremap <silent> <a-r>c     :<c-u>Rg<cr>

  noremap <silent> <a-r><a-k> :<c-u>cd ~/vimwiki/diary<cr>             :Rg<cr>
  noremap <silent> <a-r>k     :<c-u>cd ~/vimwiki/diary<cr>             :Rg<cr>
  noremap <silent> <a-r><a-r> :<c-u>cd /<cr>                           :Rg<cr>
  noremap <silent> <a-r>r     :<c-u>cd /<cr>                           :Rg<cr>
  noremap <silent> <a-r><a-.> :<c-u>cd %:p:h<cr>                       :Rg<cr>
  noremap <silent> <a-r>.     :<c-u>cd %:p:h<cr>                       :Rg<cr>
  noremap <silent> <a-r><a-w> :<c-u>   <space>                         :Rg<cr>
  noremap <silent> <a-r>w     :<c-u>   <space>                         :Rg<cr>
  noremap <silent> <a-r><a-h> :<c-u>cd ~<cr>                           :Rg<cr>
  noremap <silent> <a-r>h     :<c-u>cd ~<cr>                           :Rg<cr>
  noremap <silent> <a-r><a-o> :<c-u>cd ~/org<cr>                       :Rg<cr>
  noremap <silent> <a-r>o     :<c-u>cd ~/org<cr>                       :Rg<cr>
  noremap <silent> <a-r><a-d> :<c-u>cd ~/dotfiles<cr>                  :Rg<cr>
  noremap <silent> <a-r>d     :<c-u>cd ~/dotfiles<cr>                  :Rg<cr>
  noremap <silent> <a-r><a-c> :<c-u>cd ~/.cache<cr>                    :Rg<cr>
  noremap <silent> <a-r>c     :<c-u>cd ~/.cache<cr>                    :Rg<cr>
  noremap <silent> <a-r><a-g> :<c-u>cd ~/.config<cr>                   :Rg<cr>
  noremap <silent> <a-r>g     :<c-u>cd ~/.config<cr>                   :Rg<cr>
  noremap <silent> <a-r><a-v> :<c-u>cd ~/.config/nvim<cr>              :Rg<cr>
  noremap <silent> <a-r>v     :<c-u>cd ~/.config/nvim<cr>              :Rg<cr>
  noremap <silent> <a-r><a-l> :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Rg<cr>
  noremap <silent> <a-r>l     :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Rg<cr>
endif
"}}}
"" FZF; with cd {{{
tnoremap  <silent> <a-q><a-h> <c-u>cd  ~<cr>                           <c-\><c-n> :FZF<cr>
tnoremap  <silent> <a-q>h     <c-u>cd  ~<cr>                           <c-\><c-n> :FZF<cr>
tnoremap  <silent> <a-q><a-d> <c-u>cd  ~/dotfiles<cr>                  <c-\><c-n> :FZF<cr>
tnoremap  <silent> <a-q>d     <c-u>cd  ~/dotfiles<cr>                  <c-\><c-n> :FZF<cr>
tnoremap  <silent> <a-q><a-v> <c-u>cd  ~/dotfiles/nvim<cr>             <c-\><c-n> :FZF<cr>
tnoremap  <silent> <a-q>v     <c-u>cd  ~/dotfiles/nvim<cr>             <c-\><c-n> :FZF<cr>

noremap <silent> <a-q><a-r> :<c-u> cd /               <cr> :FZF<cr>
noremap <silent> <a-q>r     :<c-u> cd /               <cr> :FZF<cr>
noremap <silent> <a-q><a-h> :<c-u> cd ~               <cr> :FZF<cr>
noremap <silent> <a-q>h     :<c-u> cd ~               <cr> :FZF<cr>
noremap <silent> <a-q><a-d> :<c-u> cd ~/dotfiles      <cr> :FZF<cr>
noremap <silent> <a-q>d     :<c-u> cd ~/dotfiles      <cr> :FZF<cr>
noremap <silent> <a-q><a-v> :<c-u> cd ~/dotfiles/nvim <cr> :FZF<cr>
noremap <silent> <a-q>v     :<c-u> cd ~/dotfiles/nvim <cr> :FZF<cr>
" Mnemonic: Current Directory
noremap <silent> <a-q><a-w> :<c-u> <space> <space> FZF<cr>
noremap <silent> <a-q>w     :<c-u> <space> <space> FZF<cr>
" Mnemonic: Working Directory
noremap <silent> <a-q><a-.> :<c-u> cd %:p:h           <cr> :FZF<cr>
noremap <silent> <a-q>.     :<c-u> cd %:p:h           <cr> :FZF<cr>
"}}}
"" FZF; Various {{{
tnoremap <silent> <a-q><a-w> <c-\><c-n>: FZF<cr>
tnoremap <silent> <a-q>w     <c-\><c-n>: FZF<cr>

" BLines; instead of `/-search`
tnoremap <silent> <a-q>q     <c-\><c-n>: BLines<cr>
tnoremap <silent> <a-q><a-q> <c-\><c-n>: BLines<cr>
tnoremap <silent> <a-q><a-b> <c-\><c-n>: Buffers<cr>
tnoremap <silent> <a-q>b     <c-\><c-n>: Buffers<cr>
tnoremap <silent> <a-q><a-l> <c-\><c-n>: Helptags<cr>
tnoremap <silent> <a-q>l     <c-\><c-n>: Helptags<cr>
tnoremap <silent> <a-q><a-g> <c-\><c-n>: GFiles?<cr>
tnoremap <silent> <a-q>g     <c-\><c-n>: GFiles?<cr>

noremap <silent> <a-q><a-b> :<c-u> Buffers<cr>
noremap <silent> <a-q>b     :<c-u> Buffers<cr>
noremap <silent> <a-q><a-l> :<c-u> Helptags<cr>
noremap <silent> <a-q>l     :<c-u> Helptags<cr>
noremap <silent> <a-q><a-g> :<c-u> GFiles?<cr>
noremap <silent> <a-q>g     :<c-u> GFiles?<cr>
"" Mnemonic: 'Old' Buffer
noremap <silent> <a-q><a-o> :<c-u> History<cr>
noremap <silent> <a-q>o     :<c-u> History<cr>
"" Marks: Useless?
"noremap <silent> <a-q><a-m> :<c-u> Marks<cr>
"noremap <silent> <a-q>m     :<c-u> Marks<cr>
"" Mnemonic: Search in Current File
noremap <silent> <a-q><a-q> :<c-u> BLines<cr>
noremap <silent> <a-q>q     :<c-u> BLines<cr>
noremap <silent> <a-q><a-/> :<c-u> BLines<cr>
noremap <silent> <a-q>/     :<c-u> BLines<cr>
noremap <silent> <a-q><a-;> :<c-u> Commands<cr>
noremap <silent> <a-q>;     :<c-u> Commands<cr>

"" Search; Override
noremap <silent> q/         :<c-u> History/<cr>
""" Preview Only
noremap <silent> <a-q><a-p> :<c-u> Maps<cr>
noremap <silent> <a-q>p     :<c-u> Maps<cr>
noremap <silent> <a-q><a-m> :<c-u> Maps<cr>
noremap <silent> <a-q>m     :<c-u> Maps<cr>
"" Mnemonic: Image
noremap <silent> <a-q><a-i> :<c-u> Colors<cr>
noremap <silent> <a-q>i     :<c-u> Colors<cr>
"}}}

augroup FzfAutoToggle
  au!
  au FileType fzf setl laststatus=0 noshowmode noruler | au BufLeave * ++once setl laststatus=2 showmode ruler
augroup END
