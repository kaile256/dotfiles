function fzf-fonts -d "echo font's path through fzf"
    #fc-list | fzf | xargs | cut -d':' -f1 | sed -e 's/^\|$/"/g'
    fc-list | fzf | xargs | cut -d':' -f1 | sed -e 's/ /\\\ /g'
end
