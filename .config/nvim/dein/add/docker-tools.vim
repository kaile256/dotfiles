" TOML: external.toml
" Repo: kkvh/vim-docker-tools
" Another: post/docker-tools.vim


command! ContainerList call docker_tools#dt_open()

command! -nargs=? ContainerSetHost call docker_tools#dt_set_host(<q-args>)

command! -complete=customlist,docker_tools#complete -nargs=+ ContainerStart   call docker_tools#container_action('start',   <f-args>)
command! -complete=customlist,docker_tools#complete -nargs=+ ContainerStop    call docker_tools#container_action('stop',    <f-args>)
command! -complete=customlist,docker_tools#complete -nargs=+ ContainerRestart call docker_tools#container_action('restart', <f-args>)

command! -complete=customlist,docker_tools#complete -nargs=+ ContainerRemove  call docker_tools#container_action('rm',      <f-args>)
command! -complete=customlist,docker_tools#complete -nargs=+ ContainerPause   call docker_tools#container_action('pause',   <f-args>)
command! -complete=customlist,docker_tools#complete -nargs=+ ContainerUnpause call docker_tools#container_action('unpause', <f-args>)
command! -complete=customlist,docker_tools#complete -nargs=+ ContainerLogs    call docker_tools#container_logs(<f-args>)
