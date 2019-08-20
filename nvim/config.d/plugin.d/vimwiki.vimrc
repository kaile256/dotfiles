"""" From: tool.toml
""""  Ref: vimwiki/vimwiki

" VimWiki; Let {{{
"" Let; List {{{
let s:wiki_index = {
      \ 'path': '~/mywiki/',
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

let s:wiki_markdown = [{
      \ 'syntax': 'markdown',
      \ 'path': '~/vimwiki/markdown/',
      \ 'ext': '.md'
      \ }]

let s:wiki_org = [{
      \ 'syntax': 'org',
      \ 'path': '~/vimwiki/org/',
      \ 'ext': '.org'
      \ }]

let s:wiki_html = [{
      \ 'syntax': 'html',
      \ 'path': '~/vimwiki/html/',
      \ 'path_html': '~/htmlwiki/',
      \ 'ext': '.html'
      \ }]

let s:wiki_text = [{
      \ 'syntax': 'text',
      \ 'path': '~/vimwiki/text/',
      \ 'ext': '.txt'
      \ }]

let g:vimwiki_list = [
      \ {},
      \ s:wiki_index,
      \ s:wiki_markdown,
      \ s:wiki_org,
      \ s:wiki_html,
      \ s:wiki_text
      \ ]
"}}}
"}}}

" VimWiki; Function! {{{
function! s:my_vimwiki_diary() "{{{
  " Experimental:
  "if @% =~# expand(*.'/vimwiki/diary/'.*)
  "  nnoremap <buffer> <a-o> :VimwikiDiaryNextDay
  "  nnoremap <buffer> <a-i> :VimwikiDiaryPrevDay
  "endif
endfunction "}}}

function! s:my_vimwiki_setlocal() "{{{
  setlocal foldmethod=syntax
  setlocal nowrap
  setlocal tabstop=4
endfunction "}}}

function! s:my_vimwiki_keymap() "{{{

  """ Experimental: Rename
  cnoreabbrev <buffer><silent><expr> w (getcmdtype() == ':' && getcmdline() =~ '^w$')? 'VimwikiRenameLink<cr>' : 'w'

  "" Keymap; Nowait {{{
  inoremap <buffer><nowait> <c-t> <c-t>
  inoremap <buffer><nowait> <c-d> <c-d>
  noremap <buffer><nowait> o o
  noremap <buffer><nowait> O O

  "}}}

  """ PN Diary
  "" Challenge: Migrate to s:my_vimwiki_diary()
  nnoremap <buffer><expr> <a-o> ':VimwikiMakeYesterdayDiaryNote<cr>'
  nnoremap <buffer><expr> <a-i> ':VimwikiMakeTomorrowDiaryNote<cr>'

  """ PN Link
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
endfunction "}}}
"}}}

" VimWiki; Keymap {{{
""" TODO: Export from org
""" CAUTION: <Plug>:VimWiki~~ seems to work wrong.

"" Keymap; vsbe
""" vsbe; Index to open {{{
nnoremap <silent> <a-w><a-i><a-e> :<c-u>   <space> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-i><a-b> :<c-u>   <space> :VimwikiTabIndex<cr>
nnoremap <silent> <a-w><a-i><a-s> :<c-u>sp <cr>    :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-i><a-v> :<c-u>vs <cr>    :VimwikiIndex<cr>
"}}}

"" vsbe; Goto {{{
""" Goto; Under Cursor {{{
noremap <silent> <a-w>ge     :<c-u>     <space> :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w>gs     :<c-u>sp   <cr>    :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w>gv     :<c-u>svs  <cr>    :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w>gb     :<c-u>tabe <cr>    :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w><a-g>e :<c-u>     <space> :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w><a-g>s :<c-u>sp   <cr>    :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w><a-g>v :<c-u>svs  <cr>    :VimwikiGoto <cWORD> <cr>
noremap <silent> <a-w><a-g>b :<c-u>tabe <cr>    :VimwikiGoto <cWORD> <cr>
"}}}

""" Goto; Prompt {{{
""""" Prompt; Terminal {{{
tnoremap <silent> <a-w>e     <c-\><c-n>      <space> :VimwikiGoto<space>
tnoremap <silent> <a-w>b     <c-\><c-n>:tabe <cr>    :VimwikiGoto<space>
tnoremap <silent> <a-w>s     <c-\><c-n>:sp   <cr>    :VimwikiGoto<space>
tnoremap <silent> <a-w>v     <c-\><c-n>:vs   <cr>    :VimwikiGoto<space>
tnoremap <silent> <a-w><a-e> <c-\><c-n>      <space> :VimwikiGoto<space>
tnoremap <silent> <a-w><a-b> <c-\><c-n>:tabe <cr>    :VimwikiGoto<space>
tnoremap <silent> <a-w><a-s> <c-\><c-n>:sp   <cr>    :VimwikiGoto<space>
tnoremap <silent> <a-w><a-v> <c-\><c-n>:vs   <cr>    :VimwikiGoto<space>
"}}}

""""" Prompt; Normal {{{
nnoremap <silent> <a-w>e     :<c-u>     <space> :VimwikiGoto<space>
nnoremap <silent> <a-w>b     :<c-u>tabe <cr>    :VimwikiGoto<space>
nnoremap <silent> <a-w>s     :<c-u>sp   <cr>    :VimwikiGoto<space>
nnoremap <silent> <a-w>v     :<c-u>vs   <cr>    :VimwikiGoto<space>
nnoremap <silent> <a-w><a-e> :<c-u>     <space> :VimwikiGoto<space>
nnoremap <silent> <a-w><a-b> :<c-u>tabe <cr>    :VimwikiGoto<space>
nnoremap <silent> <a-w><a-s> :<c-u>sp   <cr>    :VimwikiGoto<space>
nnoremap <silent> <a-w><a-v> :<c-u>vs   <cr>    :VimwikiGoto<space>
"}}}
"}}}
"}}}

"" vsbe; VimWiki-UI to Select {{{
nnoremap <silent> <a-w><a-u> :<c-u>VimwikiUISelect<cr>
"}}}

"" vsbe; Diary to open {{{
""" Diary; Index to open
nnoremap <silent> <a-e><a-i><a-e> :<c-u>       <space> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-b> :<c-u>tabnew <cr>    :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-s> :<c-u>sp     <cr>    :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-v> :<c-u>vs     <cr>    :VimwikiDiaryIndex<cr>

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

" VimWiki; Augroup {{{

augroup MyVimWikiAugroup "{{{

  au!
  "au BufWritePre * if &filetype == 'vimwiki' | VimwikiTOC | endif
  au BufWinEnter * if &filetype == 'vimwiki' | setlocal buftype=quickfix | endif

  au InsertLeave * if &filetype == 'vimwiki' | norm zH | endif

  au Syntax,BufEnter * if &filetype == 'vimwiki' | call <SID>my_vimwiki_setlocal() | endif
  au Syntax,BufEnter * if &filetype == 'vimwiki' | call <SID>my_vimwiki_keymap()   | endif
  au Syntax,BufEnter * if &filetype == 'vimwiki' | call <SID>my_vimwiki_diary()    | endif

  " Open DiaryNote as Startpage
  if @% == '' && &filetype ==# '' && &buftype ==# ''
    au VimEnter * VimwikiMakeDiaryNote
  endif
  "au VimEnter * VimwikiMakeDiaryNote

  " Open Terminal as Startpage
  "au VimEnter * if @% == '' && &filetype ==# '' && &buftype ==# '' | call termopen(&shell) | setlocal nonumber signcolumn=no modifiable | endif

augroup END "}}}
"}}}
