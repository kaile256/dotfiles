# name: kaile256
# based on oh-my-fish/theme-gnuykeaj
# erased color setting to use default fish_config_theme, lava.
#
# 1 line minimal, beautiful version of clearance.
# Display the following bits on the left:
# - Virtualenv name (if applicable, see https://github.com/adambrenecki/virtualfish)
# - Current directory name
# - Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  set -l last_status $status

  # default shows only 16colors;
  set fish_term256 1

  # set_color specifys numbers of RGB Color.

  set -l brblack (set_color brblack)
  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l bryellow (set_color bryellow)
  set -l myyellow (set_color fc0)
  set -l red (set_color red)
  set -l brred (set_color brred)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l brgreen (set_color brgreen)
  set -l magenta (set_color magenta)
  set -l brmagenta (set_color brmagenta)
  set -l normal (set_color normal)

  set -l cwd $myyellow(basename (pwd | sed "s:^$HOME:~:"))

  # Display [venvname] if in a virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end

  # Print pwd or full path
  echo -n -s $cwd $normal

  # Show git branch and status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info $brred $git_branch$normal
      #set git_info $brred $git_branch "±" $normal
    else
      set git_info $brgreen $git_branch $normal
    end
    echo -n -s ' | ' $git_info $normal
    #echo -n -s ' · ' $git_info $normal
  end

  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  # Terminate with a nice prompt char
   echo -e -n -s $prompt_color ' ⟩ ' $normal
end
