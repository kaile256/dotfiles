" From: tool.toml
"  Ref: vimwiki/vimwiki

" Set; Path
set path+=~/vimwiki/**
function! s:my_startpage(page) "{{{
  if @% == '' && &filetype ==# '' && &buftype ==# ''
    if a:page == 'wiki'
      VimwikiIndex
    elseif a:page == 'diary'
      VimwikiMakeDiaryNote
    elseif a:page == 'term'
      call termopen(&shell)
      setlocal nonumber signcolumn=no modifiable
    endif
  endif
endfunction "}}}

" Let; Highlight {{{
let g:vimwiki_hl_headers    = 1
let g:vimwiki_hl_cb_checked = 2
" CJK: Calculate the correct length of the strings with
" double-wide characters (to align table cells properly).
let g:vimwiki_CJK_length = 1
"}}}
" Def; List Symbol {{{
"let g:vimwiki_listsyms = '✗○◐●✓'
"let g:vimwiki_listsym_rejected = '✗'
"}}}

" Let; List of config {{{
"" List; Script Variables {{{
" CAUTION: Allowed values are ['default', 'markdown', 'media', 'mediawiki']
let s:wiki_index = {
      \ 'path': '~/vimwiki/',
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'list_margin': 4,
      \ 'auto_toc': 1
      \ }

let s:wiki_index.nested_syntaxes = {
      \ 'python': 'python',
      \ 'c++': 'cpp',
      \ 'org': 'org',
      \ 'lisp': 'lisp',
      \ 'i3': 'i3',
      \ 'bash': 'bash',
      \ 'zsh': 'zsh',
      \ 'vim': 'vim'
      \ }

let s:wiki_markdown = {
      \ 'syntax': 'markdown',
      \ 'index': 'mdwiki',
      \ 'path': '~/vimwiki/mdwiki/',
      \ 'ext': '.md'
      \ }

"}}}

let g:vimwiki_list = [
      \ {},
      \ s:wiki_index,
      \ s:wiki_markdown
      \ ]
"}}}

" TODO: Export from org

" global Bind {{{0
" Abbr; VimWikiGoto {{{
cnoreabbr <expr> gw (getcmdtype() == ':' && getcmdline() =~ '^gw$')? 'VimwikiGoto' : 'gw'
cnoreabbr <expr> wg (getcmdtype() == ':' && getcmdline() =~ '^wg$')? 'VimwikiGoto' : 'wg'
"" VimwikiGoto; with direction {{{
cnoreabbr <expr> we (getcmdtype() == ':' && getcmdline() =~ '^we$')? 'VimwikiGoto' : 'h'
cnoreabbr <expr> wb (getcmdtype() == ':' && getcmdline() =~ '^wb$')? 'tab VimwikiGoto' : 'h'
cnoreabbr <expr> ws (getcmdtype() == ':' && getcmdline() =~ '^ws$')? 'bel VimwikiGoto' : 'h'
cnoreabbr <expr> wv (getcmdtype() == ':' && getcmdline() =~ '^wv$')? 'vert bel VimwikiGoto' : 'h'
"}}}

" Abbr; for destination {{{
cnoreabbr <expr> x (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto x$')? 'linux' : 'x'
cnoreabbr <expr> li (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto li$')? 'linux' : 'li'
cnoreabbr <expr> vp (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto vp$')? 'vplug' : 'vp'
cnoreabbr <expr> pv (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto pv$')? 'vplug' : 'pv'
cnoreabbr <expr> v (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto v$')? 'vim' : 'v'
cnoreabbr <expr> vi (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto vi$')? 'vim' : 'vi'
"}}}
"}}}
" Keymap; PN Link {{{
" TODO: usual-<c-jk> on = Contents =
"nnoremap <buffer><expr> <c-k> ':VimwikiPrevLink<cr>'
"nnoremap <buffer><expr> <c-j> ':VimwikiNextLink<cr>'

""" Conversion
"" Mnemonic: Export to/from ~~
nnoremap <buffer><silent> <a-x><a-h> :Vimwiki2HTMLBrowse <bar> echo 'Converting Current Buffer to HTML...'
"" From Org
" WARNING: experimental
"nnoremap <silent> <a-x><a-w> :g/^*/norm Wgev0r= 0Why0A <c-r>0<cr>

