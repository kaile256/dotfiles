" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: add/ultisnips.vim

runtime once/smaps.vim

hi! link snipLeadingSpaces NonText

augroup myUltisnipsSo
  au FileType snippets setlocal keywordprg=:help
  " Note: neosnippet could override default ft.
  au Syntax neosnippet if expand('%:e') ==# 'snippets' |
        \ setlocal ft=snippets
        \ | endif
  "au BufWrite *.snippets call UltiSnips#RefreshSnippets()
augroup END

let g:UltiSnipsEditSplit = 'context'

" Note: the variables to map should be filled to suppress unexpected, local
"   behaviors.
" Note: g:UltiSnipsListSnippets can be left empty.
let g:UltiSnipsListSnippets = ''

" Note: when g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger, it
" works as expand-or-jump mapping.
let g:UltiSnipsExpandTrigger = ''
" Note: The Jump-mppings only override keys while UltiSnips working.
let g:UltiSnipsJumpForwardTrigger = '<C-]>'
nnoremap <C-]> <Nop>
" Note: <Esc> stops working snippets, which often happens inconsiderately.
let g:UltiSnipsJumpBackwardTrigger = '<C-[>'

let g:UltiSnipsSnippetDirectories = [
      \ expand('$DEIN_GITHUB_DIR/honza/vim-snippets/UltiSnips'),
      \ expand('$VIM_ANOTHER_HOME/UltiSnips'),
      \ ]

let g:UltiSnipsRemoveSelectModeMappings = 0

finish "{{{1

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
