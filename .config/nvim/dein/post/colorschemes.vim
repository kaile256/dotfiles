" From: appearance.toml
" Repo: flazz/vim-colorschemes
" Another: source/colorschemes.vim

augroup myColorschemesPost
  if exists('myColorschemesPost') | au! myColorschemesPost
  endif
  au VimEnter * ++nested colorscheme neodark
  " overrides original colorschemes
  au ColorScheme * ++nested exe 'runtime colorschemes/'. g:colors_name .'.vim'
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

