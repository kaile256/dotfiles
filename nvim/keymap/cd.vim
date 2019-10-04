" From: init.vim

" N/P Directory {{{
tnoremap <a-i> cd - <CR>
tnoremap <a-o> cd .. <CR>

command! EchoCwd :echo 'cd '. getcwd()

nnoremap <silent> <a-w>i     :<c-u>cd - <bar>EchoCwd<cr>
nnoremap <silent> <a-w>o     :<c-u>cd .. <bar>EchoCwd<cr>

"" Simply echo; Current Directory
nnoremap <silent> <a-w>.     :<c-u>echo 'cwd is '. getcwd()<cr>
nnoremap <silent> <a-w><a-.> :<c-u>echo 'cwd is '. getcwd()<cr>

"" Working Directory
nnoremap <silent> <a-w><a-w> :<c-u>cd %:p:h      <bar>EchoCwd<cr>
nnoremap <silent> <a-w>w     :<c-u>cd %:p:h      <bar>EchoCwd<cr>
"" Temp Directory
nnoremap <silent> <a-w>t     :<c-u>cd ~/.tmp     <bar>EchoCwd<cr>
nnoremap <silent> <a-w><a-t> :<c-u>cd ~/.tmp     <bar>EchoCwd<cr>
"" Root Directory
nnoremap <silent> <a-w>r     :<c-u>cd /          <bar>EchoCwd<cr>
nnoremap <silent> <a-w><a-r> :<c-u>cd /          <bar>EchoCwd<cr>
"" $HOME
nnoremap <silent> <a-w>h     :<c-u>cd ~          <bar>EchoCwd<cr>
nnoremap <silent> <a-w><a-h> :<c-u>cd ~          <bar>EchoCwd<cr>
"" XDG_CACHE_HOME
nnoremap <silent> <a-w>c     :<c-u>cd ~/.cache   <bar>EchoCwd<cr>

nnoremap <silent> <a-w><a-c> :<c-u>cd ~/.cache   <bar>EchoCwd<cr>
"" XDG_CONFIG_HOME
nnoremap <silent> <a-w>f     :<c-u>cd ~/.config  <bar>EchoCwd<cr>
nnoremap <silent> <a-w><a-f> :<c-u>cd ~/.config  <bar>EchoCwd<cr>
"" Dotfiles
nnoremap <silent> <a-w>d     :<c-u>cd ~/dotfiles <bar>EchoCwd<cr>
nnoremap <silent> <a-w><a-d> :<c-u>cd ~/dotfiles <bar>EchoCwd<cr>

"" Dev Root
nnoremap <silent> <a-w>p     :<c-u>cd <c-r>=expand(g:dev_root)<cr> <bar>EchoCwd<cr>
nnoremap <silent> <a-w><a-p> :<c-u>cd <c-r>=expand(g:dev_root)<cr> <bar>EchoCwd<cr>

"}}}
" Open Terminal {{{
noremap <silent> <a-t>.     :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t>e     :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t>s     :<c-u>sp   <bar>   <space> :te<cr>
noremap <silent> <a-t>v     :<c-u>vs   <bar>   <space> :te<cr>
noremap <silent> <a-t>t     :<c-u>tabe sp      <bar>   :te<cr>
noremap <silent> <a-t><a-.> :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t><a-e> :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t><a-s> :<c-u>sp   <bar>   <space> :te<cr>
noremap <silent> <a-t><a-v> :<c-u>vs   <bar>   <space> :te<cr>
noremap <silent> <a-t><a-t> :<c-u>tabe sp      <bar>   :te<cr>
"}}}
" Open Terminal with `cd` {{{
noremap <silent> <a-t>w     :<c-u>cd %:p:h      <bar>:te<cr>
noremap <silent> <a-t>h     :<c-u>cd ~          <bar>:te<cr>
noremap <silent> <a-t>d     :<c-u>cd ~/dotfiles <bar>:te<cr>
noremap <silent> <a-t>c     :<c-u>cd ~/.config  <bar>:te<cr>
noremap <silent> <a-t><a-w> :<c-u>cd %:p:h      <bar>:te<cr>
noremap <silent> <a-t><a-h> :<c-u>cd ~          <bar>:te<cr>
noremap <silent> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>:te<cr>
noremap <silent> <a-t><a-c> :<c-u>cd ~/.config  <bar>:te<cr>
"}}}
" cd in Terminal {{{
tnoremap <silent> <a-t>r cd /          <cr>
tnoremap <silent> <a-t>h cd ~/         <cr>
tnoremap <silent> <a-t>d cd ~/dotfiles <cr>
tnoremap <silent> <a-t>f cd ~/.config  <cr>
tnoremap <silent> <a-t>c cd ~/.cache   <cr>
"}}}
