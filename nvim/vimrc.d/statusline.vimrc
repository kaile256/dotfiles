"" Config Colorscheme

if !has('gui_running')
  set t_Co=256
endif

" """ Config jacqusbh/vim-showmarks
" "augroup show_marks_sync
" "  autocmd!
" "  autocmd BufReadPost * silent! DoShowMarks
" "augroup END
" 
"" Config airline.vim
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='badwolf'

" "" Config itchyny/lightline.vim until EOL
" let g:lightline.colorscheme = 'solarized'
" let g:lightline.active = {
"   \   'left': [
"   \     ['mode','paste'],
"   \     ['fugitive', 'readonly', 'relativepath', 'modified'],
"   \     ['coc.nvim'] ],
" 
"   \   'right': [
"   \     ['lineinfo'],
"   \     ['percent'],
"   \     ['fileformat', 'fileencofing', 'filetype', 'charvalue'] ]
"   \ }
" 
" let g:lightline.component_function = {
"   \   'fugitive': 'LightlineFugitive'
"   \ }
" 
" let g:lightline.component_visible_condition = {
"   \   'fugitive': '(exists("*#head") && ""!=fugitive#head())'
"   \ }
" 
" function! LightlineFugitive()
"   if exists('*fugitive#head')
"     let branch = fugitive#head()
"     return branch !=# '' ? ' . '.branch : ''
"   endif
"   return ''
" endfunction
" 
