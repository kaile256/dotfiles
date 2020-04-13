" TOML: external.toml
" Repo: kkvh/vim-docker-tools

" use :ContainerList defined in add/ instead.
delcommand DockerToolsOpen

" they just go to the window and close it.
delcommand DockerToolsClose
delcommand DockerToolsToggle

" " use the keybinds instead.
" delcommand ContainerStart
" delcommand ContainerStop
" delcommand ContainerRemove
" delcommand ContainerRestart
" delcommand ContainerPause
" delcommand ContainerUnpause
" delcommand ContainerLogs
