

# reload zsh config
alias reload='RELOAD=1 source ~/.zshrc'

# Renames
# if command -v nvim &> /dev/null; then
#   alias vim=nvim # Use `\vim` or `command vim` to get the real vim.
# fi

alias nvim=vim # Use `\vim` or `command vim` to get the real vim.
# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cd..="cd .."

alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Utils
alias treel="tree -L 1"
alias treell="tree -L 2"
alias treelll="tree -L 3"
alias treellll="tree -L 4"

# Tools shortcut
alias prettyjson='python -m json.tool'
alias eject='diskutil unmountDisk'

# Functions
alias getAWSDNS="$DOTFILES/zsh/functions/getAWSDNS.sh"

# Scripts
alias dropboxsync="python ~/dev/bin/scripts/dropboxsync.py"
alias matlab="/Applications/MATLAB_R2012a.app/bin/scripts/matlab -nojvm -nodisplay -nosplash -nodesktop"
alias matlabjava="/Applications/MATLAB_R2012a.app/bin/scripts/matlab -nodisplay -nosplash -nodesktop"
alias carolinareport="~/dev/bin/scripts/carolinaSyncReport.sh"
alias mgalgo="~/dev/bin/scripts/mountGalgo.sh"
alias mkentucky="~/dev/bin/scripts/mountKentucky.sh"
alias compileWeb="python ~/dev/bin/scripts/compileWeb.py"
alias tunnelBS="~/dev/bin/scripts/tunnelBS.sh"
alias gcc-4.2="gcc"
alias vijupyter=". ~/dev/bin/scripts/vijupyter.sh"
alias vjupyter=". ~/dev/bin/vjupyter/activate.sh"
alias vipython=". ~/dev/bin/scripts/vipython.sh"
alias cleanup-docker="~/dev/bin/scripts/cleanup-docker.sh"



