export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(
  git
  gitfast
  macos
  yarn
)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Python & Virtualenv
# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

case "$(uname -s)" in
  Darwin)
    export ANDROID_HOME=${HOME}/Library/Android/sdk
    ;;

  Linux)
    export ANDROID_HOME=/opt/Android/Sdk
    ;;
esac

if [[ -d $ANDROID_HOME/lib ]]; then
  export ANDROID_SDK=$ANDROID_HOME/lib
  export PATH=${PATH}:${ANDROID_HOME}/emulator
  export PATH=${PATH}:${ANDROID_HOME}/tools
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

if (which nvim > /dev/null); then
  alias v='nvim'
  alias vim='nvim'
  export EDITOR=$(which nvim)
fi
alias rm="rm -rf"
alias df='cd ~/.dotfiles'
alias py='python3 '
alias tmux="tmux attach || tmux new"

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --skip-vcs-ignores -p ~/.dotfiles/agignore -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# VOLTA
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

HISTFILE=~/.zsh-history
SAVEHIST=1000

# get current ip
function getip() {
  config=(ip address)
  if (which ifconfig > /dev/null); then
    config=ifconfig
  fi

  $config | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# extracts the given file
function x () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
 }

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
