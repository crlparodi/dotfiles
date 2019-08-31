#-----------------------------------------------------------------
#                        KEY BINDINGS
#-----------------------------------------------------------------

bindkey "^u" backward-kill-line

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line 

#-----------------------------------------------------------------
#                           ALIASES
#-----------------------------------------------------------------

alias python=python3
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls --color=auto -lahF'

# Viewing disk usage rapidly
alias df='df -h'

# Access Sticky Notes file
alias tilt='nvim ~/Documents/volatile.txt'

# Launch night mode
alias redshift='xbacklight -set 1 && redshift -P -O 3000'

# Launch neovim
alias vim='nvim'

# Alternative git status
alias status='git status --short'

#-----------------------------------------------------------------
#                      POWERLEVEL TWEAK
#-----------------------------------------------------------------

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''

POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
POWERLEVEL9K_DIR_ETC_FOREGROUND="black"
POWERLEVEL9K_DIR_ETC_BACKGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='red'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='magenta'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'

POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109  %m"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv status dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_STATUS_VERBOSE=false

#-----------------------------------------------------------------
#                           ZPLUG
#-----------------------------------------------------------------

source ~/.zplug/init.zsh

# Powerlevel Theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Oh-My-Zsh Git plugin
zplug "plugins/git", from:oh-my-zsh

# Completion & Syntax Highlighting
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Check if packages are installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
