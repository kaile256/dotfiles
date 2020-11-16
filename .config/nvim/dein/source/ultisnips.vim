" TOML: insert.toml
" Repo: SirVer/ultisnips
" Another: add/ultisnips.vim
" Another: post/ultisnips.vim

runtime once/smaps.vim

hi! link snipLeadingSpaces NonText

let $SNIPPETS_HOME = expand('$VIM_ANOTHER_HOME/UltiSnips/')

augroup myUltisnipsSo
  au FileType snippets setlocal keywordprg=:help
  au FileType snippets let &l:path = join([
        \ $SNIPPETS_HOME,
        \ $DEIN_GITHUB_DIR .'/**/UltiSnips/',
        \ ], '**,') .'**'
  au FileType snippets setlocal suffixesadd=.snippets
  " Note: neosnippet could override default ft.
  au Syntax neosnippet if expand('%:e') ==# 'snippets' |
        \ setlocal ft=snippets
        \ | endif
  au BufWritePost *.snippets call UltiSnips#RefreshSnippets()
augroup END

let g:UltiSnipsEditSplit = 'context'

" Note: the variables to map should be filled to suppress unexpected, local
"   behaviors.
" Note: g:UltiSnipsListSnippets can be left empty.
let g:UltiSnipsListSnippets = ''

" Note: when g:UltiSnipsExpandTrigger == g:UltiSnipsJumpForwardTrigger, it
" works as expand-or-jump mapping.
let g:UltiSnipsExpandTrigger = '<Plug>(nop)'
" Note: The Jump-mppings only override keys while UltiSnips working.
let g:UltiSnipsJumpForwardTrigger = '<C-g>'
" Note: <Esc> stops working snippets, which often happens inconsiderately.
let g:UltiSnipsJumpBackwardTrigger = '<C-t>'

let g:UltiSnipsSnippetDirectories = [
      \ $SNIPPETS_HOME,
      \ 'UltiSnips',
      \ expand('$DEIN_GITHUB_DIR/honza/vim-snippets/UltiSnips'),
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