""" Todo
nnoremap <buffer><silent> <a-g><a-g> :<c-u>VimwikiToggleListItem<cr>
""" FollowLink
nnoremap <buffer><silent> <a-g><a-f> :<c-u>VimwikiFollowLink<cr>
nnoremap <buffer><silent> <a-g><a-s> :<c-u>VimwikiSplitLink<cr>
nnoremap <buffer><silent> <a-g><a-v> :<c-u>VimwikiVSplitLink<cr>
nnoremap <buffer><silent> <a-g><a-v> :<c-u>VimwikiTabnewLink<cr>

""" Link Like Tags
nnoremap  <buffer><silent> <c-t> :<c-u>VimwikiGoBackLink<cr>
nnoremap  <buffer><silent> <c-t> :<c-u>VimwikiFollowLink<cr>

" Keymap; List {{{{
noremap <buffer><silent> <a-space> :<c-u>VimwikiToggleListItem<CR>

nmap <a-+> <Plug>VimwikiIncrementListItem
vmap <a-+> <Plug>VimwikiIncrementListItem
nmap <a--> <Plug>VimwikiDecrementListItem
vmap <a--> <Plug>VimwikiDecrementListItem
"}}}
" Keymap; vsbe {{{
"" vsbe; Index to open {{{
nnoremap <silent> <a-w><a-e> :<c-u>   <space> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-b> :<c-u>   <space> :VimwikiTabIndex<cr>
nnoremap <silent> <a-w><a-s> :<c-u>topleft sp <cr>    :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-v> :<c-u>vert top vs <cr> :VimwikiIndex<cr>
nnoremap <silent> <a-w>e :<c-u>   <space> :VimwikiIndex<cr>
nnoremap <silent> <a-w>b :<c-u>   <space> :VimwikiTabIndex<cr>
nnoremap <silent> <a-w>s :<c-u>sp <cr>    :VimwikiIndex<cr>
nnoremap <silent> <a-w>v :<c-u>vert top vs <cr>    :VimwikiIndex<cr>
"}}}

"" vsbe; :VimwikiGoto under Cursor {{{
"noremap <silent> <a-w><a-g>e     :<c-u>     <space> :VimwikiGoto <cr> <cWORD> <cr>
"noremap <silent> <a-w><a-g>s     :<c-u>sp   <cr>    :VimwikiGoto <cr> <cWORD> <cr>
"noremap <silent> <a-w><a-g>v     :<c-u>svs  <cr>    :VimwikiGoto <cr> <cWORD> <cr>
"noremap <silent> <a-w><a-g>b     :<c-u>tabe <cr>    :VimwikiGoto <cr> <cWORD> <cr>
"noremap <silent> <a-w>ge :<c-u>     <space> :VimwikiGoto<cr> <cWORD> <cr>
"noremap <silent> <a-w>gs :<c-u>sp   <cr>    :VimwikiGoto<cr> <cWORD> <cr>
"noremap <silent> <a-w>gv :<c-u>svs  <cr>    :VimwikiGoto<cr> <cWORD> <cr>
"noremap <silent> <a-w>gb :<c-u>tabe <cr>    :VimwikiGoto<cr> <cWORD> <cr>
""}}}

"" vsbe; VimWiki-UI to Select
nnoremap <silent> <a-w><a-u> :<c-u>VimwikiUISelect<cr>
"}}}
" Keymap; Diary {{{
"" Diary; Index {{{
nnoremap <silent> <a-e><a-i><a-e> :<c-u>       <space> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-b> :<c-u>tabnew <cr>    :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-s> :<c-u>sp     <cr>    :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-v> :<c-u>vs     <cr>    :VimwikiDiaryIndex<cr>
"}}}

"" Diary; Yesterday/Tomorrow
nnoremap <buffer><expr> <a-o> ':VimwikiMakeYesterdayDiaryNote<cr>'
nnoremap <buffer><expr> <a-i> ':VimwikiMakeTomorrowDiaryNote<cr>'
"" Diary; Today {{{
tnoremap <silent> <a-e>e     <c-\><c-n>:VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e>b     <c-\><c-n>:VimwikiTabMakeDiaryNote<cr>
tnoremap <silent> <a-e>s     <c-\><c-n>:sp <cr> :VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e>v     <c-\><c-n>:vs <cr> :VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-e> <c-\><c-n>:VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-b> <c-\><c-n>:VimwikiTabMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-s> <c-\><c-n>:sp <cr> :VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-v> <c-\><c-n>:vs <cr> :VimwikiMakeDiaryNote<cr>

nnoremap <silent> <a-e>e     :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e>b     :VimwikiTabMakeDiaryNote<cr>
nnoremap <silent> <a-e>s     :sp <cr> :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e>v     :vs <cr> :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-e> :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-b> :VimwikiTabMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-s> :sp <cr> :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-v> :vs <cr> :VimwikiMakeDiaryNote<cr>
"}}}
"}}}
"}}}
  function! s:my_vimwiki_keymap() "{{{

    """ Experimental: Rename
    " Abbr; VimwikiRenameLink {{{
    cnoreabbr <expr> re (getcmdtype() == ':' && getcmdline() =~ '^re$')? 'VimwikiRenameLink' : 're'
