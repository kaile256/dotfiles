" TOML: private.toml
" Repo: $DEIN_PRIVATE_HOME/vim-sensible-split

" nnoremap <C-w>s <C-w><C-s>
" nnoremap <C-w>v <C-w><C-v>

" nnoremap <silent> <C-w>s :<C-u> SensibleSplit <CR>
" nnoremap <silent> <C-w>v :<C-u> SensibleSplit <CR>
" nnoremap <silent> <C-w>S :<C-u> abo SensibleSplit <CR>
" nnoremap <silent> <C-w>V :<C-u> abo SensibleSplit <CR>

nmap gf <Plug>(sensible-gf)
xmap gf <Plug>(sensible-gf)
nmap <C-w>f <Plug>(sensible-ctrl-w_f)
xmap <C-w>f <Plug>(sensible-ctrl-w_f)

function! s:stdin(open) abort
  if exists('s:cnt')
    let s:cnt += 1
  else
    let s:cnt = 0
  endif

  let path = expand('%:p:h') .'/stdin_'. s:cnt
  exe a:open path
  setlocal ft=zsh
  augroup myStdin
    au! BufWriteCmd <buffer> :w !$SHELL
  augroup END
endfunction

function! s:scratch(open) abort
  let prefix = tempname()
  let ext = expand('%:e')
  let path = prefix .'.'. (empty(ext) ? 'md' : ext)
  exe a:open path
endfunction

nnoremap <silent> <C-w>n :<C-u>call <SID>stdin(sensible#split())<cr>
nmap <c-w><C-n> <c-w>n
nnoremap <silent> <C-w>N :<C-u>call <SID>scratch(sensible#split())<cr>

augroup mySensibleSplitAdd
  au BufNewFile,BufRead *.{j,t}s{,x} call s:mappings_nextjs()
  function! s:mappings_nextjs() abort
    " Motivation: `gf` will resolve most of relative path via &includeexpr;
    " however, `gf` on '/' brings me to the root of filesystem without this
    " wrapper.

    let mappings = {
          \ 'gf': 'find',
          \ '<C-w>f':     'SensibleMods sfind',
          \ '<C-w><C-f>': 'SensibleMods sfind',
          \ }

    let root_dir = FindRootDirectory()
    let index = root_dir .'/pages/index'
    let map_args = '<buffer><silent><nowait><expr>'

    for lhs in keys(mappings)
      let map = 'nnoremap'
      let map_info = maparg(lhs, 'n', 0, 1)

      if empty(map_info)
        let rhs = lhs
      elseif map_info['buffer'] == 1
        " Stop recursive mappings.
        continue
      else
        if map_info['noremap'] == 0
          let map = 'nmap'
        endif
        let rhs = map_info['rhs']
      endif

      let map .= ' '. map_args
      let rhs_for_index = ':<C-u>'. mappings[lhs] .' '. index .'<CR>'
      let is_cfile_root = 'expand("<cfile>") ==# "/"'

      let rhs = is_cfile_root
            \ .' ? '. string(rhs_for_index)
            \ .' : '. string(rhs)

      exe map lhs rhs
    endfor
  endfunction
augroup END
