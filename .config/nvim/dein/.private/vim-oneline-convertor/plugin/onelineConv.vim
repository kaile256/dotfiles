if get(g:, 'onelineConv#no_default_mappings') | finish | endif

cnoremap <expr> <c-r><space>   onelineConv#vimscript('+', ' \| ')
cnoremap <expr> <c-r><c-space> onelineConv#vimscript('+', ' \| ')
cnoremap <expr> <c-r>0     onelineConv#vimscript('0', ' \| ')
cnoremap <expr> <c-r><c-0> onelineConv#vimscript('0', ' \| ')

tnoremap <expr> <c-r><space>   onelineConv#shscript('+')
tnoremap <expr> <c-r><c-space> onelineConv#shscript('+')
tnoremap <expr> <c-r>0     onelineConv#shscript('0')
tnoremap <expr> <c-r><c-0> onelineConv#shscript('0')

augroup oneline-convertor-on-terminal
  au!
  if exists('##TermOpen')
    au TermOpen * call s:deal_mappings()
  elseif exists('##TerminalOpen')
    au TerminalOpen * call s:deal_mappings()
  endif
augroup END

function! s:deal_mappings() abort
  let save_view = winsaveview()
  call s:keymaps_on_terminal()
  call winrestview(save_view)
endfunction

function! s:keymaps_on_terminal() abort
  if &bt !=# 'terminal' | return | endif

  nnoremap <silent><buffer> p :pu=onelineConv#shscript(v:register)<CR>
endfunction
