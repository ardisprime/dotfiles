
# functions
function list
  echo "";
  eza --icons=auto --group-directories-first --sort extension $argv
  echo "" 
end
function list-long
  list --long --header --time-style long-iso --git $argv
end
function list-tree
  list --tree --level=2 $argv
end
function list-long-tree
  list-long --tree --level=2 $argv
end
function list-all
  list --all $argv
end
function list-long-all
  list-long --all $argv
end
# abbreviations
abbr --add l list-tree
abbr --add ls list
abbr --add ll list-long
abbr --add lt list-tree
abbr --add llt list-long-tree
abbr --add la list-all
abbr --add lla list-long-all

