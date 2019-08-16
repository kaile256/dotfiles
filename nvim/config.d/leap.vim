"""" Memo: leap.org
"""" From: init.vim

"""" CONFIG
" cursor position of column is kept on jump.
set nostartofline
" jump ignoring unwritten buffers.
set hidden

""" Search
set noignorecase
" sensitive to case only with upper case.
"set smartcase 
set incsearch
set hlsearch
set nowrapscan
" fold all lines unmatched on {pattern}.
" CAUTION: foldable is apt to collapse format.
set nofoldenable

"""" KEYMAP
""" Org
nnoremap <silent> <a-q><a-o> :<c-u>e  ~/org/notes.org <cr>
nnoremap <silent> <a-q>o     :<c-u>e  ~/org/notes.org <cr>
nnoremap <silent> <a-q><a-e> :<c-u>e  ~/org/notes.org <cr>
nnoremap <silent> <a-q>e     :<c-u>e  ~/org/notes.org <cr>
nnoremap <silent> <a-q><a-v> :<c-u>vs ~/org/notes.org <cr>
nnoremap <silent> <a-q>v     :<c-u>vs ~/org/notes.org <cr>
nnoremap <silent> <a-q><a-s> :<c-u>sp ~/org/notes.org <cr>
nnoremap <silent> <a-q>s     :<c-u>sp ~/org/notes.org <cr>
"" On Term-Mode
tnoremap <silent> <a-q><a-o> <c-u>nvr ~/org/notes.org <cr>
tnoremap <silent> <a-q>o     <c-u>nvr ~/org/notes.org <cr>
tnoremap <silent> <a-q><a-e> <c-u>nvr ~/org/notes.org <cr>
tnoremap <silent> <a-q>e     <c-u>nvr ~/org/notes.org <cr>

""" Current Directory
nnoremap <a-w><a-w> :cd %:p:h<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>c     :cd %:p:h<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Root Directory
nnoremap <a-w><a-r> :cd /<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>r     :cd /<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" $HOME
nnoremap <a-w><a-h> :cd ~<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>h     :cd ~<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" XDG_CACHE_HOME
nnoremap <a-w><a-a> :cd ~/.cache<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>a     :cd ~/.cache<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" XDG_CONFIG_HOME
nnoremap <a-w><a-g> :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>g     :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w><a-f> :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>f     :cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Dotfiles
nnoremap <a-w><a-d> :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>d     :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w><a-.> :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>.     :cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Org-Mode
nnoremap <a-w><a-o> :cd ~/org<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>o     :cd ~/org<cr>:echo '$CWD is "' . getcwd() . '"'<cr>

""" hjkl
" move as it looks.
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
" switch mapping.
nnoremap gj j
nnoremap gk k
xnoremap gj j
xnoremap gk k

