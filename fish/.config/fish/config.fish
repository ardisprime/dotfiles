
# autostart niri if in tty
if test $TERM = linux
  set -gx GTK_IM_MODULE fcitx
  set -gx QT_IM_MODULE fcitx
  set -gx XMODIFIERS @im=fcitx
  set -ga PATH /home/chris/.nimble/bin 
  startGraphics
end

# set fish greeting
set fish_greeting "
   <>< welcome! <><
"

