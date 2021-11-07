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
alias ll='ls -lht --color=auto'
alias la='ls --color=auto -lahFt'

# Replacement for ls
alias lse='exa -ahl -G --sort=size --group-directories-first'

# Viewing disk usage rapidly
alias df='df -h'

# Launch night mode
alias redshift='xbacklight -set 1 && redshift -P -O 3000'

# Alternative git status
alias status='git status'
alias gs='git status --short'

# Wacom tablet configuration
settab() {
    DEVICE=$(xsetwacom list | grep STYLUS | grep -E -o "id: [0-9]*" | cut -d' ' -f2)
    if [[ ! -z ${DEVICE} ]]; then
        xsetwacom set ${DEVICE} MapToOutput DP-1
    fi
}

# Zypper aliases in OpenSUSE Configuration
alias zypu='sudo zypper update'

# Zypper functions for OpenSUSE Configuration
zyprm() {
    sudo zypper rm --clean-deps "$1"
}
zyp() {
    sudo zypper install --details "$1"
}

#-----------------------------------------------------------------
#                  POWERLEVEL9K OLD TWEAK
#-----------------------------------------------------------------

# POWERLEVEL9K_MODE='nerdfont-complete'

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''

# POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
# POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
# POWERLEVEL9K_DIR_ETC_FOREGROUND="black"
# POWERLEVEL9K_DIR_ETC_BACKGROUND="white"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='red'

# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='magenta'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'

# POWERLEVEL9K_CONTEXT_TEMPLATE="\uF109  %m"

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv status dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# POWERLEVEL9K_STATUS_VERBOSE=false

#-----------------------------------------------------------------
#                  POWERLEVEL10K CONFIGURATION
#-----------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#-----------------------------------------------------------------
#                           ZPLUG
#-----------------------------------------------------------------

# Check install of Zplug
ZPLUG_DIR="$HOME/.zplug"

if [[ ! -d "${ZPLUG_DIR}" ]]; then
    echo "Zplug, is not installed, proceeding to install..."
    git clone -q https://github.com/zplug/zplug $ZPLUG_DIR
    source ~/.zplug/init.zsh && zplug update
fi

# Launch Zplug init
source ~/.zplug/init.zsh

# Powerlevel Theme (9K is OLD - Use 10K instead)
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

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

#-----------------------------------------------------------------
#                           SOURCES
#-----------------------------------------------------------------

#-----------------------------------------------------------------
#                            PATHS
#-----------------------------------------------------------------

PATH=$PATH:/snap/bin

export PATH=~/.local/bin:$PATH
export PATH=/home/cyril27/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
