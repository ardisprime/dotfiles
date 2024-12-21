
# functions
function find-directories
  set -l start_path (pwd)
  # move to the wanted location
  cd $(string join "/" "." $argv)
  # get the directories from the new path and pipe into fzf
  set -l path_change (fd -I -t d | fzf)
  # if nothing selected, go back to the path at start
  if [ $(string collect -a $path_change) = "" ]
    c $start_path
  # go to selected path
  else
    c $(string join "/" "." $path_change)
  end
end

function find-directories-git
  set -l start_path (pwd)
  # move to the wanted location
  cd $(string join "/" "." $argv)
  # get the directories from the new path and pipe into fzf
  set -l path_change (fd -t d | fzf)
  # if nothing selected, go back to the path at start
  if [ $(string collect -a $path_change) = "" ]
    c $start_path
  # go to selected path
  else
    c $(string join "/" "." $path_change)
  end
end

function find-directories-all
  set -l start_path (pwd)
  # move to the wanted location
  cd $(string join "/" "." $argv)
  # get the directories from the new path and pipe into fzf
  set -l path_change (fd -H -I -t d | fzf)
  # if nothing selected, go back to the path at start
  if [ $(string collect -a $path_change) = "" ]
    c $start_path
  # go to selected path
  else
    c $(string join "/" "." $path_change)
  end
end

function find-directories-backwards
  set -l start_path (pwd)
  set -l path_point_to_change_to $(echo -e $(string replace -a "/" "\n" $(string trim -l -c '/' $(pwd) ) ) | fzf)
  set -l new_path $(string join "" $(string split -f 1 $path_point_to_change_to  $(pwd) ) $path_point_to_change_to)
  # if nothing selected, go back to the path at start
  if [ $(string collect -a $new_path) = "" ]
    c $start_path
  # go to selected path
  else
    c $new_path 
  end
end

# abbreviation for fd command
abbr --add find fd
# abbreviations
abbr --add fd find-directories
abbr --add fda find-directories-all
abbr --add fdg find-directories-git
abbr --add fdb find-directories-backwards





































































