""" Advanced jk/HML
"" Definition
noremap <Plug>(leap-in-win-higher) :<c-u><c-r>= (line('w0') + line('.'))/2<cr><cr>
noremap <Plug>(leap-in-win-middle) :<c-u><c-r>= (line('w0') + line('w$') + 2*line('.'))/4<cr><cr>
noremap <Plug>(leap-in-win-lower)  :<c-u><c-r>= (line('w$') + line('.') + 1)/2<cr><cr>
noremap <Plug>(shift-to-middle)    :<c-u>call cursor(line('.'),col('$')/2)<cr>

"noremap <Plug>(leap-in-more-top) :<c-u>call cursor((5*line('w0') + line('w$')) /6, col('.'))<cr>
"noremap <Plug>(leap-in-less-top) :<c-u>call cursor((2*line('w0') + line('w$')) /3, col('.'))<cr> 
"noremap <Plug>(leap-in-less-btm) :<c-u>call cursor((line('w0') + 2*line('w$')) /3, col('.'))<cr>
"noremap <Plug>(leap-in-more-btm) :<c-u>call cursor((line('w0') + 5*line('w$')) /6, col('.'))<cr>

"nmap <silent> <c-h><c-h> <Plug>(leap-in-top)
"nmap <silent> <c-k><c-k> <Plug>(leap-in-top)
"nmap <silent> <c-h><c-k> <Plug>(leap-in-more-top)
"nmap <silent> <c-k><c-h> <Plug>(leap-in-more-top)
"nmap <silent> <c-k><c-j> <Plug>(leap-in-half-top)
"nmap <silent> <c-l><c-k> <Plug>(leap-in-less-top)
"nmap <silent> <c-k><c-l> <Plug>(leap-in-less-top)
"nmap <silent> <c-h><c-l> <Plug>(leap-in-mid)
"nmap <silent> <c-l><c-h> <Plug>(leap-in-mid)
"nmap <silent> <c-l><c-j> <Plug>(leap-in-less-btm)
"nmap <silent> <c-j><c-l> <Plug>(leap-in-less-btm)
"nmap <silent> <c-j><c-k> <Plug>(leap-in-half-btm)
"nmap <silent> <c-h><c-j> <Plug>(leap-in-more-btm)
"nmap <silent> <c-j><c-h> <Plug>(leap-in-more-btm)
"nmap <silent> <c-l><c-l> <Plug>(leap-in-btm)
"nmap <silent> <c-j><c-j> <Plug>(leap-in-btm)

" CAUTION: <c-m> is identical with <cr>; <c-,>/<c-.> does't work.
" <c-hjkl> get along with <c-fbud>; <a-hjkl> get along with <s-wbe>.

nmap <silent> <c-h> <Plug>(leap-in-win-middle)
nmap <silent> <c-j> <Plug>(leap-in-win-lower)
nmap <silent> <c-k> <Plug>(leap-in-win-higher)
nmap <silent> <c-l> <Plug>(shift-to-middle)

"nmap <silent> <c-h> <Plug>(leap-in-more-top)
"nmap <silent> <c-j> <Plug>(leap-in-less-top)
"nmap <silent> <c-k> <Plug>(leap-in-less-btm)
"nmap <silent> <c-l> <Plug>(leap-in-more-btm)

vmap <silent> <c-h> <Plug>(leap-in-win-middle)
vmap <silent> <c-j> <Plug>(leap-in-win-lower)
vmap <silent> <c-k> <Plug>(leap-in-win-higher)
vmap <silent> <c-l> <Plug>(shift-to-middle)

omap <silent> <c-h> <Plug>(leap-in-win-middle)
omap <silent> <c-j> <Plug>(leap-in-win-lower)
omap <silent> <c-k> <Plug>(leap-in-win-higher)
omap <silent> <c-l> <Plug>(shift-to-middle)

""" Pane
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

"nnoremap <a-b> <c-w>b
"nnoremap <a-t> <c-w>t
" avoid stack on command-line
cnoremap <a-k> <ESC>

""" Tab Page
"" Move between Tabs
nnoremap <a-]> gt
nnoremap <a-[> gT
tnoremap <a-]> <c-\><c-n>gt
tnoremap <a-[> <c-\><c-n>gT
"nnoremap <silent> <a-t><a-o> :tabonly<cr>
"" Give Tab
"nnoremap <a-t><c-g> <c-w>T

""" Go-To
"" Help
"noremap <silent> gh :h <c-r>=<cWORD><cr>

"" Man
"noremap <silent> gm :Man <c-r>=<cWORD><CR>

"" File-Path
" switch mapping
noremap gf gF
noremap gF gf
"noremap gd gD
"noremap gD gd

""” Research
"" TODO: setlocal show result w/ no-file path but only file name.
"" Grep to QuickFix  # no dirty-hist # Good enough with fzf.vim.
"nnoremap <space>/ :silent vimgrep  % <bar> cw<Left,<Left,<Left,<Left><Left><Left><Left>

"" Dot-Repeat
nnoremap <a-n> .n
nnoremap <a-;> .;
nnoremap <a-,> .,
" researched word will come up at middle of current window.
noremap n   nzz
noremap N   Nzz
noremap *   *zz
noremap #   #zz
noremap g* g*zz
noremap g# g#zz

