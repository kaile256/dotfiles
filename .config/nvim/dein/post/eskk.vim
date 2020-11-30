scriptencoding utf-8
" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: add/eskk.vim
" Another: source/eskk.vim

augroup myEskkSo-ToggleCocConfig
  " Makeshift for `[coc.nvim] error: Some plugin change completeopt on insert mode`
  au User eskk-enable-pre  call coc#config('suggest', {'autoTrigger': 'trigger'})
  au User eskk-disable-pre call coc#config('suggest', {'autoTrigger': 'always'})
augroup END

augroup myEskkSo-ToggleTextwidth
  " Note: eskk with &tw > 0 disturbs `henkan` state.
  au User eskk-enable-post  let s:save_textwidth = &tw | setlocal tw=0
  au User eskk-disable-post let &tw = s:save_textwidth
augroup END

" if executable('notify-send')
"   augroup myEskkSo-NotifyState
"     au User eskk-enable-post  call system("notify-send --expire-time 1100 --urgency critical 'Vim: eskk is Activated'")
"     au User eskk-disable-post call system("notify-send --expire-time 1100 'Vim: eskk is OFF'")
"   augroup END
" endif

augroup myEskkSo-SetMappings
  au User eskk-initialize-pre  call s:eskk_keymaps_initialize_pre()
  au User eskk-initialize-post call s:eskk_keymaps_initialize_post()
  au User eskk-enable-post     call s:eskk_keymaps_enable_post()
augroup END

function! s:eskk_keymaps_enable_post() abort
  function! s:eskk_filter(key) abort
    return eskk#filter(eskk#util#key2char(a:key))
  endfunction

  function! s:eskk_with_lexima() abort
    function! s:_eskk_with_lexima(key) abort
      exe 'lnoremap <expr><buffer><silent>' a:key 'search(''[xz]\%#'', "nb")'
            \ '? <SID>eskk_filter(' string(a:key) ')'
            \ ': mode() =~# "i"'
            \   '? lexima#insmode#_expand(' string(a:key) ')'
            \   ': lexima#cmdmode#_expand(' string(a:key) ')'
    endfunction

    const keys = '''"(){}'
    for l:key in split(keys, '\zs')
      call s:_eskk_with_lexima(l:key)
    endfor
  endfunction
  call s:eskk_with_lexima()

  " Note: `l` to disable esp. for lexima.
  lnoremap <expr><buffer> l search('[xz]\%#', 'nb') ? <SID>eskk_filter('l') : eskk#disable()
  lnoremap <expr><buffer> . search('\d\%#', 'nb') ? '.' : <SID>eskk_filter('.')
endfunction

function! s:eskk_keymaps_initialize_pre()
  " NOTE: This config below leaves the last character "z"
  " \ if g:eskk#rom_input_style is not "skk".
  for [orgtable, mode] in [['rom_to_hira', 'hira'], ['rom_to_kata', 'kata']]
    let t = eskk#table#new(orgtable .'*', orgtable)
    " Marks
    call t.add_map('tm', '™')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')

    call t.add_map('z~', '～')
    call t.add_map('z ', '　')

    call t.add_map('- ', '- ') " esp for markdown's list item.

    " Hankaku (:/;) as usual; zenkaku with prefix
    call t.add_map(':', ':')
    call t.add_map('x:', ':')
    " call t.add_map(';', ';')
    " call t.add_map('x;', ';')

    call t.add_map('x-', '-')
    call t.add_map('x,', ',')
    call t.add_map('x.', '.')
    call t.add_map('x/', '/') " Raw '/' will input '@'.

    " " Input the dot after a number as-is (e.g. `1.`)
    " for n in range(10)
    "   call t.add_map(n, n)
    "   call t.add_map(n .'.', n .'.')
    " endfor

    call eskk#register_mode_table(mode, t)
  endfor
endfunction

function! s:eskk_keymaps_initialize_post() abort
  " TODO: <C-j> should work as <CR>
  EskkMap -force -type=enter-key <c-j>
  "EskkMap -force -type=mode:hira:toggle-kata <TAB>
  "EskkMap -force -type=mode:hira:q-key <TAB>
  "EskkMap -force -type=mode:kata:toggle-kata <TAB>
  "EskkMap -force -type=mode:kata:q-key <TAB>
  "EskkMap -force -type=mode:hankata:toggle-kata <TAB>
  "EskkMap -force -type=mode:hankata:q-key <TAB>

  "EskkMap -type=mode:hira:toggle-kata q
  "EskkMap -type=mode:hira:q-key q
  "EskkMap -type=mode:kata:toggle-kata q
  "EskkMap -type=mode:kata:q-key q
  "EskkMap -type=mode:hankata:toggle-kata q
  "EskkMap -type=mode:hankata:q-key q
endfunction

