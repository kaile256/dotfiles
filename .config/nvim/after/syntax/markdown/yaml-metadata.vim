syn match markdownYamlMetadataKey '^[^:]\+' contained
syn match markdownYamlMetadataLhs '^\S\+:' contained contains=markdownYamlMetadataKey
syn match markdownYamlMetadataInline '.*$' contained contains=markdownYamlMetadataLhs
syn region markdownYamlMetadataBlock matchgroup=markdownYamlMetadataSeparator start='\%^---$' end='^---$' contains=markdownYamlMetadataInline

hi! link markdownYamlMetadataKey Type
hi! link markdownYamlMetadataInline String
hi! link markdownYamlMetadataSeparator Comment
