scriptencoding utf-8
" From: init.vim

" Prevention; before fzf.vim {{{
let s:phrase_neither_rg_nor_ag = "You don't have executable 'ripgrep' nor 'silver searcher.'"
let s:phrase_neither_fzf = "You don't have executable 'fzf.'"

if !executable('ag') && !executable('rg')
  tnoremap <silent> <a-r> <c-\><c-n>:echo "You don't have executable 'ripgrep' nor 'silver searcher.'"<cr>
  tnoremap <silent> <a-q> <c-\><c-n>:echo "You don't have any executable fuzzy finder.'"<cr>
  nnoremap <silent> <a-r> :<c-u>echo "You don't have executable 'ripgrep' nor 'silver searcher.'"<cr>
  nnoremap <silent> <a-q> :<c-u>echo "You don't have any executable fuzzy finder.'"<cr>
endif
"}}}

" cd; N/P Directory {{{
tnoremap <a-i> cd - > /dev/null <CR>
tnoremap <a-o> cd .. <CR>
nnoremap <silent> <a-w>i     :<c-u>cd -<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>o     :<c-u>cd ..<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Simply echo; Current Directory
nnoremap <silent> <a-w>.     :<c-u> echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w><a-.> :<c-u> echo '$CWD is "' . getcwd() . '"'<cr>
"" Temp Directory
nnoremap <silent> <a-w>t     :<c-u>cd ~/.tmp<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Working Directory
nnoremap <silent> <a-w><a-w> :<c-u>cd %:p:h<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Root Directory
nnoremap <silent> <a-w>r     :<c-u>cd /<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" $HOME
nnoremap <silent> <a-w>h     :<c-u>cd ~<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" XDG_CACHE_HOME
nnoremap <silent> <a-w>c     :<c-u>cd ~/.cache<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" XDG_CONFIG_HOME
nnoremap <silent> <a-w>f     :<c-u>cd ~/.config<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Dotfiles
nnoremap <silent> <a-w>d     :<c-u>cd ~/dotfiles<cr>:echo 'cd "' . getcwd() . '"'<cr>
"}}}
" Improved; Jump {{{
"" Buffer; to the Last
noremap <c-6> <c-^>
""" Tags; to Newest
" :silent! to supress 'E556: at top of tag stack'
nnoremap <silent> <c-q> :silent! $tag<cr>

"" Jump; Search
" researched word will come up at middle of current window.
nnoremap <nowait> n   nzz
nnoremap <nowait> N   Nzz
"}}}
" Hotkey; Open Terminal {{{
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
" Hotkey; Open Terminal with `cd` {{{
noremap <silent> <a-t>w     :<c-u>cd %:p:h      <bar>:te<cr>
noremap <silent> <a-t>h     :<c-u>cd ~          <bar>:te<cr>
noremap <silent> <a-t>d     :<c-u>cd ~/dotfiles <bar>:te<cr>
noremap <silent> <a-t>c     :<c-u>cd ~/.config  <bar>:te<cr>
noremap <silent> <a-t><a-w> :<c-u>cd %:p:h      <bar>:te<cr>
noremap <silent> <a-t><a-h> :<c-u>cd ~          <bar>:te<cr>
noremap <silent> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>:te<cr>
noremap <silent> <a-t><a-c> :<c-u>cd ~/.config  <bar>:te<cr>
"}}}
" Hotkey; cd in Terminal {{{
tnoremap <silent> <a-t>r cd /          <cr>
tnoremap <silent> <a-t>h cd ~/         <cr>
tnoremap <silent> <a-t>d cd ~/dotfiles <cr>
tnoremap <silent> <a-t>f cd ~/.config  <cr>
tnoremap <silent> <a-t>c cd ~/.cache   <cr>
"}}}

" Switch; Pane
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
" avoid a stack on command-line
cnoremap <a-k> <c-c>

" Switch; Tab Page
"" Move between Tabs
nnoremap <a-]> gt
nnoremap <a-[> gT
inoremap <a-[> <esc>gT
inoremap <a-]> <esc>gt
tnoremap <a-]> <c-\><c-n>gt
tnoremap <a-[> <c-\><c-n>gT
" Note: <c-w>b/<c-b> is a :wincmd to bottom.

nnoremap <c-p> <Cmd>bprev<cr>
nnoremap <c-n> <Cmd>bnext<cr>
