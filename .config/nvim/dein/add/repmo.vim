  " TOML: motion.toml
  " Repo: Houl/repmo-vim
  " Another: post/repmo.vim

  " Note:
  " You can find the key set by `repmo#Stl()`.
  " repmo#SelfKey() for non-recursive mappings like <C-y> to <C-y>/<C-e>.

  noremap <expr> ]] repmo#Key(']]zzzv', ']]zzzv')
  noremap <expr> [[ repmo#Key('[[zzzv', '[[zzzv')
  noremap <expr> ][ repmo#Key('][zzzv', '[]zzzv')
  noremap <expr> [] repmo#Key('[]zzzv', '][zzzv')
  sunmap ]]
  sunmap [[
  sunmap ][
  sunmap []

  noremap <expr> ]s repmo#Key(']s', '[s')
  noremap <expr> [s repmo#Key('[s', ']s')
  sunmap ]s
  sunmap [s

  function! s:shot(char) abort
    if dein#tap('lightspeed.nvim')
      const lightspeeds = {
            \ 'f': "\<Plug>Lightspeed_s",
            \ 't': "\<Plug>Lightspeed_t",
            \ 'F': "\<Plug>Lightspeed_S",
            \ 'T': "\<Plug>Lightspeed_T",
            \ }
      const Plug = lightspeeds[a:char]
      const n = "\<Plug>(lightspeed-repeat-as-it-was)"
      const N = "\<Plug>(lightspeed-repeat-in-opposite)"

    elseif dein#tap('hop.nvim')
      const hops = {
            \ 'f': '<Cmd> HopChar1AC <CR>',
            \ 'F': '<Cmd> HopChar1BC <CR>',
            \ 't': '',
            \ 'T': '',
            \ }
      const Plug = hops[a:char]
      const n = "\<Cmd>HopChar1AC\<CR>" " After Cursor
      const N = "\<Cmd>HopChar1BC\<CR>" " Before Cursor

    elseif dein#tap('vim-easymotion')
      const Plug = "\<Plug>(easymotion-". a:char .')'
      const n = "\<Plug>(easymotion-next)"
      const N = "\<Plug>(easymotion-prev)"
    endif

    if exists('N')
      if a:char =~# '\l'
        const forward = n
        const backward = N
      else
        const forward = N
        const backward = n
      endif

      const Repmo = call('repmo#Key', [forward, backward])
      return Plug

    elseif dein#tap('vim-shot-f')
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

nnoremap <expr> g; repmo#Key('g;zv', 'g,zv')
nnoremap <expr> g, repmo#Key('g,zv', 'g;zv')
xnoremap <expr> g; repmo#Key('g;zv', 'g,zv')
xnoremap <expr> g, repmo#Key('g,zv', 'g;zv')
