POWERLEVEL9K_MODE='nerdfont-complete'
# uncomment to profile prompt startup with zprof
# zmodload zsh/zprof

# history
SAVEHIST=100000

# TMUX
# Automatically start tmux
ZSH_TMUX_AUTOSTART=true

# Automatically connect to a previous session if it exists
ZSH_TMUX_AUTOCONNECT=true

# vim bindings
bindkey -v


fpath=( "$HOME/.zfunctions" $fpath )


# load zgen
source "${HOME}/.config/zgen/zgen.zsh"

######################################################################
### install some antigen bundles
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/z
  zgen oh-my-zsh plugins/tmux

  zgen load zsh-users/zsh-syntax-highlighting

  zgen loadall <<EOPLUGINS
      zsh-users/zsh-history-substring-search 
      ./zsh-history-substring-search.zsh
EOPLUGINS

  zgen load tarruda/zsh-autosuggestions

  # colors for all files!
  #zgen load trapd00r/zsh-syntax-highlighting-filetypes

  zgen load mafredri/zsh-async

  # generate the init script from plugins above
  zgen save
fi
# nicoulaj's moar completion files for zsh -- not sure why disabled.
# $b zsh-users/zsh-completions src

###
#################################################################################################



export PURE_GIT_UNTRACKED_DIRTY=0

# Automatically list directory contents on `cd`.
auto-ls () {
	emulate -L zsh;
	# explicit sexy ls'ing as aliases arent honored in here.
	hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )


# Enable autosuggestions automatically
#zle-line-init() {
#    zle autosuggest-start
#}

#zle -N zle-line-init


# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history


zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# uncomment to finish profiling
# zprof



# Load default dotfiles
#source ~/.bash_profile

#eval $(thefuck --alias)

SPACESHIP_VI_MODE_SHOW=false

#load aliases, functions, exports
source ~/.aliases
source ~/.exports
source ~/.functions

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###-tns-completion-start-###
if [ -f /home/ifenna/.tnsrc ]; then 
    source /home/ifenna/.tnsrc 
fi
###-tns-completion-end-###

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# start sway
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    XKB_DEFAULT_LAYOUT=us exec sway
fi

eval "$(starship init zsh)"
