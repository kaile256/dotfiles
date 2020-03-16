" From: ftplugin.toml
" Repo: euclio/vim-markdown-composer
" Ref: source/markdown-preview.vim

let g:markdown_composer_custom_css = [
      \ 'file://'. g:my_css_home .'/qiita.css',
      \ 'file://'. g:my_css_home .'/github.css',
      \ ]

let g:markdown_composer_syntax_theme = 'qiita' " default: github

let g:markdown_composer_autostart = 0
