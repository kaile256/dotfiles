syn match pythonMinimalQualifier '[?*+]?'
      \ containedin=pythonString,pythonRawString

hi! link pythonMinimalQualifier Special
