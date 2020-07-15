" From: ftplugin.toml
" Repo: iamcco/markdown-preview.nvim
" Ref: source/markdown-composer.vim

augroup myMarkdowndPreviewSource
  " Note: why? ':au FileType markdown' is no use
  au BufEnter *.{md,mkd,markdown,mdown,mkdn,mdwn} command! -buffer MdPreview     :MarkdownPreview
  au BufEnter *.{md,mkd,markdown,mdown,mkdn,mdwn} command! -buffer MdStopPreview :MarkdownPreviewStop
  " au BufEnter *.{md,mkd,markdown,mdown,mkdn,mdwn} call s:md_keymaps() "{{{1
  " function! s:md_keymaps() abort
  "   nmap <buffer><silent> qR  <Plug>MarkdownPreview
  "   nmap <buffer><silent> qrr <Plug>MarkdownPreview
  " endfunction

  "}}}1
augroup END

" 1: open preview on entering markdown buffer
"let g:mkdp_auto_start = 0 " default: 0

" 1: auto close current preview when change from markdown buffer to another buffer
let g:mkdp_auto_close = 0 " default: 1

" 1: refresh markdown when save the buffer or leave from insert mode
" 0: default; auto refresh markdown as you edit or move the cursor
let g:mkdp_refresh_slow = 1

" 1: :MarkdownPreview can be available for all files,
" 0: default; can be only available in markdown file
"let g:mkdp_command_for_global = 0

" 1: preview server available to others in your network
" 0: default; the server listens on localhost (127.0.0.1)
"let g:mkdp_open_to_the_world = 0

" custom IP to preview
" useful when vim in remote and preview on local browser.
" cf. https://github.com/iamcco/markdown-preview.nvim/pull/9
" default: ''
let g:mkdp_open_ip = ''

" browser to preview
" default: ''
let g:mkdp_browser = 'qutebrowser'

" 1: echo previewd url in command line when opening preview.
" default: 0
let g:mkdp_echo_preview_url = 1

" rename vim function to preview, which receives url as a parameter.
" default: ''
let g:mkdp_browserfunc = ''

" absolute path to custom markdown style
let g:mkdp_markdown_css = 'file://'. g:my_css_home .'/qiita.css'
let g:mkdp_markdown_css = 'file://'. g:my_css_home .'/github.css'

" absolute path to custom highlight style
let g:mkdp_highlight_css = ''

" custom port to start server
" default: '', which start on random port
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = 'preview://${name}'

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
"let g:mkdp_preview_options = {
"      \ 'mkit': {},
"      \ 'katex': {},
"      \ 'uml': {},
"      \ 'maid': {},
"      \ 'disable_sync_scroll': 0,
"      \ 'sync_scroll_type': 'middle',
"      \ 'hide_yaml_meta': 1,
"      \ 'sequence_diagrams': {}
"      \ }

