" Ref: $VIMRUNTIME/pack/dist/opt/matchit/autoload/matchit.vim

function! s:extend_match_words() abort
  const pairs = [
        \ ['\\\@<!%(', '\\\@<!)'],
        \ ['\\%(', '\\\@<!\\)'],
        \ ['\\(', '\\\@<!\\)'],
        \ ]

  const pats = map(deepcopy(pairs), 'join(v:val, ":")')
  const pat_additional = join(pats, ',')

  if matchstr(b:match_words, pat_additional) | return | endif
  let b:match_words .= pat_additional
endfunction
call s:extend_match_words()
