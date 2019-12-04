" From: tool.toml
" Repo: kana/vim-submode

function! submode#wrapper(submode, modes, options, lhs, ...) "{{{1
  let dict = a:1
  let rhs = '<Nop>'
  if len(a:000) == 2
    if type(a:1) == type({})
      let [dict, rhs] = [a:1, a:2]
    else
      let [dict, rhs] = [a:2, a:1]
    endif
  endif
  let opts_to_enter = substitute(a:options, 'x', '', 'ge')
  for mode in s:each_char(a:modes)
    call s:define_entering_mapping(a:submode, mode, opts_to_enter, a:lhs, rhs)
    for lhs in keys(dict)
      call s:define_submode_mapping(a:submode, mode, a:options, lhs, dict[lhs])
    endfor
  endfor
endfunction

finish "{{{1

function! s:seq_blackhole(key) abort
  if !get(s:, 'loaded_blackhole', 0) | return | endif
  let s:loaded_blackhole = 1
  call submode#enter_with('seq_blackhole_'. a:key , 'n', '', '<space>'. a:key , '"_'. a:key )
  " Note: :undojoin seems faster than <c-g>U
  call submode#map('seq_blackhole_'. a:key , 'n', 'sr', a:key , ':undojoin <bar> norm! "_'. a:key .'<cr>')
  call submode#map('seq_blackhole_'. a:key , 'n', 'sr', '.' , ':undojoin <bar> norm! "_'. a:key .'<cr>')
endfunction

function! s:undojoiner(key) abort
  if !get(s:, 'loaded_undojoiner', 0) | return | endif
  let s:loaded_undojoiner = 1
  call submode#enter_with('undojoiner_'. a:key , 'n', '', a:key , a:key )
  call submode#map('undojoiner_'. a:key , 'n', 'sr', a:key , ':undojoin <bar> norm! '. a:key .'<cr>')
  call submode#map('undojoiner_'. a:key , 'n', 'sr', '.'   , ':undojoin <bar> norm! '. a:key .'<cr>')
endfunction

"call s:seq_blackhole('x')
"call s:seq_blackhole('X')
"call s:undojoiner('<c-x>')
"call s:undojoiner('<c-a>')

call submode#enter_with('seq_blackhole_x' , 'n', '',  '<space>x' , '"_x' )
call submode#map('seq_blackhole_x' , 'n', 's', 'x' , ':undojoin <bar> norm! "_x<cr>')
call submode#map('seq_blackhole_x' , 'n', 's', '.'     , ':undojoin <bar> norm! "_x<cr>')

call submode#enter_with('seq_blackhole_X' , 'n', '',  '<space>X' , '"_X' )
call submode#map('seq_blackhole_X' , 'n', 's', 'X' , ':undojoin <bar> norm! "_X<cr>')
call submode#map('seq_blackhole_X' , 'n', 's', '.'     , ':undojoin <bar> norm! "_X<cr>')

call submode#enter_with('undojoiner_c-x' , 'n', '',  '<c-x>' , '<c-x>' )
call submode#map('undojoiner_c-x' , 'n', 's', '<c-x>' , ':undojoin <bar> norm! <c-x><cr>')
call submode#map('undojoiner_c-x' , 'n', 's', '.'     , ':undojoin <bar> norm! <c-x><cr>')

call submode#enter_with('undojoiner_c-a' , 'n', '',  '<c-a>' , '<c-a>' )
call submode#map('undojoiner_c-a' , 'n', 's', '<c-a>' , ':undojoin <bar> norm! <c-a><cr>')
call submode#map('undojoiner_c-a' , 'n', 's', '.'     , ':undojoin <bar> norm! <c-a><cr>')
