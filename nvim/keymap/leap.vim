" From: init.vim

" cursor position of column is kept on jump.
set nostartofline
" jump ignoring unwritten buffers.
set hidden

" Set; Search {{{
set noignorecase
"set smartcase
set incsearch hlsearch nowrapscan
" fold all lines unmatched on {pattern}.
" CAUTION: foldable is apt to collapse format.
set foldenable
"}}}

" Keymap; Prevention for Error {{{
"" Prevention; Fuzzy Finders

function! s:echo_no_fuzzy_grep() "{{{

  exe echo "You don't have executable 'ripgrep' nor 'silver searcher.'"
endfunction "}}}

function! s:echo_no_fzf() "{{{

  exe echo "You don't have executable 'fzf.'"
endfunction "}}}

if !executable('ag') && !executable('rg')

tnoremap <silent> <a-r> <c-\><c-n>:echo "You don't have executable 'ripgrep' nor 'silver searcher.'"<cr>
tnoremap <silent> <a-q> <c-\><c-n>:echo "You don't have any executable fuzzy finder.'"<cr>
nnoremap <silent> <a-r> :<c-u>echo "You don't have executable 'ripgrep' nor 'silver searcher.'"<cr>
nnoremap <silent> <a-q> :<c-u>echo "You don't have any executable fuzzy finder.'"<cr>
endif
"}}}

