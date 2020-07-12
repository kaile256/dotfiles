" From: insert.toml
" Ref: neosnippet.vim
" Ref: ultisnips.vim

if exists('g:loaded_smaps_for_snippets') | finish | endif
let g:loaded_smaps_for_snippets = 1

function! s:neo_esc(key) abort
  if getline('.')[col("'<") + 1 : col("'>") + 1] =~# '^#'
    " Care only about current line

    let col_visual_end =  '\%'. (col("'>") + 1) .'c'
    let commet_area = '.*\zs\\\@!#.\{-}'. col_visual_end
    let Remove_comment = 's/'. commet_area .'/'
    let Remove_comment = ':<C-u> keeppatterns keepjumps '. Remove_comment .'<CR>'
    return "\<Esc>". Remove_comment . a:key
  endif
  return "\<Esc>". a:key
endfunction

snoremap <expr> <A-h> <SID>neo_esc('')
snoremap <expr> <A-j> <SID>neo_esc('j')
snoremap <expr> <A-k> <SID>neo_esc('k')
snoremap <expr> <A-l> <SID>neo_esc('l')

snoremap <a-a> <esc>a

" Insert mode like {{{1
snoremap <BS>  <space><BS>
snoremap <c-u> <space><c-u>
snoremap <c-w> <space><c-w>

snoremap <c-d> <space><BS><c-d>
snoremap <c-t> <space><BS><c-t>

" Put Register on Snippet Expanding {{{1
snoremap <silent> <c-r> <space><BS><esc>:call feedkeys("\<c-r>")<cr>
snoremap <c-r><c-space> <space><BS><c-r>+
snoremap <c-r><space>   <space><BS><c-r>+

" Alt-ESC; registers {{{1
snoremap <silent> <A-S-P> <space><BS><c-g>u<esc>:call feedkeys('P')<cr>
snoremap <silent> <A-S-p> <space><BS><c-g>u<esc>:call feedkeys('p')<cr>

snoremap <silent> <A-S-Y> <space><BS><esc>y$
snoremap <silent> <A-S-X> <space><BS><esc>:call feedkeys('X')<cr>
snoremap <silent> <A-S-D> <space><BS><esc>:call feedkeys('D')<cr>
snoremap <silent> <A-S-C> <space><BS><esc>:call feedkeys('C')<cr>
snoremap <silent> <a-y>   <space><BS><esc>:call feedkeys('y')<cr>
snoremap <silent> <a-x>   <space><BS><esc>:call feedkeys('x')<cr>
snoremap <silent> <a-d>   <space><BS><esc>:call feedkeys('d')<cr>
snoremap <silent> <a-c>   <space><BS><esc>:call feedkeys('c')<cr>
snoremap <silent> <a-u>   <space><BS><esc>:call feedkeys('u')<cr>
snoremap <silent> <A-C-R> <space><BS><esc><c-r>

" Note: 'U' respects vi-compatible way of `uu`.
snoremap <A-S-U> <esc>U
snoremap <A-S-P> <c-g>u<esc>P
