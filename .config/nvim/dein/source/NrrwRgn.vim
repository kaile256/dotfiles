" TOML: ext.toml
" Repo: chrisbra/NrrwRgn
" Another: add/NrrwRgn.vim

let g:nrrw_topbot_leftright = 'botright'

augroup myNrrwRgnSo
  " :WidenRegion writes back to original buffer.
  au BufWriteCmd NrrwRgn_ginit_* :WidenRegion
augroup END
