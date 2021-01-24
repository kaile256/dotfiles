" TOML: default.toml
" Repo: Houl/repmo-vim
" Another: post/repmo.vim

" Note:
" #SelfKey() for non-recursive mappings like <C-y> to <C-y>/<C-e>.

noremap <SID>(zv) :<C-u>sleep 5m<CR>zv
nmap <expr><silent> [x repmo#Key('<Plug>(coc-diagnostic-prev)', '<Plug>(coc-diagnostic-next)') .'<SID>(zv)'
nmap <expr><silent> ]x repmo#Key('<Plug>(coc-diagnostic-next)', '<Plug>(coc-diagnostic-prev)') .'<SID>(zv)'
xmap <expr><silent> [x repmo#Key('<Plug>(coc-diagnostic-prev)', '<Plug>(coc-diagnostic-next)') .'<SID>(zv)'
xmap <expr><silent> ]x repmo#Key('<Plug>(coc-diagnostic-next)', '<Plug>(coc-diagnostic-prev)') .'<SID>(zv)'

noremap <expr> ]s repmo#Key(']s', '[s')
noremap <expr> [s repmo#Key('[s', ']s')

function! s:shot(char) abort
  if dein#tap('vim-easymotion')
    const n = "\<Plug>(easymotion-next)"
    const N = "\<Plug>(easymotion-prev)"
    if a:char =~# '\l'
      const forward = n
      const backward = N
    else
      const forward = N
      const backward = n
    endif

    const Repmo = call('repmo#Key', [forward, backward])
    const Plug = "\<Plug>(easymotion-". a:char .')'
    return Plug
  endif

  if dein#tap('vim-shot-f')
    return repmo#ZapKey("\<Plug>(shot-f-". a:char .')')
  endif

  return repmo#ZapKey(a:char)
endfunction
map <expr> f <SID>shot('f')
map <expr> F <SID>shot('F')
map <expr> t <SID>shot('t')
map <expr> T <SID>shot('T')
sunmap f
sunmap F
sunmap t
sunmap T

nnoremap <silent> <Plug>(next-TODO) :<C-u>call search('TODO:', '')<CR>
nnoremap <silent> <Plug>(prev-TODO) :<C-u>call search('TODO:', 'b')<CR>
nmap <expr> [T repmo#Key('<Plug>(prev-TODO)', '<Plug>(next-TODO)')
nmap <expr> ]T repmo#Key('<Plug>(next-TODO)', '<Plug>(prev-TODO)')

nnoremap <expr> g; repmo#Key('g;', 'g,')
nnoremap <expr> g, repmo#Key('g,', 'g;')
xnoremap <expr> g; repmo#Key('g;', 'g,')
xnoremap <expr> g, repmo#Key('g,', 'g;')

