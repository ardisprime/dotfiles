
# _{set0
set color_dark 01121B
# _}end
# _{set3
set color_light 55963C
# _}end
# _{set4
set color_super_light AE9464
# _}end

# set default fzf options
set -gx FZF_DEFAULT_OPTS "--color='fg:#$color_light,hl:#$color_light,fg+:#$color_super_light,bg+:#$color_dark,hl+:#$color_super_light,border:#$color_light,prompt:#$color_light' --marker='' --pointer='' --no-info --no-separator --no-scrollbar --border=rounded --tabstop=2 --height=75% --layout=reverse --margin=1,1"

