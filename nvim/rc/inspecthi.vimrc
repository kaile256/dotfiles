" From: appearance.toml

command! ColoLinks :Inspecthi

cnoreabbr <silent><expr> cololnk (getcmdtype() == ':' && getcmdlne() =~ '^cololnk$')? 'Inspecthi' : 'cololnk'
cnoreabbr <silent><expr> cololink (getcmdtype() == ':' && getcmdline() =~ '^cololink$')? 'Inspecthi' : 'cololink'
cnoreabbr <silent><expr> cololinks (getcmdtype() == ':' && getcmdline() =~ '^cololinks$')? 'Inspecthi' : 'cololinks'
