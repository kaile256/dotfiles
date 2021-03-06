if exists('+guifont')
  let &guifont     = 'SFMono Nerd Font Mono:h9.3'
  let &guifontwide = 'Noto Sans Mono CJK JP:h10.0'
endif

" Configure in goneovim/setting.toml for goneovim
if exists('g:goneovim') | finish | endif

if exists('g:fvim_loaded')
  " Neovim-qt-git will set `g:GuiLoaded = 1` with any gui.  To detect gui
  " currently running on, use GuiName() which neovim-qt-git has added.  It's
  " meaningless to `let g:GuiLoaded = 1` in ginit.vim, which's loaded *after*
  " the neovim-qt's config file is loaded.

  " set guifontwide=Noto\ Sans\ Mono\ CJK\ JP:h13.0
  set guifont=SFMono\ Nerd\ Font\ Mono:h12.3

  nnoremap <silent> <C-PageUp>   :<C-u>set guifont+=<CR>
  nnoremap <silent> <C-PageDown> :<C-u>set guifont-=<CR>

  FVimFontNormalWeight 450
  FVimFontBoldWeight 800
  " Font tweaks
  FVimFontAntialias v:true
  FVimFontAutohint  v:true
  FVimFontLigature  v:true
  FVimFontSubpixel  v:true
  FVimFontHintLevel 'full'

  " FVimCursorSmoothMove v:true
  " FVimCursorSmoothBlink v:true

  FVimUIPopupMenu 1

  if isWin
    " Title bar tweaks
    FVimCustomTitleBar v:true " themed with colorscheme

    FVimFontAutoSnap v:true " Snap fonts to pixels, reduce blur in some situations (e.g. 100% DPI).
    FVimFontLineHeight '+1.0' " can be 'default', '14.0', '-1.0' etc.
    FVimFontNoBuiltInSymbols v:true " Disable built-in Nerd font symbols

    " Background composition
    FVimBackgroundComposition 'blur' " 'none', 'blur' or 'acrylic'
    FVimBackgroundOpacity     0.85   " 0 ~ 1, default bg opacity.
    FVimBackgroundAltOpacity  0.85   " 0 ~ 1, non-default bg opacity.

    FVimBackgroundImageVAlign  'center' " vertial position, 'top', 'center' or 'bottom'
    FVimBackgroundImageHAlign  'center' " horizontal position, 'left', 'center' or 'right'
    FVimBackgroundImageStretch 'fill'   " 'none', 'fill', 'uniform', 'uniformfill'
    FVimBackgroundImageOpacity 0.85     " value between 0 and 1, bg image opacity

    FVimBackgroundImage 'C:/foobar.png'
  endif

elseif exists('g:GuiLoaded') " if nvim-qt
  " Repo: equalsraf/neovim-qt
  " /usr/share/nvim/runtime/plugin/nvim_gui_shim.vim
  " /usr/share/nvim-qt/runtime/plugin/nvim_gui_shim.vim
  GuiTabline   0
  GuiPopupmenu 0

  if exists(':GuiWindowOpacity')
    GuiWindowOpacity .98
  endif

elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'JetBrainsMonoMedium Nerd Font 12')
endif
