" From: denite.toml

" Exceptions; File_REC {{{
call denite#custom#var('file_rec', 'command',
      \ ['fd', '.', '-HI', '--type', 'f',
      \ '-E', '.git',
      \ '-E', 'vendor',
      \ '-E', 'node_modules',
      \ '-E', 'target',
      \
      \ '-E', '*.bak',
      \ '-E', '*.o',
      \ '-E', '*.obj',
      \ '-E', '*.pdb',
      \ '-E', '*.exe',
      \ '-E', '*.bin',
      \ '-E', '*.dll',
      \ '-E', '*.a',
      \ '-E', '*.lib',
      \ '-E', '.gitignore',
      \ '-E', '.*.*',
      \ ])
"}}}
" Exceptions; Grep {{{
" NOTE: pt covers both utf8 and sjis though I use rg.
call denite#custom#var('grep', 'command',
      \ ['rg', '--nogroup', '--nocolor', '--smart-case', '--hidden',
      \ '--ignore', '.git',
      \ '--ignore', 'vendor',
      \ '--ignore', 'node_modules',
      \ '--ignore', 'target',
      \
      \ '--ignore', '*.bak',
      \ '--ignore', '*.o',
      \ '--ignore', '*.obj',
      \ '--ignore', '*.pdb',
      \ '--ignore', '*.exe',
      \ '--ignore', '*.bin',
      \ '--ignore', '*.dll',
      \ '--ignore', '*.a',
      \ '--ignore', '*.lib',
      \ '--ignore', '.gitignore',
      \ '--ignore', '.*.*',
      \ ])
"}}}

" Custom;
" Matcher; Migemo or Fruzzy? {{{
"call denite#custom#source('line', 'matchers', ['matcher/migemo'])
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])
"call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])
call denite#custom#source('file/rec',
      \ 'matchers', ['converter/tail_path', 'matcher/fuzzy'])
"}}}
" Grep {{{
call denite#custom#var('grep', 'default_opts', [])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#source('grep', 'matchers', ['matcher_fuzzy'])
"" Use Interactive Mode
call denite#custom#source('grep', 'args', ['', '', '!'])
"}}}

" TODO: Automate if floating or not.
"for [key, action] in s:denite_mapping
"  if has('&floating')
"    nnoremap <silent> <space>fr :<C-u>Denite file_mru -split="floating"<CR>
"  endif
"endfor

" Grep; replaced w/ ripgrep
if executable('rg')
  call denite#custom#var('file_rec', 'command', [
        \ 'rg',
        \ '--files',
        \ '--glob',
        \ '!.git'
        \ ])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

" Keymap;
nnoremap <silent> <prefix:denite> <a-d>

" Keymap; Gtags
nnoremap <silent> [denite-gtags]d :<C-u>DeniteCursorWord -buffer-name=gtags_def -mode=normal gtags_def<CR>
nnoremap <silent> [denite-gtags]r :<C-u>DeniteCursorWord -buffer-name=gtags_ref -mode=normal gtags_ref<CR>
nnoremap <silent> [denite-gtags]c :<C-u>DeniteCursorWord -buffer-name=gtags_context -mode=normal gtags_context<CR>

nnoremap <silent> <a-d> :<C-u>Denite buffer file_mru<CR>
nnoremap <silent> <a-d><a-v> :<C-u>DeniteBufferDir file<CR>

function! s:denite_keymaps() abort "{{{
  nnoremap <silent><buffer>
        \ <a-/> :<C-u>Denite -buffer-name=search -auto-resizeline<cr>
  nnoremap <silent><buffer>
        \ <a-t> :<C-u>Denite filetype<CR>
  nnoremap <silent><buffer>
        \ <a-p> :<C-u>Denite file_mru<CR>
  nnoremap <silent><buffer>
        \ <a-j> :<C-u>Denite line<CR>
  nnoremap <silent><buffer>
        \ <a-]> :<C-u>DeniteCursorWord grep<CR>
  nnoremap <silent><buffer>
        \ <a-y> :<C-u>Denite neoyank<CR>
  nnoremap <silent><buffer>
        \ <a-r> :<C-u>Denite -resume<CR>
  nnoremap <silent><buffer>
        \ <a-;> :<C-u>Denite -resume -immediately-1 -select=+1<CR>
  nnoremap <silent><buffer>
        \ <a--> :<C-u>Denite -resume -immediately-1 -select=-1<CR>

  nnoremap <silent><buffer>
        \ <a-o> :<c-u>DenitePrev<cr>
  nnoremap <silent><buffer>
        \ <a-i> :<c-u>DeniteNext<cr>
  command! DenitePrev :Denite -resume -cursor-pos=-1 -immediately
  command! DeniteNext :Denite -resume -cursor-pos=+1 -immediately
  command! DeniteDo   :Denite -resume -do='normal! A;'
endfunction "}}}

" noremap <silent><buffer> <space>d
"   \ <a-:<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/dotfiles']}])<CR>
" noremap <silent><buffer> <space>l
"   \ <a-:<C-u>call denite#start([{'name': 'file_rec', 'args': [g;memolist_path]})<CR>

augroup DeniteConfig
  au!
  au FileType denite call s:on_denite_keymaps()
  au FileType denite-filter call s:on_denite_filter_keymaps()
augroup END

function! s:on_denite_filter_keymaps() abort "{{{
  inoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
endfunction "}}}
function! s:on_denite_keymaps() abort "{{{
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction "}}}
