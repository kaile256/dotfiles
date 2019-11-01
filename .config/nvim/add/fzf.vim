" From: finder.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Rev: kaile256/fzf.vim_verbose_commands
" Another: source/fzf.vim
" Another: post/fzf.vim

command! -bang -nargs=* Fzf :Files

" Note: not actually in ghq
command! -bang -nargs=* Ghq :cd $GOPATH <bar> FZF
" Mnemonic: Quest for Project
nnoremap <a-q><a-p> :Ghq<cr>
nnoremap <a-q>p     :Ghq<cr>

" Command: Maps {{{
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
"}}}

command! -bang Functions :call fzf#vim#functions({'options': '--multi --reverse'})
      "\ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%:wrap'),
      "\ <bang>0)

" Note: the commands below are all wrapper,
"       so that they must be loaded on hook_add.
command! AgWiki  :cd ~/vimwiki                   <bar> Ag
command! RgWiki  :cd ~/vimwiki                   <bar> Rg
command! AgDiary :cd ~/vimwiki/diary             <bar> Ag
command! RgDiary :cd ~/vimwiki/diary             <bar> Rg
command! AgHelp  :cd /usr/share/nvim/runtime/doc <bar> Ag
command! RgHelp  :cd /usr/share/nvim/runtime/doc <bar> Rg

command! -bang -nargs=* Cmds :Commands
" Note: :Cmaps isn't so often needed.
command! -bang -nargs=* Cm   :Commands

command! Co :Colors

command! H :Helptags
command! He :Helptags
command! Hel :Helptags
command! Help :Helptags

" Keymaps {{{1
imap <c-x><c-f> <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)
imap <c-x>f     <c-o>:cd ~<cr><plug>(fzf-complete-file-ag)

nnoremap <silent> <space>zb :<c-u> Buffers<cr>
nnoremap <silent> <space>zG :<c-u> Gfiles<cr>
nnoremap <silent> <space>zg :<c-u> Gfiles?<cr>
"" Mnemonic: 'Old' Buffer
nnoremap <silent> <space>zo :<c-u> History<cr>
"" Mnemonic: Search in Current File
nnoremap <silent> <space>z/ :<c-u> BLines<cr>
nnoremap <silent> <space>z; :<c-u> History:<cr>

