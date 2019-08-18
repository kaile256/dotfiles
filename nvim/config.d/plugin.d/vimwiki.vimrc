"""" From: tool.toml
""""  Ref: vimwiki/vimwiki

"""" GENERAL
let wiki_index = {
      \ 'path': '~/vimwiki/',
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'auto_toc': 1
      \ }

let wiki_index.nested_syntaxes = {
      \ 'python': 'python',
      \ 'c++': 'cpp',
      \ 'org': 'org',
      \ 'lisp': 'lisp',
      \ 'i3': 'i3',
      \ 'bash': 'bash',
      \ 'zsh': 'zsh',
      \ 'vim': 'vim'
      \ }

let wiki_markdown = [{
      \ 'syntax': 'markdown',
      \ 'path': '~/vimwiki/markdown/',
      \ 'ext': '.md'
      \ }]

let wiki_org = [{
      \ 'syntax': 'org',
      \ 'path': '~/vimwiki/org/',
      \ 'ext': '.org'
      \ }]

let wiki_text = [{
      \ 'syntax': 'text',
      \ 'path': '~/vimwiki/text/',
      \ 'ext': '.txt'
      \ }]

let g:vimwiki_list = [
      \ {},
      \ wiki_index,
      \ wiki_markdown,
      \ wiki_org,
      \ wiki_text
      \ ]

""" Export from org
nnoremap q: q:

"""" KEYMAP
""" CAUTION: <Plug>:VimWiki~~ seems to work wrong.

"""" vsbe VimWiki {{{
nnoremap <silent> <a-w><a-e> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-b> :VimwikiTabIndex<cr>
nnoremap <silent> <a-w><a-s> :sp <cr> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-v> :vs <cr> :VimwikiIndex<cr>
"}}}

" vsbe VimWiki-UI to Select {{{
nnoremap <silent> <a-w><a-u> :VimwikiUISelect<cr>
"}}}

nnoremap <silent> <a-e><a-i><a-e> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-b> :tabnew <cr> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-s> :sp   <cr> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-v> :vs   <cr> :VimwikiDiaryIndex<cr>

nnoremap <silent> <a-e><a-e> :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-b> :VimwikiTabMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-s> :sp <cr> :VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-v> :vs <cr> :VimwikiMakeDiaryNote<cr>

augroup VimWiki
  au!
  au FileType vimwiki call s:vimwiki_general()
  au FileType vimwiki call s:vimwiki_keymap()
  au FileType vimwiki call s:vimwiki_dairy()
  "au BufWritePre *.wiki VimwikiTOC
augroup END

function! s:vimwiki_dairy()
  if @% =~# */vimwiki/diary/*
  nnoremap <buffer> <a-o> :VimwikiDiaryNextDay
  nnoremap <buffer> <a-i> :VimwikiDiaryPrevDay
  endif
endfunction

function! s:vimwiki_general()
  setlocal foldmethod=syntax
  setlocal foldlevel=1
  setlocal nowrap
  au!
  au InsertLeave * if &filetype ==# 'vimwiki' | norm zH | endif
  au BufHidden * if &filetype == 'vimwiki' | bwipeout! % | endif
nnoremap q<space> q
endfunction

function! s:vimwiki_keymap()
  """ Experimental: Rename
  cnoreabbrev <buffer><silent><expr> w (getcmdtype() == ':' && getcmdline() =~ '^w$')? 'VimwikiRenameLink<cr>' : 'w'

  """ Prev/Next Day
  nnoremap <buffer> <c-k> :VimwikiPrevLink
  nnoremap <buffer> <c-j> :VimwikiNextLink

  """ Quick Edit
  nnoremap <buffer><silent> yp yyp
  nnoremap <buffer><silent> yP yyP
  nnoremap <buffer><silent> dp ddp
  nnoremap <buffer><silent> dP ddP

  """ Conversion
  "" Mnemonic: Export to/from ~~
  nnoremap <buffer><silent> <a-x><a-h> :Vimwiki2HTMLBrowse <bar> echo 'Converting Current Buffer to HTML...'
  "" From Org
  " WARNING: experimental
  "nnoremap <silent> <a-x><a-w> :g/^*/norm Wgev0r= 0Why0A <c-r>0<cr>

  """ Todo
  nnoremap <buffer><silent> <a-g><a-g> :VimwikiToggleListItem<cr>
  """ FollowLink
  nnoremap <buffer><silent> <a-g><a-f> :VimwikiFollowLink<cr>
  nnoremap <buffer><silent> <a-g><a-s> :VimwikiSplitLink<cr>
  nnoremap <buffer><silent> <a-g><a-v> :VimwikiVSplitLink<cr>
  nnoremap <buffer><silent> <a-g><a-v> :VimwikiTabnewLink<cr>

  """ Create New Link
  nnoremap <buffer><silent> <a-g><a-n><a-f> :VimwikiGoto <cWORD> <cr>
  nnoremap <buffer><silent> <a-g><a-n><a-n> :sp   <cr> :VimwikiGoto <cWORD> <cr>
  nnoremap <buffer><silent> <a-g><a-n><a-s> :sp   <cr> :VimwikiGoto <cWORD> <cr>
  nnoremap <buffer><silent> <a-g><a-n><a-v> :vs   <cr> :VimwikiGoto <cWORD> <cr>
  nnoremap <buffer><silent> <a-g><a-n><a-t> :tabe <cr> :VimwikiGoto <cWORD> <cr>
  nnoremap <buffer><silent> <a-g><a-n><a-b> :tabe <cr> :VimwikiGoto <cWORD> <cr>

  """ Link Like Tags
  nnoremap <buffer><silent> <c-t>           :VimwikiGoBackLink<cr>
  nnoremap <buffer><silent> <c-t>           :VimwikiFollowLink<cr>
endfunction
