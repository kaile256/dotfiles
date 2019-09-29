scriptencoding utf-8
" From: Initial.toml
" Repo: junegunn/fzf.vim
" Help: fzf || fzf-vim

" CmdAbbr; :Helptags {{{
cnoreabbr <expr> C (getcmdtype() == ':' && getcmdline() =~ '^C$')? 'Colors'   : 'C'
cnoreabbr <expr> H (getcmdtype() == ':' && getcmdline() =~ '^H$')? 'Helptags' : 'H'
cnoreabbr <expr> h (getcmdtype() == ':' && getcmdline() =~ '^h$')? 'Helptags' : 'h'
"}}}

function! s:fzf_buffer_statusline() "{{{
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23  ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setl statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction "}}}

augroup FzfCallMyFunctions "{{{
  au!
  au User     FzfStatusLine call <SID>fzf_buffer_statusline()
  au FileType fzf           call <SID>fzf_buffer_keymap()
augroup END "}}}
augroup FzfMyAutoConf
  au!
  " CAUTION: WinLeave's current file is next file, i.e., fzf when opening fzf-buffer.
  au WinLeave,BufLeave * if &ft ==# 'fzf' | hide
  au WinLeave,BufLeave * if &ft ==# 'fzf' && &l:statusline == 0 | setl laststatus=2 showmode ruler
  " Note: Makes no sense but auto-set nonumber on tab-open.
  au FileType fzf setl laststatus=0 noruler | au BufEnter * ++once setl laststatus=2 ruler | if &ft !=# 'help' | setl number
augroup END

" [Buffers] Rather Jump to window than just to open.
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"" args: down/up/left/right
let g:fzf_layout = { 'down': '~20%' }

