" From: browse.toml
" Repo: junegunn/fzf.vim
" Another: add/fzf.vim
" Another: source/fzf.vim

augroup fzf/workaround_for_unexpected_terminal_mode_after_dismissing_fzf
  let s:was_fzf = v:false
  autocmd TermEnter term://*;#FZF let s:was_fzf = v:true
  autocmd WinLeave term://*;#FZF if s:was_fzf | stopinsert | endif
  autocmd WinEnter * let s:was_fzf = v:false
augroup END

" TODO: show previews:
"   1. detect how does the fzf.vim get the preview.
command! -bar -bang -nargs=* Marks
      \ :call fzf#vim#marks(
      \   fzf#vim#with_preview({'options': '--multi --reverse'},
      \     'right:50%'),
      \ )

command! -bar -bang -nargs=* -complete=help Helptags
      \ :call fzf#vim#helptags({
      \   'options': join([
      \     '--multi', '--reverse',
      \     (empty(<q-args>) ? '' : '--query=<q-args>'),
      \     ])
      \   })
