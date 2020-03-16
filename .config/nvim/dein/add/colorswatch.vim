" From: appearance.toml

" let g:colorswatch_exclusion_pattern = 'LightLine.\+'
command! ColoGui   :ColorSwatchGenerate all css <bar> setl signcolumn= bt=quickfix
command! ColoCterm :ColorSwatchGenerate all csv <bar> setl signcolumn= bt=quickfix
"command! ColoPalette :ColorSwatchGenerate cterm csv <bar> setl ft=qf       bt=quickfix

cnoreabbr <silent><expr> cologui (getcmdtype() == ':' && getcmdline() =~ '^cologui$')? 'ColorSwatchGenerate all css <bar> setl signcolumn= bt=quickfix <cr>' : 'cologui'
cnoreabbr <silent><expr> colocss (getcmdtype() == ':' && getcmdline() =~ '^colocss$')? 'ColorSwatchGenerate all css <bar> setl signcolumn= bt=quickfix <cr>' : 'colocss'
cnoreabbr <silent><expr> colohex (getcmdtype() == ':' && getcmdline() =~ '^colohex$')? 'ColorSwatchGenerate all css <bar> setl signcolumn= bt=quickfix <cr>' : 'colohex'

cnoreabbr <silent><expr> colocterm (getcmdtype() == ':' && getcmdline() =~ '^colocterm$')? 'ColorSwatchGenerate all csv <bar> setl signcolumn= bt=quickfix <cr>' : 'colocterm'
cnoreabbr <silent><expr> colo256   (getcmdtype() == ':' && getcmdline() =~ '^colo256$')?   'ColorSwatchGenerate all csv <bar> setl signcolumn= bt=quickfix <cr>' : 'colo256'
cnoreabbr <silent><expr> colocsv   (getcmdtype() == ':' && getcmdline() =~ '^colocsv$')?   'ColorSwatchGenerate all csv <bar> setl signcolumn= bt=quickfix <cr>' : 'colocsv'

"cnoreabbr <silent><expr> palette (getcmdtype() == ':' && getcmdline() =~ '^palette$')? 'ColorSwatchGenerate cterm csv <bar> setl ft=qf bt=quickfix' : 'palette'
"cnoreabbr <silent><expr> pale    (getcmdtype() == ':' && getcmdline() =~ '^pale$')?    'ColorSwatchGenerate cterm csv <bar> setl ft=qf bt=quickfix' : 'pale'
"cnoreabbr <silent><expr> pal     (getcmdtype() == ':' && getcmdline() =~ '^pal$')?     'ColorSwatchGenerate cterm csv <bar> setl ft=qf bt=quickfix' : 'pal'
