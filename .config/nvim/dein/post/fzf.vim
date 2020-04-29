" From: finder.toml
" Repo: junegunn/fzf.vim
" Another: add/fzf.vim
" Another: source/fzf.vim

" TODO: show previews:
"   1. detect how does the fzf.vim get the preview.
command! -bar -bang -nargs=* Marks
      \ :call fzf#vim#marks(
      \   fzf#vim#with_preview({'options': '--multi --reverse'},
      \     'right:50%'),
      \ )

command! -bar -bang -nargs=* Helptags
      \ :call fzf#vim#helptags(
      \   fzf#vim#with_preview({'options': '--multi --reverse'},
      \     'right:50%'),
      \ )
