" From: memo.toml
" Repo: vimwiki/vimwiki
" Path: vimwiki/vimwiki_dev
" Another: source/vimwiki.vim

let g:vimwiki_home = '~/vimwiki'
" Note: task.wiki is not a directory, but a file; cannot :cd.

if !exists('g:winpick_cd_path_dict')
  let g:winpick_cd_path_dict = {}
endif
call extend(g:winpick_cd_path_dict, {
      \ 'k': g:vimwiki_home,
      \ }
      \ )

" Index
command! MdwikiIndex :e ~/vimwiki/mdwiki/index.md
command! TaskWikiIndex :e ~/vimwiki/task.wiki
nnoremap <silent> <space>k<a-e> :<c-u>TaskWikiIndex <cr>
nnoremap <silent> <space>k<a-t> :<c-u>tab sp <bar> TaskWikiIndex <cr>
nnoremap <silent> <space>k<a-v> :<c-u>vs <bar> TaskWikiIndex <cr>
nnoremap <silent> <space>k<a-s> :<c-u>sp <bar> TaskWikiIndex <cr>

" Diary Today
" dafault: -count=0, which makes me jump up to current root.
" when <count> < 0, always brings me to *.wiki.
command! VimwikiToday :call vimwiki#diary#make_note(-1)
command! Diary :call vimwiki#diary#make_note(-1)
"nnoremap <silent> <space>ye     :e <bar> VimwikiToday<cr>
"nnoremap <silent> <space>yb     :tabe <bar> VimwikiToday<cr>
"nnoremap <silent> <space>ys     :sp <bar> VimwikiToday<cr>
"nnoremap <silent> <space>yv     :vs <bar> VimwikiToday<cr>

