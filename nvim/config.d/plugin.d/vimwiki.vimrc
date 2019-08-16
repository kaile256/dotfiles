"""" From: tool.toml

"""" KEYMAP
""" CAUTION: <Plug>:VimWiki~~ seems to work wrong.

nnoremap <silent> <a-w><a-e> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-s> :sp <cr> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-v> :vs <cr> :VimwikiIndex<cr>
nnoremap <silent> <a-w><a-t> :VimwikiTabIndex<cr>
nnoremap <silent> <a-w><a-b> :VimwikiTabIndex<cr>

nnoremap <silent> <a-w><a-u> :VimwikiUISelect<cr>

nnoremap <silent> <a-e><a-e> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-s> :sp   <cr> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-v> :vs   <cr> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-t> :tabe <cr> :VimwikiDiaryIndex<cr>
nnoremap <silent> <a-e><a-s> :tabe <cr> :VimwikiDiaryIndex<cr>

augroup VimWiki
  au!
  au FileType wiki call s:vimwiki_keymap()
  au BufWritePre *.wiki VimwikiTOC
augroup END

function! s:vimwiki_keymap()

  """ Conversion
  nnoremap <buffer><silent> <a-x><a-h> :Vimwiki2HTMLBrowse <bar> echo 'Converting Current Buffer to HTML...'

  """ Todo
  nnoremap <buffer><silent> <a-g><a-g> :VimwikiToggleListItem<cr>
  """ FollowLink
  nnoremap <buffer><silent> <a-g><a-f> :VimwikiFollowLink<cr>
  nnoremap <buffer><silent> <a-g><a-s> :VimwikiSplitLink<cr>
  nnoremap <buffer><silent> <a-g><a-v> :VimwikiVSplitLink<cr>
  nnoremap <buffer><silent> <a-g><a-v> :VimwikiTabnewLink<cr>

  """ Create New Link
  nnoremap <buffer><silent> <a-g><a-n><a-f> :VimwikiGoto<cr>
  nnoremap <buffer><silent> <a-g><a-n><a-n> :sp   <cr> :VimwikiGoto<cr>
  nnoremap <buffer><silent> <a-g><a-n><a-s> :sp   <cr> :VimwikiGoto<cr>
  nnoremap <buffer><silent> <a-g><a-n><a-v> :vs   <cr> :VimwikiGoto<cr>
  nnoremap <buffer><silent> <a-g><a-n><a-t> :tabe <cr> :VimwikiGoto<cr>
  nnoremap <buffer><silent> <a-g><a-n><a-b> :tabe <cr> :VimwikiGoto<cr>

  """ Link Like Tags
  nnoremap <buffer><silent> <c-t>           :VimwikiGoBackLink<cr>
  nnoremap <buffer><silent> <c-t>           :VimwikiFollowLink<cr>
endfunction
