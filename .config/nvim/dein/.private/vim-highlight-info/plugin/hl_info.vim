" Started From: https://qiita.com/sff1019/items/3f73856b78d7fa2731c7#%E3%82%B7%E3%83%B3%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E5%90%8D%E3%82%92%E7%9F%A5%E3%82%8C%E3%82%8B%E9%96%A2%E6%95%B0

command! -bar HlInfo call s:echo_syn_info()

let s:order = [
      \ 'name',
      \ 'ctermfg',
      \ 'ctermbg',
      \ 'guifg',
      \ 'guibg',
      \ ]

function! s:echo_syn_info() abort
  let baseSyn   = s:syn_attr(s:syn_id(0))
  let linkedSyn = s:syn_attr(s:syn_id(1))

  echo s:format(baseSyn)
  echo 'which links to'
  echo s:format(linkedSyn)
endfunction

function! s:syn_attr(synid) abort
  return {
        \ 'name':    synIDattr(a:synid, 'name'),
        \ 'ctermfg': synIDattr(a:synid, 'fg', 'cterm'),
        \ 'ctermbg': synIDattr(a:synid, 'bg', 'cterm'),
        \ 'guifg':   synIDattr(a:synid, 'fg', 'gui'),
        \ 'guibg':   synIDattr(a:synid, 'bg', 'gui'),
        \ }
endfunction

function! s:syn_id(transrate) abort
  let synid = synID(line('.'), col('.'), 1)

  if a:transrate
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction

function! s:format(dict) abort
  let msg = ''
  for key in s:order
    let val = a:dict[key]

    if empty(val)
      if key !=# 'name'
        continue
      endif
      let val = 'undefined'
    endif

    let msg .= ' '. key .': '. val
  endfor

  return msg
endfunction
