" From: ftplugin.toml
" Repo: joker1007/vim-markdown-quote-syntax

" Add syntax rule; see g:markdown_quote_syntax_defaults
"   in joker1007/vim-markdown-quote-syntax/plugin/markdown_quote_syntax.vim
let g:markdown_quote_syntax_filetypes = {
      \ 'coffee' : {'start' : 'coffee'},
      \ 'css' : {'start' : '\\%(css\\|scss\\)'},
      \}


" Add other filetypes where this plugin will work
let g:markdown_quote_syntax_on_filetypes = ['text']

"" Each codeblock is defined as:
""
""    'codeblock[0].filetype.codeblock[1]<code lines>codeblock[2]'
""
"" Above example is for the liquid highlight tag. (It is already included by default.)
""    {% highlight vim %}
""    any codes
""    ...
""    {% endhighlight %}
"let g:markdown_quote_syntax_codeblocks = {
"      \ "^\\s*{% *highlight \\+", "\\( .*%\\|%\\)}",
"      \ : "^\\s*{% *endhighlight\\( .*%\\|%\\)}",
"      \ }