""" Tag
"" Show List
" g<c-]>: show list of tags only when there are more than two tags.
noremap <c-]> g<c-]>zz

"" Newest Tag
" silent! to supress 'E556: at top of tag stack'
nnoremap <silent> <c-q> :silent! $tag<cr>

"" Newer Tag
"noremap <silent> <c-n> :tag<cr>
"" Older Tag -- same as <c-t>
"noremap <silent> <c-p> :pop<cr>

""" Terminal
"" Normal Mode
"" Open Shortcut
nnoremap <silent> <a-t><a-h> :<c-u>cd ~          <bar>:te<cr>
nnoremap <silent> <a-t><a-o> :<c-u>cd ~/org      <bar>:te<cr>
nnoremap <silent> <a-t><a-.> :<c-u>cd ~/dotfiles <bar>:te<cr>
nnoremap <silent> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>:te<cr>
nnoremap <silent> <a-t><a-g> :<c-u>cd ~/.config  <bar>:te<cr>
nnoremap <silent> <a-t><a-w> :<c-u>cd %:p:h      <bar>:te<cr>
nnoremap <silent> <a-t>h     :<c-u>cd ~          <bar>:te<cr>
nnoremap <silent> <a-t>o     :<c-u>cd ~/org      <bar>:te<cr>
nnoremap <silent> <a-t>.     :<c-u>cd ~/dotfiles <bar>:te<cr>
nnoremap <silent> <a-t>d     :<c-u>cd ~/dotfiles <bar>:te<cr>
nnoremap <silent> <a-t>g     :<c-u>cd ~/.config  <bar>:te<cr>
nnoremap <silent> <a-t>w     :<c-u>cd %:p:h      <bar>:te<cr>

tnoremap <silent> <a-t><a-o> cd ~/org      <cr>
tnoremap <silent> <a-t><a-.> cd ~/dotfiles <cr>
tnoremap <silent> <a-t><a-d> cd ~/dotfiles <cr>
tnoremap <silent> <a-t><a-g> cd ~/.config  <cr>
tnoremap <silent> <a-t>o     cd ~/org      <cr>
tnoremap <silent> <a-t>.     cd ~/dotfiles <cr>
tnoremap <silent> <a-t>d     cd ~/dotfiles <cr>
tnoremap <silent> <a-t>g     cd ~/.config  <cr>

nnoremap <silent> <a-t>e     :<c-u>   :te<cr>
nnoremap <silent> <a-t>s     :<c-u>sp <bar>:te<cr>
nnoremap <silent> <a-t>v     :<c-u>vs <bar>:te<cr>
nnoremap <silent> <a-t>t     :<c-u>tabe<bar>:te<cr>
nnoremap <silent> <a-t><a-e> :<c-u>   :te<cr>
nnoremap <silent> <a-t><a-s> :<c-u>sp <bar>:te<cr>
nnoremap <silent> <a-t><a-v> :<c-u>vs <bar>:te<cr>
nnoremap <silent> <a-t><a-t> :<c-u>tabe<bar>:te<cr>

" Jump Anyway by <c-i><c-o>
"tmap <c-i> <c-\><c-n><c-i>
tmap <c-o> <c-\><c-n><c-o>
tmap <a-i> <c-\><c-n><a-i>
tmap <a-o> <c-\><c-n><a-o>
tmap <a-p> <c-\><c-n><a-p>
tmap <a-n> <c-\><c-n><a-n>

"" Alt as ESC as in Insert Mode
" esc & hjkl
" <a-b> is useful on bash
tnoremap <a-h> <c-\><c-n>h
tnoremap <a-j> <c-\><c-n>j
tnoremap <a-k> <c-\><c-n>k
tnoremap <a-l> <c-\><c-n>l
"tnoremap <a-h> <c-\><c-n><c-w>h
"tnoremap <a-j> <c-\><c-n><c-w>j
"tnoremap <a-k> <c-\><c-n><c-w>k
"tnoremap <a-l> <c-\><c-n><c-w>l

""" Buffer
" <c-[> to <esc>, <c-]> for tag-jump.
noremap <silent> <a-i> :bnext<cr>
noremap <silent> <a-o> :bprevious<cr>
noremap <c-6> <c-^>

"" QuickFix
noremap <silent> <space>co :copen<cr>
noremap <silent> <space>cw :cwindow<cr>
noremap <silent> <space>cc :cclose<cr>:lclose<cr>
