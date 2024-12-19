
# automatically add a trash folder if it doesnt exist
if ! test -d /trash
  echo "trash folder not found"
  echo "creating ..."
  sudo mkdir /trash
  echo "done!"
end
if ! test -w /trash
  echo "trash folder has no write permissions"
  echo "adding permission ..."
  sudo chmod o+w /trash
  echo "done!"
end

# functions
function trash-add
  mv $argv /trash/
end
function trash-clean
  rm -fr /trash/$argv
end
function trash-clean-all
  rm -fr /trash/*
end
function trash-list
  list-tree /trash/
end
function trash-recover
  mv /trash/$argv .
end
# abbreviations
abbr --add ta "trash-add"
abbr --add tl "trash-list"
abbr --add tr "trash-recover"
abbr --add tc "trash-clean"
abbr --add tca "trash-clean-all"