function! s:fzf_buffer_keymap() "{{{
  " Execute selected command
  let g:fzf_commands_expect = 'ctrl-r,ctrl-x'

  function! s:fzf_open_in_quickfix_list(lines) "{{{
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction "}}}
  " <alt-k> for cancel.
  " Note: seems not work with <alt> like <alt-k>.
  let g:fzf_action = {
        \ 'ctrl-z': '',
        \ 'ctrl-q': function('s:fzf_open_in_quickfix_list'),
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
imap <c-x><c-a> <plug>(fzf-complete-file-ag)
imap <c-x>a     <plug>(fzf-complete-file-ag)
" :FZF! starts fzf on full-window.

" CmdAbbr; {{{
cnoreabbr <silent><expr> fz (getcmdtype() == ':' && getcmdline() =~ '^fz$')? 'FZF' : 'fz'
cnoreabbr <silent><expr> zf (getcmdtype() == ':' && getcmdline() =~ '^zf$')? 'FZF' : 'zf'
cnoreabbr <silent><expr> rg (getcmdtype() == ':' && getcmdline() =~ '^rg$')? 'Rg' : 'rg'
cnoreabbr <silent><expr> ag (getcmdtype() == ':' && getcmdline() =~ '^ag$')? 'Ag' : 'ag'
"}}}
" Command! Ag/Rg/FZF {{{
command! -bang Nmaps call fzf#vim#maps("n", <bang>0)
command! -bang Imaps call fzf#vim#maps("i", <bang>0)
command! -bang Xmaps call fzf#vim#maps("x", <bang>0)
command! -bang Smaps call fzf#vim#maps("s", <bang>0)
command! -bang Vmaps call fzf#vim#maps("v", <bang>0)
command! -bang Cmaps call fzf#vim#maps("c", <bang>0)
command! -bang Omaps call fzf#vim#maps("o", <bang>0)

command! -bang -nargs=* Ghq :cd ~/.ghq <bar> FZF
"command! -bang -nargs=* FZF
"      \ call fzf#vim#files(<q-args>,
"      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"      \                         : fzf#vim#with_preview('right:50%'),
"      \                 <bang>0)
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

" There's no use trying to wrap 'GFiles?' independently
" because '?' is regarded as an arg for 'GFiles'.
command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
" TODO: preview around the selected lines.
"command! -bang -nargs=? -complete=dir BLines
"      \ call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
"}}}
" Keymap; Ag {{{
if executable('ag') == 0

  nnoremap <silent><nowait> <a-a> :<c-u>echo "You don't have executable 'silver searcher'"<cr>

else
  tnoremap <silent> <a-a><a-k> <c-u>cd ~/vimwiki/diary <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>k     <c-u>cd ~/vimwiki/diary <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-i> <c-u>cd ~/vimwiki       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>i     <c-u>cd ~/vimwiki       <c-\><c-n>: Ag<cr>

  tnoremap <silent> <a-a>      <c-u><c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-c> <c-u><c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>c     <c-u><c-\><c-n>: Ag<cr>

  tnoremap <silent> <a-a><a-r> <c-u>cd /usr/share/nvim/runtime<cr>                 <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>r     <c-u>cd /usr/share/nvim/runtime<cr>                 <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-.> <c-u>cd %:p:h<cr>                       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>.     <c-u>cd %:p:h<cr>                       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-w> <c-u>cd <space>                         <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>w     <c-u>cd <space>                         <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-h> <c-u>cd ~<cr>                           <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>h     <c-u>cd ~<cr>                           <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-o> <c-u>cd ~/org<cr>                       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>o     <c-u>cd ~/org<cr>                       <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-d> <c-u>cd ~/dotfiles<cr>                  <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>d     <c-u>cd ~/dotfiles<cr>                  <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-c> <c-u>cd ~/.cache<cr>                    <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>c     <c-u>cd ~/.cache<cr>                    <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-g> <c-u>cd ~/.config<cr>                   <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>g     <c-u>cd ~/.config<cr>                   <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-v> <c-u>cd ~/.config/nvim<cr>              <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>v     <c-u>cd ~/.config/nvim<cr>              <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a><a-l> <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>: Ag<cr>
  tnoremap <silent> <a-a>l     <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>: Ag<cr>

  nnoremap <silent> <a-a><a-k> :<c-u>cd ~/vimwiki/diary<cr> : Ag<cr>
  nnoremap <silent> <a-a>k     :<c-u>cd ~/vimwiki/diary<cr> : Ag<cr>

  nnoremap <silent> <a-a>      :<c-u> Ag<cr>
  nnoremap <silent> <a-a><a-c> :<c-u> Ag<cr>
  nnoremap <silent> <a-a>c     :<c-u> Ag<cr>

  nnoremap <silent> <a-a><a-r> :<c-u>cd /usr/share/nvim/runtime<cr>                           :Ag<cr>
  nnoremap <silent> <a-a>r     :<c-u>cd /usr/share/nvim/runtime<cr>                           :Ag<cr>
  nnoremap <silent> <a-a><a-w> :<c-u>cd %:p:h<cr>                       :Ag<cr>
  nnoremap <silent> <a-a>w     :<c-u>cd %:p:h<cr>                       :Ag<cr>
  nnoremap <silent> <a-a><a-.> :<c-u>   <space>                         :Ag<cr>
  nnoremap <silent> <a-a>.     :<c-u>   <space>                         :Ag<cr>
  nnoremap <silent> <a-a><a-h> :<c-u>cd ~<cr>                           :Ag<cr>
  nnoremap <silent> <a-a>h     :<c-u>cd ~<cr>                           :Ag<cr>
  nnoremap <silent> <a-a><a-o> :<c-u>cd ~/org<cr>                       :Ag<cr>
  nnoremap <silent> <a-a>o     :<c-u>cd ~/org<cr>                       :Ag<cr>
  nnoremap <silent> <a-a><a-d> :<c-u>cd ~/dotfiles<cr>                  :Ag<cr>
  nnoremap <silent> <a-a>d     :<c-u>cd ~/dotfiles<cr>                  :Ag<cr>
  nnoremap <silent> <a-a><a-c> :<c-u>cd ~/.cache<cr>                    :Ag<cr>
  nnoremap <silent> <a-a>c     :<c-u>cd ~/.cache<cr>                    :Ag<cr>
  nnoremap <silent> <a-a><a-g> :<c-u>cd ~/.config<cr>                   :Ag<cr>
  nnoremap <silent> <a-a>g     :<c-u>cd ~/.config<cr>                   :Ag<cr>
  nnoremap <silent> <a-a><a-v> :<c-u>cd ~/.config/nvim<cr>              :Ag<cr>
  nnoremap <silent> <a-a>v     :<c-u>cd ~/.config/nvim<cr>              :Ag<cr>
  nnoremap <silent> <a-a><a-l> :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Ag<cr>
  nnoremap <silent> <a-a>l     :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Ag<cr>

endif
"}}}
" Keymap; Ripgrep
if executable('rg') == v:false "{{{
  nnoremap <silent><nowait> <a-r> :<c-u>echo "You don't have executable 'ripgrep'"<cr>
else "}}}
  "" Rg; Just :Rg {{{
  tnoremap <silent> <a-r><a-c> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>c     <c-\><c-n>:<c-u> Rg<cr>
  "}}}
  "" Rg; on terminal w/ `cd` {{{
  tnoremap <silent> <a-r><a-k> <c-u>cd ~/vimwiki/diary    <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>k     <c-u>cd ~/vimwiki/diary    <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-r> <c-u>cd /usr/share/nvim/runtime<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>r     <c-u>cd /usr/share/nvim/runtime<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-.> <c-u>cd %:p:h<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>.     <c-u>cd %:p:h<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-w> <c-u>cd <space>            <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>w     <c-u>cd <space>            <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-h> <c-u>cd ~<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>h     <c-u>cd ~<cr>              <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-o> <c-u>cd ~/org<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>o     <c-u>cd ~/org<cr>          <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-d> <c-u>cd ~/dotfiles<cr>     <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>d     <c-u>cd ~/dotfiles<cr>     <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-c> <c-u>cd <c-r>=expand(g:dein_cache_dir)<cr><cr>       <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>c     <c-u>cd <c-r>=expand(g:dein_cache_dir)<cr><cr>       <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-g> <c-u>cd ~/.config<cr>      <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>g     <c-u>cd ~/.config<cr>      <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r><a-v> <c-u>cd ~/.config/nvim<cr> <c-\><c-n>: Rg<cr>
  tnoremap <silent> <a-r>v     <c-u>cd ~/.config/nvim<cr> <c-\><c-n>: Rg<cr>
  "}}}
  """ on Terminal; :Rg on help in the sense of `K` on normal mode {{{
  tnoremap <silent> <a-r><a-k> <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>k     <c-u>cd /usr/share/nvim/runtime/doc<cr> <c-\><c-n>:<c-u> Rg<cr>
  """" Help; on Plugins' help
  tnoremap <silent> <a-r><a-p> <c-u>cd expand(g:dein_cache_dir)<cr>    <c-\><c-n>:<c-u> Rg<cr>
  tnoremap <silent> <a-r>p     <c-u>cd expand(g:dein_cache_dir)<cr>    <c-\><c-n>:<c-u> Rg<cr>
  "}}}
  "" Rg; w/ `:cd` {{{
  nnoremap <silent> <a-r><a-k> :<c-u>cd ~/vimwiki/diary<cr>             :Rg<cr>
  nnoremap <silent> <a-r>k     :<c-u>cd ~/vimwiki/diary<cr>             :Rg<cr>
  nnoremap <silent> <a-r><a-r> :<c-u>cd /usr/share/nvim/runtime<cr>                           :Rg<cr>
  nnoremap <silent> <a-r>r     :<c-u>cd /usr/share/nvim/runtime<cr>                           :Rg<cr>
  nnoremap <silent> <a-r><a-w> :<c-u>cd %:p:h<cr>                       :Rg<cr>
  nnoremap <silent> <a-r>w     :<c-u>cd %:p:h<cr>                       :Rg<cr>
  nnoremap <silent> <a-r><a-.> :<c-u>   <space>                         :Rg<cr>
  nnoremap <silent> <a-r>.     :<c-u>   <space>                         :Rg<cr>
  nnoremap <silent> <a-r><a-h> :<c-u>cd ~<cr>                           :Rg<cr>
  nnoremap <silent> <a-r>h     :<c-u>cd ~<cr>                           :Rg<cr>
  nnoremap <silent> <a-r><a-o> :<c-u>cd ~/org<cr>                       :Rg<cr>
  nnoremap <silent> <a-r>o     :<c-u>cd ~/org<cr>                       :Rg<cr>
  nnoremap <silent> <a-r><a-d> :<c-u>cd ~/dotfiles<cr>                  :Rg<cr>
  nnoremap <silent> <a-r>d     :<c-u>cd ~/dotfiles<cr>                  :Rg<cr>
  nnoremap <silent> <a-r><a-c> :<c-u>cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :Rg<cr>
  nnoremap <silent> <a-r>c     :<c-u>cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :Rg<cr>
  nnoremap <silent> <a-r><a-g> :<c-u>cd ~/.config<cr>                   :Rg<cr>
  nnoremap <silent> <a-r>g     :<c-u>cd ~/.config<cr>                   :Rg<cr>
  nnoremap <silent> <a-r><a-v> :<c-u>cd ~/.config/nvim<cr>              :Rg<cr>
  nnoremap <silent> <a-r>v     :<c-u>cd ~/.config/nvim<cr>              :Rg<cr>
  "}}}
  """ w/ `:cd` on Help {{{
  nnoremap <silent> <a-r><a-l> :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Rg<cr>
  nnoremap <silent> <a-r>l     :<c-u>cd /usr/share/nvim/runtime/doc<cr> :Rg<cr>
  """" Help; on Plugins' help
  nnoremap <silent> <a-r><a-p> <c-u>cd expand(g:dein_cache_dir)<cr>    :Rg<cr>
  nnoremap <silent> <a-r>p     <c-u>cd expand(g:dein_cache_dir)<cr>    :Rg<cr>
endif
"}}}
" Keymap; FZF
"" FZF; w/ cd {{{
tnoremap <silent> <a-q><a-h> <c-u>cd ~<cr>               <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q>h     <c-u>cd ~<cr>               <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q><a-d> <c-u>cd ~/dotfiles<cr>      <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q>d     <c-u>cd ~/dotfiles<cr>      <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q><a-v> <c-u>cd ~/dotfiles/nvim<cr> <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q>v     <c-u>cd ~/dotfiles/nvim<cr> <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q><a-c> :<c-u> cd <c-r>=expand(g:dein_cache_dir)<cr><cr> <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q>c     :<c-u> cd <c-r>=expand(g:dein_cache_dir)<cr><cr> <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q><a-f> :<c-u> cd ~/.config<cr> <c-\><c-n> :FZF<cr>
tnoremap <silent> <a-q>f     :<c-u> cd ~/.config<cr> <c-\><c-n> :FZF<cr>

nnoremap <silent> <a-q><a-r> :<c-u> cd /usr/share/nvim/runtime <cr> :FZF<cr>
nnoremap <silent> <a-q>r     :<c-u> cd /usr/share/nvim/runtime <cr> :FZF<cr>
nnoremap <silent> <a-q><a-h> :<c-u> cd ~               <cr> :FZF<cr>
nnoremap <silent> <a-q>h     :<c-u> cd ~               <cr> :FZF<cr>
nnoremap <silent> <a-q><a-d> :<c-u> cd ~/dotfiles      <cr> :FZF<cr>
nnoremap <silent> <a-q>d     :<c-u> cd ~/dotfiles      <cr> :FZF<cr>
nnoremap <silent> <a-q><a-v> :<c-u> cd ~/dotfiles/nvim <cr> :FZF<cr>
nnoremap <silent> <a-q>v     :<c-u> cd ~/dotfiles/nvim <cr> :FZF<cr>
nnoremap <silent> <a-q><a-c> :<c-u> cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :FZF<cr>
nnoremap <silent> <a-q>c     :<c-u> cd <c-r>=expand(g:dein_cache_dir)<cr><cr> :FZF<cr>
nnoremap <silent> <a-q><a-f> :<c-u> cd ~/.config      <cr> :FZF<cr>
nnoremap <silent> <a-q>f     :<c-u> cd ~/.config      <cr> :FZF<cr>
" Mnemonic: Current Directory
nnoremap <silent> <a-q><a-.> :<c-u> <space> <space> FZF<cr>
nnoremap <silent> <a-q>.     :<c-u> <space> <space> FZF<cr>
" Mnemonic: Working Directory
nnoremap <silent> <a-q><a-w> :<c-u> cd %:p:h <cr> :FZF<cr>
nnoremap <silent> <a-q>w     :<c-u> cd %:p:h <cr> :FZF<cr>
"}}}
"" FZF; Various {{{
tnoremap <silent> <a-q><a-w> <c-\><c-n>: FZF<cr>
tnoremap <silent> <a-q>w     <c-\><c-n>: FZF<cr>

" BLines; instead of `/-search`
tnoremap <silent> <a-q>q     <c-\><c-n>: BLines<cr>
tnoremap <silent> <a-q><a-q> <c-\><c-n>: BLines<cr>
tnoremap <silent> <a-q><a-b> <c-\><c-n>: Buffers<cr>
tnoremap <silent> <a-q>b     <c-\><c-n>: Buffers<cr>
tnoremap <silent> <a-q><a-k> <c-\><c-n>: Helptags<cr>
tnoremap <silent> <a-q>k     <c-\><c-n>: Helptags<cr>
tnoremap <silent> <a-q><a-g> <c-\><c-n>: GFiles?<cr>
tnoremap <silent> <a-q>g     <c-\><c-n>: GFiles?<cr>

"noremap <silent> <a-q><a-b> :<c-u> Buffers<cr>
"noremap <silent> <a-q>b     :<c-u> Buffers<cr>
nnoremap <silent> <a-q><a-k> :<c-u> Helptags<cr>
nnoremap <silent> <a-q>k     :<c-u> Helptags<cr>
nnoremap <silent> <a-q><a-g> :<c-u> GFiles?<cr>
nnoremap <silent> <a-q>g     :<c-u> GFiles?<cr>
"" Mnemonic: 'Old' Buffer
nnoremap <silent> <a-q><a-o> :<c-u> History<cr>
nnoremap <silent> <a-q>o     :<c-u> History<cr>
"" Marks: Useless?
"noremap <silent> <a-q><a-m> :<c-u> Marks<cr>
"noremap <silent> <a-q>m     :<c-u> Marks<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <a-q><a-q> :<c-u> BLines<cr>
nnoremap <silent> <a-q>q     :<c-u> BLines<cr>
nnoremap <silent> <a-q><a-/> :<c-u> BLines<cr>
nnoremap <silent> <a-q>/     :<c-u> BLines<cr>
nnoremap <silent> <a-q><a-;> :<c-u> Commands<cr>
nnoremap <silent> <a-q>;     :<c-u> Commands<cr>
