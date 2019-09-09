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
nnoremap <silent> <a-w><a-i> :<c-u>cd -<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>i     :<c-u>cd -<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w><a-o> :<c-u>cd ..<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>o     :<c-u>cd ..<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Simply echo; Current Directory
nnoremap <silent> <a-w><a-w> :<c-u> echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>w     :<c-u> echo '$CWD is "' . getcwd() . '"'<cr>
"" Temp Directory
nnoremap <silent> <a-w><a-t> :<c-u>cd ~/.tmp<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>t     :<c-u>cd ~/.tmp<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Working Directory
nnoremap <silent> <a-w><a-.> :<c-u>cd %:p:h<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>.     :<c-u>cd %:p:h<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Root Directory
nnoremap <silent> <a-w><a-r> :<c-u>cd /<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>r     :<c-u>cd /<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" $HOME
nnoremap <silent> <a-w><a-h> :<c-u>cd ~<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>h     :<c-u>cd ~<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" XDG_CACHE_HOME
nnoremap <silent> <a-w><a-c> :<c-u>cd ~/.cache<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>c     :<c-u>cd ~/.cache<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" XDG_CONFIG_HOME
nnoremap <silent> <a-w><a-f> :<c-u>cd ~/.config<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>f     :<c-u>cd ~/.config<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Dotfiles
nnoremap <silent> <a-w><a-d> :<c-u>cd ~/dotfiles<cr>:echo 'cd "' . getcwd() . '"'<cr>
nnoremap <silent> <a-w>d     :<c-u>cd ~/dotfiles<cr>:echo 'cd "' . getcwd() . '"'<cr>
"" Org-Mode
"nnoremap <silent> <a-w><a-o> :<c-u>cd ~/org<cr>:echo 'cd "' . getcwd() . '"'<cr>
"nnoremap <silent> <a-w>o     :<c-u>cd ~/org<cr>:echo 'cd "' . getcwd() . '"'<cr>
"}}}
" Adjusted; hjkl {{{
" move as it looks.
nnoremap j gj
nnoremap k gk
"xnoremap j gj
"xnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k
"xnoremap gj j
"xnoremap gk k
"}}}
" Improved; Jump {{{
"" Buffer; to the Last
noremap <c-6> <c-^>
"" Jump; via Tags
" g<c-]>: show a list of tags only if <cword> has more than two tags.
noremap <c-]> g<c-]>zz
noremap <silent> g<c-]> :<c-u>vert stjump <c-r><c-w><CR>zz
""" Tags; to Newest
" :silent! to supress 'E556: at top of tag stack'
nnoremap <silent> <c-q> :silent! $tag<cr>
"" Jump; to Definition
noremap gf gF
noremap gF gf
" Note: gD to jump on *the first line* of the file that has the definition.
"noremap gd gD
"noremap gD gd
"" Jump; Search
" researched word will come up at middle of current window.
noremap <nowait> n   nzz
noremap <nowait> N   Nzz
" Ref: asterisk.vimrc
"noremap *   *zz
"noremap #   #zz
"noremap g* g*zz
"noremap g# g#zz
"}}}
" Hotkey; Open Terminal {{{
noremap <silent> <a-t><a-.> :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t><a-e> :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t><a-s> :<c-u>sp   <bar>   <space> :te<cr>
noremap <silent> <a-t><a-l> :<c-u>bot 10 sp    <bar>   <space> te<cr>
noremap <silent> <a-t><a-v> :<c-u>vs   <bar>   <space> :te<cr>
noremap <silent> <a-t><a-b> :<c-u>tabe sp      <bar>   :te<cr>
noremap <silent> <a-t>e     :<c-u>     <space> <space> :te<cr>
noremap <silent> <a-t>s     :<c-u>sp   <bar>   <space> :te<cr>
noremap <silent> <a-t>v     :<c-u>vs   <bar>   <space> :te<cr>
noremap <silent> <a-t>t     :<c-u>tabe sp      <bar>   :te<cr>
"}}}
" Hotkey; Open Terminal with `cd` {{{
noremap <silent> <a-t><a-w> :<c-u>cd %:p:h      <bar>:te<cr>
noremap <silent> <a-t>w     :<c-u>cd %:p:h      <bar>:te<cr>
noremap <silent> <a-t><a-h> :<c-u>cd ~          <bar>:te<cr>
noremap <silent> <a-t><a-o> :<c-u>cd ~/org      <bar>:te<cr>
noremap <silent> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>:te<cr>
noremap <silent> <a-t><a-c> :<c-u>cd ~/.config  <bar>:te<cr>
noremap <silent> <a-t>h     :<c-u>cd ~          <bar>:te<cr>
noremap <silent> <a-t>o     :<c-u>cd ~/org      <bar>:te<cr>
noremap <silent> <a-t>d     :<c-u>cd ~/dotfiles <bar>:te<cr>
noremap <silent> <a-t>c     :<c-u>cd ~/.config  <bar>:te<cr>
"}}}
" Hotkey; cd in Terminal {{{
tnoremap <silent> <a-t><a-r> cd /          <cr>
tnoremap <silent> <a-t><a-o> cd ~/org      <cr>
tnoremap <silent> <a-t><a-d> cd ~/dotfiles <cr>
tnoremap <silent> <a-t><a-f> cd ~/.config  <cr>
tnoremap <silent> <a-t><a-c> cd ~/.cache   <cr>
tnoremap <silent> <a-t>r     cd /          <cr>
tnoremap <silent> <a-t>h     cd ~/         <cr>
tnoremap <silent> <a-t>o     cd ~/org      <cr>
tnoremap <silent> <a-t>d     cd ~/dotfiles <cr>
tnoremap <silent> <a-t>f     cd ~/.config  <cr>
tnoremap <silent> <a-t>c     cd ~/.cache   <cr>
"}}}

" Switch; Pane
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
xnoremap <a-h> <esc><c-w>h
xnoremap <a-j> <esc><c-w>j
xnoremap <a-k> <esc><c-w>k
xnoremap <a-l> <esc><c-w>l
"nnoremap <a-b> <c-w>b
"nnoremap <a-t> <c-w>t
" avoid stack on command-line
cnoremap <a-k> <c-c>

" Switch; Tab Page
"" Move between Tabs
nnoremap <a-]> gt
nnoremap <a-[> gT
inoremap <a-[> <esc>gT
inoremap <a-]> <esc>gt
tnoremap <a-]> <c-\><c-n>gt
tnoremap <a-[> <c-\><c-n>gT
