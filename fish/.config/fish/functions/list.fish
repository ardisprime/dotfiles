
#arguments: t/type (all; file; directory), l/long, a/all, tree
function list

  #parse arguments
  argparse t/type= l/long a/all tree -- $argv

  echo $_flag_type
  echo $_flag_long
  echo $_flag_all
  if count $_flag_tree > 0
    echo "true"
  else
    echo "false"
  end

end

