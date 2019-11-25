" From: insert.toml
" Repo: kamykn/spelunker.vim
" Help: No Doc; only README.md

let g:enable_spelunker_vim = 0
"let g:enable_spelunker_vim_on_readonly = 1

"let g:spelunker_target_min_char_len = 4 " default: 4

"let g:spelunker_max_suggest_words = 15 " default: 15
"let g:spelunker_max_hi_words_each_buf = 100 " default: 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

let g:spelunker_disable_auto_group = 1 " default: 0

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  au!
  " Setting for g:spelunker_check_type = 1:
  au BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  au CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words.
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad' " default: 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words.
" default: 'SpelunkerComplexOrCompoundWord'
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
"hi SpelunkerSpellBad cterm=underline gui=underline ctermfg=247 guifg=#9e9e9e
hi link SpelunkerSpellBad ErrorMsg
hi SpelunkerComplexOrCompoundWord cterm=underline gui=underline ctermfg=247 guifg=#9e9e9e
