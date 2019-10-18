" From: finder.toml
" Repo: junegunn/fzf.vim
" Fork: kaile256/fzf.vim
" Another: add/fzf.vim
" Another: source/fzf.vim

" Command! expand default w/ preview {{{1
command! -bang -nargs=* FZF
      \ call fzf#vim#files(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%:wrap')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%'),
      \                 <bang>0)

command! -bang -nargs=* Fzf :FZF

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%'),
      \                 <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview({'options': '--reverse'}, 'right:65%')
      \           : fzf#vim#with_preview({'options': '--reverse'}, 'right:65%'),
      \   <bang>0)

" Note: There's no use to wrap 'GFiles?' independently;
"       because '?' is regarded as an arg for 'GFiles'.
" TODO: even on '?'-version, show preview.
command! -bang -nargs=? -complete=dir Gfiles
      \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'), <bang>0)
"}}}1
" Command: expand default reverse, want preview {{{
command! -bang -nargs=* Commands
      \ :call fzf#vim#commands({'options': '--reverse'}, <bang>0)
" TODO: show all the previews:
"   1. detect how does the fzf.vim get the preview.
command! -bang -nargs=* History
      \ :call fzf#vim#history(
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%'),
      \                 <bang>0)
" TODO: make :History --reverse --multi. {{{1
command! -bang -nargs=* -complete=buffer Buffers
      \ :call fzf#vim#buffers(
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%'),
      \                 <bang>0)
"command! -bang -nargs=* -complete=buffer Buffers
"      \ call fzf#vim#buffers(<q-args>,
"      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%')
"      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:60%'),
"      \                 <bang>0)
command! -bang -nargs=* Helptags call fzf#vim#helptags({'options': '--multi --reverse'}, <bang>0)
"}}}
" TODO: selector of terminal-buffer.
command! -bang -nargs=* -complete=buffer Terminal
      \ call fzf#vim#buffers(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%')
      \                         : fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:65%'),
      \                 <bang>0)

"}}}1

" TODO: preview around the selected lines.
"command! -bang -nargs=? -complete=dir BLines
"      \ call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview({'options': '--multi --reverse'}, 'right:50%'), <bang>0)
