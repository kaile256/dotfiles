" From: tool.toml
"  Ref: vimwiki/vimwiki

set path+=~/vimwiki/**

function! s:my_startpage(page) "{{{
  if @% == '' && &filetype ==# '' && &buftype ==# ''
    if a:page == 'mdwiki'
      e ~/vimwiki/mdwiki/index.md
    elseif a:page == 'wiki'
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
      \ 'index': 'index',
      \ 'path': '~/vimwiki/mdwiki/',
      \ 'ext': '.md',
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'list_margin': 4,
      \ 'auto_toc': 1
      \ }

"}}}

let g:vimwiki_list = [
      \ {},
      \ s:wiki_index,
      \ s:wiki_markdown
      \ ]
"}}}

" Abbr; for destination {{{
cnoreabbr <expr> x (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto x$')? 'linux' : 'x'
cnoreabbr <expr> li (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto li$')? 'linux' : 'li'
cnoreabbr <expr> vp (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto vp$')? 'vplug' : 'vp'
cnoreabbr <expr> pv (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto pv$')? 'vplug' : 'pv'
cnoreabbr <expr> v (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto v$')? 'vim' : 'v'
cnoreabbr <expr> vi (getcmdtype() == ':' && getcmdline() =~ 'VimwikiGoto vi$')? 'vim' : 'vi'
"}}}

" Keymap; vsbe {{{
command! VimwikiIndex    :e    ~/vimwiki/mdwiki/index.md
command! VimwikiTabIndex :tabe ~/vimwiki/mdwiki/index.md

"" vsbe; Index to open {{{
nmap <silent> <a-w><a-e> :<c-u>   <space> :VimwikiIndex<cr>
nmap <silent> <a-w><a-b> :<c-u>   <space> :VimwikiTabIndex<cr>
nmap <silent> <a-w><a-s> :<c-u>sp <bar>   :VimwikiIndex<cr>
nmap <silent> <a-w><a-v> :<c-u>vs <bar>   :VimwikiIndex<cr>
nmap <silent> <a-w>e     :<c-u>   <space> :VimwikiIndex<cr>
nmap <silent> <a-w>b     :<c-u>   <space> :VimwikiTabIndex<cr>
nmap <silent> <a-w>s     :<c-u>sp <bar>   :VimwikiIndex<cr>
nmap <silent> <a-w>v     :<c-u>vs <bar>   :VimwikiIndex<cr>
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

function! s:on_buf_vimwiki() "{{{
  " Setlocal; {{{
  "setl buftype=quickfix
  setl nowrap
  setl fdm=syntax fdl=0
  setl tabstop=4 softtabstop=4 shiftwidth=4
  "}}}

  " Bufmap; Nowait {{{
  noremap <buffer><nowait> o o
  noremap <buffer><nowait> O O
  noremap <buffer><nowait> <c-i> <c-i>
  noremap <buffer><nowait> <c-o> <c-o>

  " Nowait; Insert
  inoremap <buffer><nowait> <c-t> <c-t>
  inoremap <buffer><nowait> <c-d> <c-d>
  "}}}
  " Buffer; PN Link {{{
  " TODO: usual-<c-jk> on = Contents =
  "nnoremap <buffer><expr> <c-k> ':VimwikiPrevLink<cr>'
  "nnoremap <buffer><expr> <c-j> ':VimwikiNextLink<cr>'

  " Conversion
  "" Mnemonic: Export to/from ~~
  nnoremap <buffer><silent> <a-x><a-h> :Vimwiki2HTMLBrowse <bar> echo 'Converting Current Buffer to HTML...'<cr>
  "" From Org
  " WARNING: experimental
  "nnoremap <silent> <a-x><a-w> :g/^*/norm Wgev0r= 0Why0A <c-r>0<cr>
  "" .wiki to .markdown
  nnoremap <buffer><silent> <a-x><a-m> :keeppatterns %s/=/#/g <bar> %s/ #\+$//g <bar> %s/{{{/```/g <bar> %s/}}}/```/g <cr>

  """ Todo
  nnoremap <buffer><silent> <a-g><a-g> :<c-u>VimwikiToggleListItem<cr>
  """ FollowLink
  nnoremap <buffer><silent> <a-g><a-f> :<c-u>VimwikiFollowLink<cr>
  nnoremap <buffer><silent> <a-g><a-s> :<c-u>VimwikiSplitLink<cr>
  nnoremap <buffer><silent> <a-g><a-v> :<c-u>VimwikiVSplitLink<cr>
  nnoremap <buffer><silent> <a-g><a-v> :<c-u>VimwikiTabnewLink<cr>

  """ Link Like Tags
  noremap  <buffer><silent> <c-t>      :<c-u>VimwikiGoBackLink<cr>
  noremap  <buffer><silent> <c-t>      :<c-u>VimwikiGoBackLink<cr>
  "nnoremap  <buffer><silent> <c-]> <Plug>VimwikiNormalizeLink:<c-u>VimwikiFollowLink<cr>
  nnoremap <buffer><silent> <c-]>      :<c-u>VimwikiFollowLink<cr>
  noremap  <buffer><silent> <c-w><c-]> :<c-u>VimwikiVSplitLink reuse<cr>
  vnoremap <buffer><silent> <c-]>      <Plug>VimwikiNormalizeLinkVisual


  " Keymap; List {{{{
  noremap <buffer><silent> <a-space> :<c-u>VimwikiToggleListItem<CR>

  nmap <silent><buffer> + <Plug>VimwikiIncrementListItem
  vmap <silent><buffer> + <Plug>VimwikiIncrementListItem
  nmap <silent><buffer> _ <Plug>VimwikiDecrementListItem
  vmap <silent><buffer> _ <Plug>VimwikiDecrementListItem
  "}}}
  "}}}

  " Abbr; for Error
  cnoreabbr <buffer><expr> fdm (getcmdtype() == ':' && getcmdline() =~ '^fdm$')? 'setl foldmethod=' : 'setl foldmethod=syntax'

  " Abbr; VimwikiRenameLink
  cnoreabbr <buffer><expr> re (getcmdtype() == ':' && getcmdline() =~ '^re$')? 'VimwikiRenameLink' : 're'

  " Abbr; VimWikiGoto {{{
  cnoreabbr <buffer><expr> gw (getcmdtype() == ':' && getcmdline() =~ '^gw$')? 'VimwikiGoto' : 'gw'
  cnoreabbr <buffer><expr> wg (getcmdtype() == ':' && getcmdline() =~ '^wg$')? 'VimwikiGoto' : 'wg'
  cnoreabbr <buffer><expr> gwb (getcmdtype() == ':' && getcmdline() =~ '^gwb$')? 'tab VimwikiGoto' : 'gwb'
  cnoreabbr <buffer><expr> gws (getcmdtype() == ':' && getcmdline() =~ '^gws$')? 'sp <bar> VimwikiGoto' : 'gws'
  cnoreabbr <buffer><expr> gwv (getcmdtype() == ':' && getcmdline() =~ '^gwv$')? 'vs <bar> VimwikiGoto' : 'gwv'

  "" VimwikiGoto; with direction
  cnoreabbr <buffer><expr> we (getcmdtype() == ':' && getcmdline() =~ '^we$')? 'VimwikiGoto' : 'we'
  cnoreabbr <buffer><expr> wb (getcmdtype() == ':' && getcmdline() =~ '^wb$')? 'tab VimwikiGoto' : 'wb'
  cnoreabbr <buffer><expr> ws (getcmdtype() == ':' && getcmdline() =~ '^ws$')? 'sp <bar> VimwikiGoto' : 'ws'
  cnoreabbr <buffer><expr> wv (getcmdtype() == ':' && getcmdline() =~ '^wv$')? 'vs <bar> VimwikiGoto' : 'wv'
  "}}}


endfunction "}}}

augroup CallMyVimwikiFunctions "{{{
  au!

  au VimEnter * ++nested call <SID>my_startpage('mdwiki')

  au FileType vimwiki call <SID>on_buf_vimwiki()

augroup END "}}}

augroup AutoFormatVimwiki "{{{

  au!
  au BufWinEnter */mdwiki/** setl ft=vimwiki

  au BufWritePre *       if &ft   == 'vimwiki' | VimwikiTOC
  au BufWritePre index.* if &ft   == 'vimwiki' | VimwikiGenerateLinks
  au InsertLeave *       if &wrap == 0         | norm zH

augroup END         "}}}
