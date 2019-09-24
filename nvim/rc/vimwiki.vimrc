scriptencoding utf-8
" From: Init.toml
" Repo: vimwiki/vimwiki
" Path: autoload/vimwiki
" Path: ftplugin/vimwiki.vim

set path+=~/vimwiki/**
let g:vimwiki_folding = 'expr'
let g:vimwiki_markdown_link_ext = 1
" Let; Highlight {{{1
let g:vimwiki_hl_headers    = 1
let g:vimwiki_hl_cb_checked = 2
" CJK: Calculate the correct length of the strings with
" double-wide characters (to align table cells properly).
let g:vimwiki_CJK_length = 1
" Let; List of config on each wiki root {{{1
"" List; Script Variables {{{2
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
      \ 'ext': '.markdown',
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'list_margin': 4,
      \ 'auto_toc': 1,
      \ 'path_html': '~/vimwiki/htmlwiki/',
      \ 'custom_wiki2html': 'vimwiki_markdown',
      \ 'html_filename_parameterization': 1,
      \ }
let s:wiki_markdown.nested_syntaxes = {
      \ 'python': 'python',
      \ 'c++': 'cpp',
      \ 'org': 'org',
      \ 'lisp': 'lisp',
      \ 'i3': 'i3',
      \ 'bash': 'bash',
      \ 'zsh': 'zsh',
      \ 'vim': 'vim'
      \ }
"}}}
let g:vimwiki_list = [
      \ {},
      \ s:wiki_markdown,
      \ s:wiki_index
      \ ]
" Let; List Symbol {{{1
"let g:vimwiki_listsyms = '✗○◐●✓'
"let g:vimwiki_listsym_rejected = '✗'
"}}}

" Hotkey; Index {{{1
command! MdwikiIndex    :e    ~/vimwiki/mdwiki/index.markdown
nnoremap <silent> <a-w><a-e> :<c-u>MdwikiIndex <cr>
nnoremap <silent> <a-w><a-b> :<c-u>tab sp <bar> MdwikiIndex <cr>
nnoremap <silent> <a-w><a-v> :<c-u>vs <bar> MdwikiIndex <cr>
nnoremap <silent> <a-w><a-s> :<c-u>sp <bar> MdwikiIndex <cr>
" Hotkey; Diary Index {{{1
nnoremap <silent> <a-e><a-i><a-e> :<c-u>       <space> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-b> :<c-u>tabnew <cr>    :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-s> :<c-u>sp     <cr>    :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-i><a-v> :<c-u>vs     <cr>    :VimwikiDiaryIndex<cr>
" Hotkey; Diary Today {{{1
nnoremap <silent> <a-e>e     :e <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e>b     :tabe <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e>s     :sp <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e>v     :vs <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-e> :e <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-b> :tabe <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-s> :sp <bar> VimwikiMakeDiaryNote<cr>
nnoremap <silent> <a-e><a-v> :vs <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e>e     <c-\><c-n>:e <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e>b     <c-\><c-n>:tabe <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e>s     <c-\><c-n>:sp <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e>v     <c-\><c-n>:vs <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-e> <c-\><c-n>:e <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-b> <c-\><c-n>:tabe <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-s> <c-\><c-n>:sp <bar> VimwikiMakeDiaryNote<cr>
tnoremap <silent> <a-e><a-v> <c-\><c-n>:vs <bar> VimwikiMakeDiaryNote<cr>
"}}}

function! s:on_buf_vimwiki_dairy()
  " Hotket; Open diary of Yesterday/Tomorrow {{{1
  nnoremap <buffer> <a-o> :VimwikiMakeYesterdayDiaryNote<cr>
  nnoremap <buffer> <a-i> :VimwikiMakeTomorrowDiaryNote<cr>
  "}}}
endfunction
function! s:on_buf_vimwiki()
  " CmdAbbr; Conversion {{{1
  "" Mnemonic: Export to/from ~~
  command! Wiki2HtmlBrowse :Vimwiki2HTMLBrowse <bar> echo 'Converting Current Buffer to HTML...'
  " CmdAbbr; Rename Link {{{1
  cnoreabbr <buffer><expr> rn (getcmdtype() == ':' && getcmdline() =~ '^rn$')? 'VimwikiRenameLink' : 'rn'
  " CmdAbbr; VimWikiGoto {{{1
  cnoreabbr <buffer><expr> gw (getcmdtype() == ':' && getcmdline() =~ '^gw$')? 'VimwikiGoto' : 'gw'
  cnoreabbr <buffer><expr> wg (getcmdtype() == ':' && getcmdline() =~ '^wg$')? 'VimwikiGoto' : 'wg'
  cnoreabbr <buffer><expr> gwb (getcmdtype() == ':' && getcmdline() =~ '^gwb$')? 'tab sp <bar> VimwikiGoto' : 'gwb'
  cnoreabbr <buffer><expr> gws (getcmdtype() == ':' && getcmdline() =~ '^gws$')? 'sp <bar> VimwikiGoto' : 'gws'
  cnoreabbr <buffer><expr> gwv (getcmdtype() == ':' && getcmdline() =~ '^gwv$')? 'vs <bar> VimwikiGoto' : 'gwv'
  cnoreabbr <buffer><expr> bgw (getcmdtype() == ':' && getcmdline() =~ '^bgw$')? 'tab sp <bar> VimwikiGoto' : 'bgw'
  cnoreabbr <buffer><expr> sgw (getcmdtype() == ':' && getcmdline() =~ '^sgw$')? 'sp <bar> VimwikiGoto' : 'sgw'
  cnoreabbr <buffer><expr> vgw (getcmdtype() == ':' && getcmdline() =~ '^vgw$')? 'vs <bar> VimwikiGoto' : 'vgw'
  " CmdAbbr; VimwikiGoto w/ direction {{{1
  cnoreabbr <buffer><expr> we (getcmdtype() == ':' && getcmdline() =~ '^we$')? 'VimwikiGoto' : 'we'
  cnoreabbr <buffer><expr> wb (getcmdtype() == ':' && getcmdline() =~ '^wb$')? 'tab VimwikiGoto' : 'wb'
  cnoreabbr <buffer><expr> ws (getcmdtype() == ':' && getcmdline() =~ '^ws$')? 'sp <bar> VimwikiGoto' : 'ws'
  cnoreabbr <buffer><expr> wv (getcmdtype() == ':' && getcmdline() =~ '^wv$')? 'vs <bar> VimwikiGoto' : 'wv'
  "}}}
  " Addition; Undo Break {{{1
  inoremap <buffer> , ,<c-g>u
  inoremap <buffer> . .<c-g>u
  inoremap <buffer> ! !<c-g>u
  inoremap <buffer> ? ?<c-g>u
  " Override; as default vim {{{1
  noremap <buffer><nowait> o o
  noremap <buffer><nowait> O O
  noremap <buffer><nowait> <c-i> <c-i>
  noremap <buffer><nowait> <c-o> <c-o>
  " Nowait; Insert
  inoremap <buffer><nowait> <c-t> <c-t>
  inoremap <buffer><nowait> <c-d> <c-d>
  inoremap <buffer><nowait> <c-u> <c-u>
  " Keymap; Modify Marks {{{1
  noremap  <buffer><silent> <a-space>   :<c-u>VimwikiToggleListItem<CR>
  nmap     <silent><buffer> +           <Plug>VimwikiIncrementListItem
  vmap     <silent><buffer> +           <Plug>VimwikiIncrementListItem
  nmap     <silent><buffer> _           <Plug>VimwikiDecrementListItem
  vmap     <silent><buffer> _           <Plug>VimwikiDecrementListItem
  " Jump; over links like CTags {{{1
  nnoremap <buffer><silent> <c-t>       :<c-u>VimwikiGoBackLink<cr>
  nnoremap <buffer><silent> <c-]>       :<c-u>VimwikiFollowLink<cr>
  nnoremap <buffer><silent> <c-w><c-]>  :<c-u>VimwikiVSplitLink reuse<cr>
  nnoremap <buffer><silent> <c-w>g<c-]> :<c-u>VimwikiSplitLink  reuse<cr>
  nnoremap <buffer><silent> <c-w>}      :<c-u>VimwikiTabnewLink<cr>
  vnoremap <buffer><silent> <c-]>       <Plug>VimwikiNormalizeLinkVisual
  "}}}
endfunction

augroup CallMyVimwikiFunc "{{{1
  au!
  " To use outliner of markdown's instead, keep to use mdwiki.
  au VimEnter * ++nested call <SID>my_startpage('mdwiki')
  au BufEnter vimwiki/*/diary/** call <SID>on_buf_vimwiki_dairy()
  au FileType vimwiki,markdown if &syn ==# 'vimwiki' | call <SID>on_buf_vimwiki()
augroup END
function! s:my_startpage(page) "{{{1
  if @% ==# '' && &ft ==# '' && &bt ==# '' && getline(1,'$') ==# ['']
    if a:page ==# 'mdwiki'
      e ~/vimwiki/mdwiki/index.markdown
    elseif a:page ==# 'wiki' || a:page ==# 'vimwiki'
      VimwikiIndex
    elseif a:page ==# 'diary'
      e ~/vimwiki/diary/index.wiki
    elseif a:page ==# 'term'
      call termopen(&shell)
      setlocal nonumber signcolumn=no modifiable
    endif
  endif
endfunction "}}}
augroup AutoFormatVimwiki
  au!
  au BufNewFile,BufEnter *wiki/**.markdown setl ft=vimwiki syn=vimwiki
  au FileType vimwiki setl tabstop=4 softtabstop=4 shiftwidth=4
  au FileType vimwiki setl nowrap fdl=1
  au BufWritePre index.* if &syn  ==# 'vimwiki' | VimwikiGenerateLinks
  au BufWritePre * if &syn  ==# 'vimwiki' | VimwikiTOC
  au InsertLeave * if &wrap == 0 | norm zH
  "au BufWritePre * if &syn  ==# 'vimwiki' | VimwikiListChangeLvl w w
augroup END
