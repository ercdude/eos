export GTK_THEME=Adwaita:dark

# edit files in place (used by e.g. `git commit`).
export VISUAL=emacsclient
export EDITOR="$VISUAL"

# better audio control
pulseaudio -D

# windows transparency
compton -b

exec emacs --debug-init
