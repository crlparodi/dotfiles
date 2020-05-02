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
#                           ZPLUG
#-----------------------------------------------------------------

source ~/.zplug/init.zsh

# Powerlevel Theme
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug romkatv/powerlevel10k, as:theme, depth:1

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
#                      POWERLEVEL10K TWEAK
#-----------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
