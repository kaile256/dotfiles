scriptencoding utf-8
" From: memo.toml
" Repo: vimwiki/vimwiki
" Path: vimwiki/vimwiki_dev
" Path: ftplugin/vimwiki.vim
" Another: add/vimwiki.vim

let g:vimwiki_key_mappings = {
      \ 'all_maps': 1,
      \ 'global': 0,
      \ 'lists':  0,
      \ 'html':   0,
      \ 'mouse':  0,
      \ }

"set path+=~/vimwiki/**
let g:vimwiki_table_auto_fmt = 0
"let g:vimwiki_table_reduce_last_col = 0
let g:vimwiki_folding = 'expr'
" let g:vimwiki_markdown_link_ext = 1
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

let g:vimwiki_global_ext = 0 " 0: regard files as vimwiki as in g:vimwiki_list
let g:vimwiki_list = [
      \ {},
      \ s:wiki_index,
      \ ]

"" no use
"let g:vimwiki_syntax_variables = get(g:, 'vimwiki_syntax_variables', {'default': ''})
"let g:vimwiki_syntax_variables = extend(g:vimwiki_syntax_variables, {
"      \ 'markdown': copy(g:vimwiki_syntax_variables['default'])
"      \ })

" Let; List Symbols {{{1
"let g:vimwiki_listsyms = '✗○◐●✓'
"let g:vimwiki_listsym_rejected = '✗'

function! s:vimwiki_abbrs() abort "{{{1
  " CmdAbbr; Conversion {{{2
  "" Mnemonic: Export to/from ~~
  command! Wiki2HtmlBrowse :Vimwiki2HTMLBrowse <bar> echo 'Converting Current Buffer to HTML...'
  " CmdAbbr; Rename Link {{{2
  cnoreabbr <buffer><expr> rn (getcmdtype() == ':' && getcmdline() =~ '^rn$')? 'VimwikiRenameLink' : 'rn'
  " CmdAbbr; VimWikiGoto {{{2
  cnoreabbr <buffer><expr> gw (getcmdtype() == ':' && getcmdline() =~ '^gw$')? 'VimwikiGoto' : 'gw'
  cnoreabbr <buffer><expr> wg (getcmdtype() == ':' && getcmdline() =~ '^wg$')? 'VimwikiGoto' : 'wg'
  cnoreabbr <buffer><expr> gwb (getcmdtype() == ':' && getcmdline() =~ '^gwb$')? 'tab sp <bar> VimwikiGoto' : 'gwb'
  cnoreabbr <buffer><expr> gws (getcmdtype() == ':' && getcmdline() =~ '^gws$')? 'sp <bar> VimwikiGoto' : 'gws'
  cnoreabbr <buffer><expr> gwv (getcmdtype() == ':' && getcmdline() =~ '^gwv$')? 'vs <bar> VimwikiGoto' : 'gwv'
  cnoreabbr <buffer><expr> bgw (getcmdtype() == ':' && getcmdline() =~ '^bgw$')? 'tab sp <bar> VimwikiGoto' : 'bgw'
  cnoreabbr <buffer><expr> sgw (getcmdtype() == ':' && getcmdline() =~ '^sgw$')? 'sp <bar> VimwikiGoto' : 'sgw'
  cnoreabbr <buffer><expr> vgw (getcmdtype() == ':' && getcmdline() =~ '^vgw$')? 'vs <bar> VimwikiGoto' : 'vgw'
  " CmdAbbr; VimwikiGoto w/ direction {{{2
  cnoreabbr <buffer><expr> we (getcmdtype() == ':' && getcmdline() =~ '^we$')? 'VimwikiGoto' : 'we'
  cnoreabbr <buffer><expr> wb (getcmdtype() == ':' && getcmdline() =~ '^wb$')? 'tab VimwikiGoto' : 'wb'
  cnoreabbr <buffer><expr> ws (getcmdtype() == ':' && getcmdline() =~ '^ws$')? 'sp <bar> VimwikiGoto' : 'ws'
  cnoreabbr <buffer><expr> wv (getcmdtype() == ':' && getcmdline() =~ '^wv$')? 'vs <bar> VimwikiGoto' : 'wv'
  "}}}
endfunction

function! s:vimwiki_keymaps() abort "{{{1
  nnoremap <silent><buffer> = <Plug>VimwikiAddHeaderLevel
  " Undo Break {{{2
  inoremap <buffer> , ,<c-g>u
  inoremap <buffer> . .<c-g>u
  inoremap <buffer> ! !<c-g>u
  inoremap <buffer> ? ?<c-g>u
  " as default vim {{{2
  noremap <buffer><nowait> o o
  noremap <buffer><nowait> O O
  noremap <buffer><nowait> <c-i> <c-i>
  noremap <buffer><nowait> <c-o> <c-o>
  " Insert
  inoremap <buffer><nowait> <c-t> <c-t>
  inoremap <buffer><nowait> <c-d> <c-d>
  inoremap <buffer><nowait> <c-u> <c-u>
  " Modify Marks {{{2
  noremap  <buffer><silent> <a-space>   :<c-u>VimwikiToggleListItem<CR>
  nmap     <silent><buffer> +           <Plug>VimwikiIncrementListItem
  vmap     <silent><buffer> +           <Plug>VimwikiIncrementListItem
  nmap     <silent><buffer> _           <Plug>VimwikiDecrementListItem
  vmap     <silent><buffer> _           <Plug>VimwikiDecrementListItem
  " jump over links like ctags {{{2
  nnoremap <buffer><silent> <c-t>       :<c-u>VimwikiGoBackLink<cr>
  nnoremap <buffer><silent> <c-]>       :<c-u>VimwikiFollowLink<cr>
  nnoremap <buffer><silent> <c-w><c-]>  :<c-u>VimwikiVSplitLink reuse<cr>
  nnoremap <buffer><silent> <c-w>g<c-]> :<c-u>VimwikiSplitLink  reuse<cr>
  nnoremap <buffer><silent> <c-w>}      :<c-u>VimwikiTabnewLink<cr>
  xnoremap <buffer><silent> <c-]>       <Plug>VimwikiNormalizeLinkVisual
  "}}}
endfunction
"}}}1

augroup AutoFormatVimwiki
  au!
  "au VimEnter,BufNewFile,BufRead *.md setl ft=vimwiki syn=vimwiki
  au FileType vimwiki setl tabstop=4 softtabstop=4 shiftwidth=4
  au FileType vimwiki setl nowrap fdl=2
  "au FileType vimwiki if expand('%:t') ==# 'md\|markdown' | setl ft=markdown | endif
  au BufWritePre vimwiki/** if &ft  ==# 'vimwiki' | VimwikiTOC
  au BufWritePre index.* if &ft  ==# 'vimwiki' | VimwikiGenerateLinks
  au FileType vimwiki,markdown call s:vimwiki_keymaps()
  au FileType vimwiki,markdown call s:vimwiki_abbrs()
augroup END
