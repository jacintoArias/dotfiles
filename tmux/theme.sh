

theme_grey="#373b41"

#"tm_icon=""
tm_icon=""
#tm_icon=""

#tm_separator_right=""
tm_separator_right=""

set -g status-left-length 40
set -g status-right-length 150
set -g status-interval 60

# Highlight active window.
set -w -g window-status-current-bg red
set -g pane-active-border-fg 8

# Status bar.
set -g status-style 'bg=#373b41,fg=white,bold,italics'

tm_separator="#[fg=white,bold] | "

tm_host="#[fg=yellow,bold]${USER}@#h"
tm_date="#[fg=magenta,bold]%d %b %R"
tm_session_name="#[fg=yellow,noitalics]$tm_icon #S #[fg=yellow]$tm_separator_right"

tm_battery="#(~/.dotfiles/bin/battery_indicator.sh)"

set -g status-left ' '$tm_session_name' ' 
set -g status-right $tm_host''$tm_separator''$tm_date''$tm_separator''$tm_battery' '
