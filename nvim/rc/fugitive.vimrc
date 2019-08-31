" From: Init.toml
" Repo: fugitive.vim

" Read  # overwrite buffer with the last commited version.
noremap <silent> <a-y>r     :<c-u>Gread<cr>
noremap <silent> <a-y><a-r> :<c-u>Gread<cr>
" Move  # rename current file and the buffer.
noremap <silent> <a-y>n     :<c-u>Gmove<cr>
noremap <silent> <a-y><a-n> :<c-u>Gmove<cr>

" Diff {{{
" !: On a Merge Conflict, do a 3-diff; otherwise the same as without bang.
noremap <silent> <a-y>d     :<c-u>Gvdiffsplit!<cr>gg
noremap <silent> <a-y><a-d> :<c-u>Gvdiffsplit!<cr>gg
" TODO: if no diff with the last git buffer, show diff with the 2nd last git buffer.
command! GvdiffWithUnstaged :vert bel Git! diff --staged
noremap <silent> <a-y><a-u> :<c-u>GvdiffWithUnstaged<cr>
"}}}

" Info; Log {{{
" Without `b#` `:Glog` with `:copen` fills previous window.
"# QuickFix -- Edit-History of current buffer.
noremap <silent> <a-y>l     :<c-u>tab sp <bar> Glog <bar> copen<cr>
noremap <silent> <a-y><a-l> :<c-u>tab sp <bar> Glog <bar> copen<cr>
"# QuickFix -- Commit-Log of git-repository.
noremap <silent> <a-y>c     :<c-u>tab sp <bar> Glog -- <cr>
noremap <silent> <a-y><a-c> :<c-u>tab sp <bar> Glog -- <cr>
"# QuickFix -- Commit-Log from master to current branch.
noremap <silent> <a-y>m     :<c-u>tab sp <bar> Glog master..HEAD --<cr>
noremap <silent> <a-y><a-m> :<c-u>tab sp <bar> Glog master..HEAD --<cr>
"}}}
" Info; Blame {{{
noremap <silent> <a-y>b     :<c-u>Gblame<cr>
noremap <silent> <a-y><a-b> :<c-u>Gblame<cr>
"}}}
" Info; Status {{{
noremap <silent> <a-y>s     :<c-u>vert bot 40 Gstatus<cr>
noremap <silent> <a-y><a-s> :<c-u>vert bot 40 Gstatus<cr>
"}}}

" Add; Only {{{
noremap <silent> <a-y>a     :<c-u>Gw<cr>
noremap <silent> <a-y><a-a> :<c-u>Gw<cr>
"}}}

" Add; && Status {{{
noremap <silent> <a-y>w     :<c-u>Gw<cr>:vert bot 40 Gstatus<cr>
noremap <silent> <a-y><a-w> :<c-u>Gw<cr>:vert bot 40 Gstatus<cr>
"}}}

" Remote; Pull {{{
noremap <silent> <a-y>l     :<c-u>Gpull<cr>
noremap <silent> <a-y><a-l> :<c-u>Gpull<cr>
"}}}
" Remote; Push {{{
noremap <silent> <a-y>h     :<c-u>Gpush<cr>
noremap <silent> <a-y><a-h> :<c-u>Gpush<cr>
"}}}

"" Grep {{{
"" -I: no binary files
"noremap <a-y>g     :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
"noremap <a-y><a-g> :<c-u>silent Ggrep  <bar> cw<Left><Left><Left><Left><Left>
"" show options
"noremap <a-y>p     :<c-u>Ggrep --help<cr>
"noremap <a-y><a-p> :<c-u>Ggrep --help<cr>
"}}}

" Branch; Checkout {{{
noremap <a-y>o     :<c-u>Git checkout<space>
noremap <a-y><a-o> :<c-u>Git checkout<space>
"}}}

function! s:on_gitcommit_startinsert() "{{{
  if getline(1) == ''
    if getline(2) == '# Please enter the commit message for your changes. Lines starting'
      startinsert
    endif
  endif
endfunction "}}}

function! s:on_fugitive_keymap()
  " TODO: open gitcommit bufwin thinner.
  nnoremap <buffer><silent> cc    :<C-U>bot 10 Gcommit<CR>
  nnoremap <buffer><silent> ca    :<C-U>bot 10 Gcommit --amend<CR>
endfunction

augroup OnFugitiveBuffer

  au!
  au FileType fugitive,gitcommit,fugitiveblame setl nonumber signcolumn= bt=quickfix
  au FileType fugitive call <SID>on_fugitive_keymap()
  au FileType gitcommit setl spell
  au FileType gitcommit call <SID>on_gitcommit_startinsert()

augroup END
