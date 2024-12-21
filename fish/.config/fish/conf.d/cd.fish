
# functions
function c
  # create folder(s) if needed
  if ! test -d $argv
    echo "creating folder ..."
    mkdir $argv
  end
  # move to folder
  cd $argv;
  # list
  list 
end

#function c-back 
#  # if not putting in arguments move back 1
#  if [ $(string collect -a $argv) = "" ] 
#    set -l move_back_counter 1
#    # get the number 
#  else 
#    set -l move_back_counter 1
#    while [ $move_back_counter < $argv ]
#    end
#    echo move_back_counter
#  end
#  # build the path with the amount of times the user wants to move back
#  # move back
#end

# abbreviations
abbr --add cd "c"
abbr --add ch "c ~"
abbr --add cr "c /"
abbr --add cb "c .."

