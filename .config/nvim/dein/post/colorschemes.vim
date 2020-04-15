" From: appearance.toml
" Repo: flazz/vim-colorschemes
" Another: source/colorschemes.vim

command! -bar -nargs=1 -complete=color Colo
      \ :call s:set_colorscheme(<q-args>)
command! -bar -nargs=1 -complete=color Colorscheme
      \ :call s:set_colorscheme(<q-args>)

function! s:set_colorscheme(name) abort
  exe 'runtime colorschemes/'. a:name .'.vim'
  exe 'colorscheme' a:name
endfunction

augroup myColorschemesPost
  if exists('myColorschemesPost') | au! myColorschemesPost
  endif
  au VimEnter * ++nested Colorscheme neodark
augroup END

"" Set Colorscheme up to os/gui
"try
"  if !executable('xinput')
"    "colorscheme molokai_dark
"    Colorscheme gruvbox

"  elseif exists('g:nyaovim_version')
"    Colorscheme solarized8_light_flat
"    "elseif !exists("g:GuiLoaded")
"    "  " on CUI
"    "  let g:solarized_termcolors=256
"    "  colorscheme solarized8_light_flat
"    "  "colorscheme solarized8_dark_flat

"  else
"    Colorscheme neodark
"    " colorscheme onedark
"    " colorscheme colorsbox-stnight
"    " colorscheme Monokai
"    " colorscheme colorsbox-stnight
"  endif

"catch
"  colorscheme murphy
"endtry

