
function package_manager_wrapper

  # parse the arguments
  argparse -x i,u,r i/install u/update r/remove -- $argv

  # set the corresponding cpmmand to run
  if set -q _flag_install 
    set -g command_to_run install_os

  else if set -q _flag_update
    set -g command_to_run update_os

  else if set -q _flag_remove
    set -g command_to_run remove_os

  else
    echo "no flag given!"
    return

  end

  # if command to run not sourced yet
  if test -z $(type -t $command_to_run 2> /dev/null) 
    echo sourcing
    source $HOME/.config/fish/functions/*os*
  end

  # execute command to run
  $command_to_run $argv

end

