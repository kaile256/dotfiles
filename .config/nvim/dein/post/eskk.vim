scriptencoding utf-8
" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: add/eskk.vim
" Another: source/eskk.vim

augroup myEskkSource
  " Note: `l` to disable esp. for lexima.
  " FIXME: work in eskk's sequences like 'zl' to insert an arrow.
  au User eskk-enable-post lnoremap <expr><buffer> l eskk#disable()

  au User eskk-initialize-pre call s:eskk_kemaps_initialize_pre()
  function! s:eskk_kemaps_initialize_pre() "{{{
    " A user can do something heavy process here.
    let t = eskk#table#new('rom_to_hira*', 'rom_to_hira')
    call t.add_map('z~', '～')
    call t.add_map('zc', '©')
    call t.add_map('zr', '®')
    call t.add_map('tm', '™')
    call t.add_map('z ', '　')
    call t.add_map('z.', '.')
    """ Input the dot after a number as-is (e.g. "1.")
    " NOTICE: in the eskk's maps, cannot type sequence of numbers
    " for n in range(10)
    "  call t.add_map(n . '.', n . '.')
    " endfor
    call eskk#register_mode_table('hira', t)
    " http://subtech.g.hatena.ne.jp/motemen/20110527/1306485690
    " NOTE: This config below leaves the last character "z"
    " \ if g:eskk#rom_input_style is not "skk".
    for [orgtable, mode] in [['rom_to_hira', 'hira'], ['rom_to_kata', 'kata']]
      let t = eskk#table#new(orgtable.'*', orgtable)
      call t.add_map('zw', 'w', 'z')
      call eskk#register_mode_table(mode, t)
    endfor
  endfunction "}}}
  au User eskk-initialize-post call s:eskk_keymaps_initialize_post()
  function! s:eskk_keymaps_initialize_post() abort "{{{
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
  endfunction "}}}

  if executable('notify-send')
    au User eskk-enable-post  call system("notify-send --expire-time 1100 --urgency critical 'Vim: eskk is Activated'")
    au User eskk-disable-post call system("notify-send --expire-time 1100 'Vim: eskk is OFF'")
  endif

  " Note: eskk with &tw > 0 disturbs `henkan` state.
  au User eskk-enable-post  let s:save_textwidth = &tw | setlocal tw=0
  au User eskk-disable-post let &tw = s:save_textwidth
augroup END/eskk.vim

