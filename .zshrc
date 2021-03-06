# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
export PATH=~/.nodenv/shims:$PATH
export PATH=/usr/local/git/bin:~/bin:~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=/usr/bin/python:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export TERM="xterm-256color"

# projects path
export PROJECTS_ROOT_PATH="$HOME/workspace"

# # Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export WORKON_HOME=~/Envs

ZSH_THEME=powerlevel10k/powerlevel10k

fpath=(/usr/local/share/zsh-completions $fpath)

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#bundled commands
#BUNDLED_COMMANDS=(rubocop)

plugins=(git osx history emoji bundler brew rbenv)

#powerline configuration
#POWERLINE_PATH="short"
#POWERLINE_HIDE_USER_NAME="true"
#POWERLINE_RIGHT_A_COLOR_FRONT="black"
#POWERLINE_RIGHT_A_COLOR_BACK="red"
#POWERLINE_HIDE_HOST_NAME="true"
#POWERLINE_SHOW_GIT_ON_RIGHT="true"

#powerlevel9
#POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('todo'  'dir' 'vcs' 'status')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('rbenv' 'rvm' 'rspec_stats')

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='code'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#if [[ -r /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#	    source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

#eval "$(pyenv virtualenv-init -)"

export PATH="/usr/local/opt/openssl/bin:$PATH"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
