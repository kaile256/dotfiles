if !dein#tap('vim-doppelganger') | finish | endif

let b:doppelganger_search_pairs_reverse = [
      \ ['^\s*typedef ', '}\s*\h\k*\s*;'],
      \ ]
