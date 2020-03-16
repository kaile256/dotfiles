" From: appearance.toml

" pgmnt#color#hsl({hue}, {saturation}, {lightness})
" pgmnt#color#hsv({hue}, {saturation}, {value})
" pgmnt#color#rgb({red}, {green}, {blue})
"
" pgmnt#color#adjust_color({color}[, {adjustments}])
"  examaple:
"     pgmnt#color#adjust_color('#007f00', {
"     \   'saturation': -0.05,
"     \   'lightness':  +0.05,
"     \ })
"
" pgmnt#color#darken({color}, {amount})
"     pgmnt#color#darken('#007f00', +0.05)
" pgmnt#color#lighten({color}, {amount})
"     pgmnt#color#lighten('#007f00', +0.05)
" pgmnt#color#mix({color1}, {color2}[, {weight}])

"nnoremap <silent><expr> <c-x> (getline('.') =~# "'saturation':\|'lightness':")? '5<c-x>' : '<c-x>'
"nnoremap <silent><expr> <c-a> (getline('.') =~# "'saturation':\|'lightness':")? '5<c-a>' : '<c-a>'
