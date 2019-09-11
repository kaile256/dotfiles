" From: tool.toml

let g:LanguageClient_serverCommands = {
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
            \ 'python': ['/usr/local/bin/pyls'],
            \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
            \ "vim": ['~/.yarn/bin/vim-language-server']
            \ }

nnoremap <silent> K    :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd   :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

function! LC_maps()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K    :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd   :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    endif
endfunction
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
