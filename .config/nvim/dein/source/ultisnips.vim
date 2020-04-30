" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: add/ultisnips.vim

runtime once/smaps.vim

hi! link snipLeadingSpaces NonText

let g:UltiSnipsEditSplit = 'context'

let g:UltiSnipsSnippetDirectories = [
      \ $XDG_CONFIG_HOME .'/nvim/data/Ultisnips',
      \ ]

let g:UltiSnipsRemoveSelectModeMappings = 0

" Note: the variables to map should be filled to suppress unexpected, local
"   behaviors.
" Note: g:UltiSnipsListSnippets can be left empty.
let g:UltiSnipsListSnippets = ''

" Note: when g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger, it
" works as expand-or-jump mapping.
let g:UltiSnipsExpandTrigger      = '<Nop>'
let g:UltiSnipsJumpForwardTrigger = '<Nop>'
"
" Note: i_CTRL-F adjusts indent with no insertions where '!^F' in &cinkeys.
" Note: behaves as no mappings unless snippets are in editing.
let g:UltiSnipsJumpForwardTrigger  = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'

inoremap <expr> <SID>(ultisnips-jump-forward)  UltiSnips#JumpForwards()
inoremap <expr> <SID>(ultisnips-jump-backward) UltiSnips#JumpBackwards()
snoremap <expr> <SID>(ultisnips-jump-forward)  UltiSnips#JumpForwards()
snoremap <expr> <SID>(ultisnips-jump-backward) UltiSnips#JumpBackwards()

" Note: behaves as no mappings unless snippets are in editing.
" Note: i_CTRL-F adjusts indent with no insertions where '!^F' in &cinkeys.
inoremap <script> <c-f> <SID>(ultisnips-jump-forward)
inoremap <script> <c-b> <SID>(ultisnips-jump-backward)
snoremap <script> <c-f> <SID>(ultisnips-jump-forward)
snoremap <script> <c-b> <SID>(ultisnips-jump-backward)

augroup myUltisnipsSo
  if exists('myUltisnipsSo') | au! myUltisnipsSo
  endif
  " Note: neosnippet could override default ft.
  au FileType neosnippet
        \ if expand('%:e') ==# 'snippets' | setl ft=snippets | endif
  "au BufWrite *.snippets call UltiSnips#RefreshSnippets()
augroup END
