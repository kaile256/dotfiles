"""" tool.toml
"""" filetype.toml

augroup OrgTableMode
  au!
  if &modifiable
    au InsertLeave *.org,*.txt silent TableModeRealign
    "" Relatively Heavy for CPU
    "au WinEnter *.org,*.txt silent TableModeEnable
    "au WinLeave *.org,*.txt silent TableModeDisable
  endif
augroup END
