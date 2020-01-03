" From: finder.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Another: add/fzf.vim
" Another: source/fzf.vim

" `reducer` (funcref)
" - Reducer transforms the output lines of fzf into a single string value
" `prefix` (string or funcref; default: `\k*$`)
" - Regular expression pattern to EXTRACT the completion prefix
" - Or a function to extract completion prefix
" Both `source` and `options` can be given as funcrefs that take the completion
" prefix as the argument and return the final value
" `sink` or `sink*` are ignored
"
"  " Global line completion (not just open buffers. ripgrep required.)
"  inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
"    \ 'prefix': '^.*$',
"    \ 'source': 'rg -n ^ --color always',
"    \ 'options': '--ansi --delimiter : --nth 3..',
"    \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
"

" Command! expand default w/ preview {{{1
command! -bar -bang -nargs=* Files :call fzf#vim#files(<q-args>,
      \ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%:wrap'),
      \ )


command! -bar -bang -nargs=* Ag :call fzf#vim#ag(<q-args>,
      \ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%:wrap'),
      \ )

command! -bar -bang -nargs=* Rg :call fzf#vim#grep(
      \ 'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%:wrap')
      \ )

" Note: There's no use to wrap 'GFiles?' independently;
"       because '?' is regarded as an arg for 'GFiles'.
" TODO: even on '?'-version, show preview.
command! -bar -bang -nargs=? -complete=dir Gfiles :call fzf#vim#gitfiles(<q-args>,
      \ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%')
      \ )

" Command: expand default reverse, want preview {{{1
command! -bar -bang -nargs=* Commands
      \ :call fzf#vim#commands({'options': '--multi', '--reverse'}, <bang>0)

" TODO: show all the previews:
"   1. detect how does the fzf.vim get the preview.
command! -bar -bang -nargs=* Marks :call fzf#vim#marks(
      \ fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%'),
      \ )

command! -bar -bang -nargs=* History
      \ :call fzf#vim#history(
      \                 <bang>0 ? fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%')
      \                         : fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%'),
      \                 <bang>0)
" TODO: make :History --reverse --multi. {{{1
command! -bar -bang -nargs=* -complete=buffer Buffers
      \ :call fzf#vim#buffers(
      \                 <bang>0 ? fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%')
      \                         : fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%'),
      \                 <bang>0)
"command! -bang -nargs=* -complete=buffer Buffers
"      \ call fzf#vim#buffers(<q-args>,
"      \                 <bang>0 ? fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%')
"      \                         : fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%'),
"      \                 <bang>0)

command! -bar -bang -nargs=* Helptags call fzf#vim#helptags(
      \ fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%'),
      \ )


" TODO: preview not only the very line, but all around the selected lines.
"command! -bang -nargs=? -complete=dir BLines
"      \ call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview({'prefix': "'.git/", 'options': '--multi --reverse'}, 'right:50%'), <bang>0)
