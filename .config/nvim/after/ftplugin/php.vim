" Ref: $VIMRUNTIME/syntax/php.vim

let g:sql_type_default = 'mysql' " default: sqloracle

let g:php_baselib   = 1
let g:php_sql_query = 1
let g:php_htmlInStrings = 1
" let g:php_noShortTags = 1

" the chars folloing '&'
inoreabbr &<; &lt;
inoreabbr &>; &gt;
inoreabbr &&; &amp;
inoreabbr &"; &quot;
inoreabbr &'; &#39;
" inoreabbr &<space>; &nbsp;

command! -buffer -bar PreviewOnBrowser :call s:preview_on_browser()

function! s:preview_on_browser() abort "{{{1
  let fname = expand('%:p')
  let url = substitute(fname, '.*/public_html/', 'https://localhost/~'. $USER .'/', '')
  exe '!xdg-open' url
endfunction