"" Get to Org
"" vsbe ~/org/notes.org {{{
"nnoremap <silent> <a-q><a-o> :<c-u>e  ~/org/notes.org <cr>
"nnoremap <silent> <a-q>o     :<c-u>e  ~/org/notes.org <cr>
""nnoremap <silent> <a-q><a-e> :<c-u>e  ~/org/notes.org <cr>
""nnoremap <silent> <a-q>e     :<c-u>e  ~/org/notes.org <cr>
""nnoremap <silent> <a-q><a-v> :<c-u>vs ~/org/notes.org <cr>
""nnoremap <silent> <a-q>v     :<c-u>vs ~/org/notes.org <cr>
""nnoremap <silent> <a-q><a-s> :<c-u>sp ~/org/notes.org <cr>
""nnoremap <silent> <a-q>s     :<c-u>sp ~/org/notes.org <cr>
"""" On Term-Mode
"tnoremap <silent> <a-q><a-o> <c-u>nvr ~/org/notes.org <cr>
"tnoremap <silent> <a-q>o     <c-u>nvr ~/org/notes.org <cr>
""tnoremap <silent> <a-q><a-e> <c-u>nvr ~/org/notes.org <cr>
""tnoremap <silent> <a-q>e     <c-u>nvr ~/org/notes.org <cr>
"}}}

" Keymap; N/P Directory {{{
tnoremap <a-i> cd - > /dev/null <CR>
tnoremap <a-o> cd .. <CR>
nnoremap <a-w><a-i> :<c-u>cd -<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>i     :<c-u>cd -<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w><a-o> :<c-u>cd ..<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>o     :<c-u>cd ..<cr>:echo '$CWD is "' . getcwd() . '"'<cr>

"" Simply echo; Current Directory
nnoremap <a-w><a-.> :<c-u> echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>.     :<c-u> echo '$CWD is "' . getcwd() . '"'<cr>
"" Working Directory
nnoremap <a-w><a-w> :<c-u>cd %:p:h<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>w     :<c-u>cd %:p:h<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Root Directory
nnoremap <a-w><a-r> :<c-u>cd /<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>r     :<c-u>cd /<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" $HOME
nnoremap <a-w><a-h> :<c-u>cd ~<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>h     :<c-u>cd ~<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" XDG_CACHE_HOME
nnoremap <a-w><a-c> :<c-u>cd ~/.cache<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>c     :<c-u>cd ~/.cache<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" XDG_CONFIG_HOME
nnoremap <a-w><a-f> :<c-u>cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>f     :<c-u>cd ~/.config<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Dotfiles
nnoremap <a-w><a-d> :<c-u>cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
nnoremap <a-w>d     :<c-u>cd ~/dotfiles<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"" Org-Mode
"nnoremap <a-w><a-o> :<c-u>cd ~/org<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"nnoremap <a-w>o     :<c-u>cd ~/org<cr>:echo '$CWD is "' . getcwd() . '"'<cr>
"}}}

"" hjkl
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

"}}}
"}}}

"" Frex-Postion Leap {{{
""" Frex-Postion Leap; Definition {{{
"""" Definition; For Normal-Mode {{{
noremap <Plug>(leap-in-win-higher) :<c-u><c-r>= (line('w0') + line('.'))/2<cr><cr>
noremap <Plug>(leap-in-win-middle) :<c-u><c-r>= (line('w0') + line('w$') + 2*line('.'))/4<cr><cr>
noremap <Plug>(leap-in-win-lower)  :<c-u><c-r>= (line('w$') + line('.') + 1)/2<cr><cr>
noremap <Plug>(shift-to-middle)    :<c-u>call cursor(line('.'),col('$')/2)<cr>
"}}}

"""" Definition; For Visual-Mode {{{
"let s:v_leap_in_win_higher = cursor((line('w0') + line('.'))/2,                col('.'))
"let s:v_leap_in_win_middle = cursor((line('w0') + line('w$') + 2*line('.'))/4, col('.'))
"let s:v_leap_in_win_lower  = cursor((line('w$') + line('.') + 1)/2,            col('.'))
"let s:v_shift_to_middle    = cursor(line('.'),                                 col('$')/2)
"}}}
"}}}
"}}}

""" Frex-Position Leap; Keymap {{{
"""" Keymap; Normal-Mode {{{
" CAUTION: <c-m> is identical with <cr>; <c-,>/<c-.> does't work.
" <c-hjkl> get along with <c-fbud>; <a-hjkl> get along with <s-wbe>.
"nmap <silent> <c-h> <Plug>(leap-in-win-middle)
"nmap <silent> <c-j> <Plug>(leap-in-win-lower)
"nmap <silent> <c-k> <Plug>(leap-in-win-higher)
"nmap <silent> <c-l> <Plug>(shift-to-middle)
"}}}

"""" Experimental: Keymap; Visual-Mode {{{
"vmap <silent> <c-h> m`<Plug>(leap-in-win-middle)v``
"vmap <silent> <c-j> m`<Plug>(leap-in-win-lower)vo``o
"vmap <silent> <c-k> m`<Plug>(leap-in-win-higher)v``
"vmap <silent> <c-l> m`<Plug>(shift-to-middle)v``
"}}}

"""" Keymap; Operator-Pending {{{
"omap <silent> <c-h> <Plug>(leap-in-win-middle)
"omap <silent> <c-j> <Plug>(leap-in-win-lower)
"omap <silent> <c-k> <Plug>(leap-in-win-higher)
"omap <silent> <c-l> <Plug>(shift-to-middle)
"}}}
"}}}
"}}}

""" Pane
" leap between panes
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l

"nnoremap <a-b> <c-w>b
"nnoremap <a-t> <c-w>t
" avoid stack on command-line
cnoremap <a-k> <c-c>

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
" Note: gD to jump on *the first line* of the file that has the definition.
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

"" Hotkey to open terminal
" NOTICE: :tab/:vert/:bel, etc., fail to work. why?
"noremap <silent> <a-t><a-.> :<c-u> <space> :te<cr>
"noremap <silent> <a-t><a-e> :<c-u>     <cr>    :te<cr>
"noremap <silent> <a-t><a-s> :<c-u>sp   <cr>      :te<cr>
"noremap <silent> <a-t><a-v> :<c-u>vs <cr>   :te<cr>
"noremap <silent> <a-t><a-b> :<c-u>tabe <cr>      :te<cr>
"noremap <silent> <a-t>e     :<c-u>     <cr>    :te<cr>
"noremap <silent> <a-t>s     :<c-u>sp   <cr>      :te<cr>
"noremap <silent> <a-t>v     :<c-u>vs   <cr>      :te<cr>
"noremap <silent> <a-t>b     :<c-u>tabe <cr> :te<cr>

" With cd
"noremap <silent> <a-t><a-w> :<c-u>cd   %:p:h<bar> :te<cr>
"noremap <silent> <a-t>w     :<c-u>cd   %:p:h<bar> :te<cr>
"noremap <silent> <a-t><a-h> :<c-u>cd ~          <bar>:te<cr>
"noremap <silent> <a-t><a-o> :<c-u>cd ~/org      <bar>:te<cr>
"noremap <silent> <a-t><a-d> :<c-u>cd ~/dotfiles <bar>:te<cr>
"noremap <silent> <a-t><a-c> :<c-u>cd ~/.config  <bar>:te<cr>
"noremap <silent> <a-t>h     :<c-u>cd ~          <bar>:te<cr>
"noremap <silent> <a-t>o     :<c-u>cd ~/org      <bar>:te<cr>
"noremap <silent> <a-t>d     :<c-u>cd ~/dotfiles <bar>:te<cr>
"noremap <silent> <a-t>c     :<c-u>cd ~/.config  <bar>:te<cr>

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

" Jump Anyway by <c-i><c-o>
"tmap <c-i> <c-\><c-n><c-i>
tmap <c-o> <c-\><c-n><c-o>
tmap <a-i> <c-\><c-n><a-i>
tmap <a-o> <c-\><c-n><a-o>
tmap <a-p> <c-\><c-n><a-p>
tmap <a-n> <c-\><c-n><a-n>

"" Alt as ESC as in Insert Mode
""" Buffer
" <c-[> to <esc>, <c-]> for tag-jump.
noremap <silent> <a-i> :bnext<cr>
noremap <silent> <a-o> :bprevious<cr>
noremap <c-6>    <c-^>

"" QuickFix
noremap <silent> <space>co :copen<cr>
noremap <silent> <space>cw :cwindow<cr>
noremap <silent> <space>cc :cclose<cr>:lclose<cr>
