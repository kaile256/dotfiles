" TOML: appearance.toml
" Repo: itchyny/lightline.vim
" Another: source/lightline.vim

" Modify the palette
" Ref: itchyny/lightline.vim/autoload/lightline/colorscheme/one.vim
let s:p = {}
" guifg guibg ctermfg ctermbg
let s:p['tabline'] = {
      \ 'middle': [[
      \   '#abb2bf',
      \   '#2c323d',
      \   145,
      \   235,
      \ ], [
      \   '#abb2bf',
      \   '#3e4452',
      \   145,
      \   240,
      \ ]]
      \ }

for s:key in keys(s:p)
  call extend(g:lightline#colorscheme#one#palette[s:key], s:p[s:key])
endfor
unlet s:p s:key

