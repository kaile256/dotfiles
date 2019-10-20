" From: insert.toml

" 'cpsm' also sorts the candidates using cpsm.
call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
call deoplete#custom#source('_', 'sorters', [])

" Pass a dictionary to set multiple options
call deoplete#custom#option({
      \ 'auto_complete_delay': 100,
      \ 'min_pattern_length': 1,
      \ })

let g:deoplete_activate_ft = [
      \ 'zsh',
      \ 'fish',
      \ 'tmux',
      \ 'gitcommit',
      \ 'neosnippet',
      \ 'snippets'
      \ ]

function! s:deoplete_auto_toggle(ft)

  let l:ft_list = string(g:deoplete_activate_ft)
  if a:ft =~# l:ft_list
    call deoplete#enable()
  endif
  if a:ft =~# l:ft_list
    call deoplete#disable()
  endif
endfunction

augroup DeopelteAutoToggle
  au!
  au InsertEnter * ++nested ++once call deoplete#initialize()
  au BufEnter * call <SID>deoplete_auto_toggle(&ft)
augroup END
