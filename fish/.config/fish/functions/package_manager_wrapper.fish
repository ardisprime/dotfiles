
function package_manager_wrapper

  # parse the arguments
  argparse -x i,u,r,s i/install u/update r/remove s/search -- $argv

  # set the corresponding cpmmand to run
  if set -q _flag_install 
    set -g command_to_run pm_install_os

  else if set -q _flag_update
    set -g command_to_run pm_update_os

  else if set -q _flag_remove
    set -g command_to_run pm_remove_os

  else if set -q _flag_search
    set -g command_to_run pm_search_os

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

