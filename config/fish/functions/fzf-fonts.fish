function fzf-fonts -d "echo font's path through fzf"
    # fc-list : family style | fzf
    fc-list -f "%{family}:%{style}\n" | fzf
end