"}}}

    " Keymap; Nowait {{
    noremap <buffer><nowait> o o
    noremap <buffer><nowait> O O
    noremap <buffer><nowait> <c-i> <c-i>
    noremap <buffer><nowait> <c-o> <c-o>
    noremap <buffer><silent> <c-]> :VimwikiFollowLink<cr>
    noremap <buffer><silent> <c-w><c-]> :VimwikiVSplitLink reuse<cr>
    noremap <buffer><silent> <c-t> :VimwikiGoBackLink<cr>
    "" Nowait; Insert
    inoremap <buffer><nowait> <c-t> <c-t>
    inoremap <buffer><nowait> <c-d> <c-d>

  endfunction "}}}

" Config; if &ft=vimwiki {{{0
function! s:vimwiki_foldmethod() "{{{
  if &ft == 'vimwiki'
    cnoreabbrev <buffer><expr> fdm (getcmdtype() == ':' && getcmdline() =~ '^fdm$')? 'setlocal foldmethod=' : 'setlocal foldmethod=syntax'
  endif
endfunction "}}}

  function! s:my_vimwiki_setlocal() "{{{
    "setlocal buftype=quickfix
    setlocal nowrap
    setlocal foldmethod=syntax
    setlocal tabstop=2 softtabstop=2 shiftwidth=2
  endfunction "}}}
  function! s:my_vimwiki_diary() "{{{
    " Experimental:
    "if @% =~# expand(*.'/vimwiki/diary/'.*)
    "  nnoremap <buffer> <a-o> :VimwikiDiaryNextDay
    "  nnoremap <buffer> <a-i> :VimwikiDiaryPrevDay
    "endif
  endfunction "}}}

augroup MyVimWikiAugroup "{{{
  au!

  au VimEnter * nested call <SID>my_startpage('wiki')

  au FileType vimwiki nested call <SID>my_vimwiki_setlocal()
  au FileType vimwiki nested call <SID>my_vimwiki_keymap()
  au FileType vimwiki nested call <SID>my_vimwiki_diary()
  " `setf` in functions;
  au WinEnter * call <SID>vimwiki_foldmethod()

  au BufWritePre * if &ft   == 'vimwiki' | VimwikiTOC
  au InsertLeave * if &wrap == 0         | norm zH
  " Prepare for Error

augroup END "}}}
