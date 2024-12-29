
function list

  # parse the arguments
  argparse l/long a/all m/mode= t/tree level= -- $argv

  # set the additional flags
  if set -q _flag_long
    set -fa additional_flags -l -h --smart-group -M --git
  end

  if set -q _flag_all
    set -fa additional_flags -a
  end

  if set -q _flag_tree
    set -fa additional_flags -T 
  end

  if set -q _flag_level
    set -fa additional_flags -L $_flag_level
  end

  switch $_flag_mode
    case f file files
      set -fa additional_flags -f
    case d dir directory directories
      set -fa additional_flags -D
  end

  # execute the command with the additional flags
  echo ""
  eza --color=always --icons=always -s=extension -s=name --group-directories-first $additional_flags $argv
  echo ""

end

