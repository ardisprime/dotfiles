
function goto

  argparse a/all -- $argv 

  # set extra find flags
  if set -q _flag_a
    set -f extra_find_flags "-H"
  end

  set -f possible_directories (fd -I -td)
  # get start path to move back in case of abort
  set -f start_path (pwd)

  # move to the wanted start location
  cd $(string join "/" "." $argv)

  # get the directories from the new path and pipe into fzf
  set -f path_change (fd -I -td $extra_find_flags | fzf)

  # if nothing selected, go back to the path at start
  if [ $(string collect -a $path_change) = "" ]
    cd $start_path
    # go to selected path
  else
    cd $(string join "/" "." $path_change)
  end

end

