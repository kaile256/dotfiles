" TOML: xampp.toml
" Repo: greyblake/vim-preview

let g:loaded_preview

command! -bar PreviewHtml call s:PreviewHtml()

function! s:PreviewHtml()
    if s:PreviewVerifyRuby()
        call preview#show_html()
    endif
endfunction

function s:PreviewVerifyRuby()
    if has('ruby')
        return 1
    else
        echo 'To use Preview plugin you should compile vim with --enable-rubyinterp option'
        return 0
    endif
endfunction
