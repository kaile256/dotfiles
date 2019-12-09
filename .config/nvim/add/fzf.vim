" From: finder.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Another: source/fzf.vim
" Another: post/fzf.vim

" TODO: override on-going fzf-buffer
"nnoremap <silent> <space>z :call system('killall fzf') <bar> call feedkeys("\<space>z", 'x')<cr>

command! -bang -nargs=* Fzf :Files <args>

command! -bang -nargs=* Polybars
      \ :cd ~/.config/polybar
      \ | call fzf#vim#ag(<q-args>, fzf#vim#with_preview({
      \ 'options': '--multi --reverse'
      \ }, 'right:50%')
      \ )

command! -bang -nargs=* Downloads
      \ :call fzf#vim#files(<q-args>, fzf#vim#with_preview({
      \ 'source': 'find '. $HOME .'/Downloads',
      \ 'options': '--multi --reverse'
      \ }, 'right:50%')
      \ )

command! -bang -nargs=* Etcs
      \ :call fzf#vim#files(<q-args>, fzf#vim#with_preview({
      \ 'source': 'find /etc',
      \ 'options': '--multi --reverse',
      \ }, 'right:50%')
      \ )

" TODO: avoid all the files permission-denied
command! -bang -nargs=* Users
      \ :call fzf#vim#files(<q-args>, fzf#vim#with_preview({
      \ 'source': 'find /usr',
      \ 'options': '--multi --reverse',
      \ }, 'right:50%')
      \ )

" Note: not actually in ghq
command! -bang -nargs=* Ghqs
      \ :silent cd $GOPATH
      \ | Fzf <args>

command! -bang Functions
      \ :call fzf#vim#functions({'options': '--multi --reverse'})
" TODO: show preview as :function shows
      "\ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%:wrap'),
      "\ <bang>0)

" TODO: selector of terminal-buffer.
command! -bang -nargs=* -complete=buffer Terminal
      \ call fzf#vim#buffers(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:65%'),
      \                 <bang>0)

command! Neighbours call s:fzf_neighbours() "{{{1
function! s:fzf_neighbours()
  let current_file = expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#vim#files('', fzf#vim#with_preview({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '--multi --extended --no-sort',
        \ })
        \ )
endfunction
"nnoremap <silent> <space>zn :<c-u>Neighbours<cr>

" Command: Maps {{{1
" TODO: set options reverse
command! -bang -nargs=* Amaps call fzf#vim#maps('',  <bang>0)
command! -bang -nargs=* Nmaps call fzf#vim#maps('n', <bang>0)
command! -bang -nargs=* Imaps call fzf#vim#maps('i', <bang>0)
command! -bang -nargs=* Xmaps call fzf#vim#maps('x', <bang>0)
command! -bang -nargs=* Smaps call fzf#vim#maps('s', <bang>0)
command! -bang -nargs=* Vmaps call fzf#vim#maps('v', <bang>0)
command! -bang -nargs=* Cmaps call fzf#vim#maps('c', <bang>0)
command! -bang -nargs=* Omaps call fzf#vim#maps('o', <bang>0)
command! -bang -nargs=* Tmaps call fzf#vim#maps('t', <bang>0)

" Command: shortcut {{{1
command! -bang -nargs=* Cmds :Commands
" Note: :Cmaps isn't so often needed.
command! -bang -nargs=* Cm   :Commands

command! Co :Colors

command! H :Helptags
command! He :Helptags
command! Hel :Helptags
command! Help :Helptags

" Command: wiki {{{1
" Note: the commands below are all wrapper,
"       so that they must be loaded on hook_add.
command! AgWiki  :cd ~/vimwiki                   <bar> Ag
command! RgWiki  :cd ~/vimwiki                   <bar> Rg
command! AgDiary :cd ~/vimwiki/diary             <bar> Ag
command! RgDiary :cd ~/vimwiki/diary             <bar> Rg
command! AgHelp  :cd /usr/share/nvim/runtime/doc <bar> Ag
command! RgHelp  :cd /usr/share/nvim/runtime/doc <bar> Rg

" Keymaps {{{1
"imap <c-x><c-f> <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)
"imap <c-x>f     <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)

nnoremap <silent> <space>zb :<c-u> Buffers<cr>
nnoremap <silent> <space>zG :<c-u> Gfiles<cr>
nnoremap <silent> <space>zg :<c-u> Gfiles?<cr>
"" Mnemonic: 'Old' Buffer
nnoremap <silent> <space>zo :<c-u> History<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <space>z/ :<c-u> BLines<cr>
nnoremap <silent> <space>z; :<c-u> History:<cr>

