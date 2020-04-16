" Ref: $VIMRUNTIME/ftplugin/php.vim

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

