
# autostart niri if in tty
if test $TERM = linux
  set -gx GTK_IM_MODULE fcitx
  set -gx QT_IM_MODULE fcitx
  set -gx XMODIFIERS @im=fcitx
  startGraphics
end

# set fish greeting
set fish_greeting "
   <>< welcome! <><
"

