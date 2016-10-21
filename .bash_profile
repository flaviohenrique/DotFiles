export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

# Colours
export BLUE="\[\033[0;34m\]"
export NO_COLOR="\[\e[0m\]"
export GRAY="\[\033[1;30m\]"
export GREEN="\[\033[0;32m\]"
export LIGHT_GRAY="\[\033[0;37m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export LIGHT_RED="\[\033[1;31m\]"
export RED="\[\033[0;31m\]"
export WHITE="\[\033[1;37m\]"
export YELLOW="\[\033[0;33m\]"
export PATH=/usr/local/git/bin:~/bin:~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH
export EDITOR='mvim'


alias ls="ls -G"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
	source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

eval "$(rbenv init -)"

# retrieve all rake tasks
_rakecomplete() {
  COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
  local words=`rake -T | grep rake | sed 's/rake \([^ ]*\).*/\1/'`
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(compgen -W "$words" -- $cur))
  return 0
}
complete -o default -F _rakecomplete rake


custom_prompt () {
  local BRANCH=`git branch 2> /dev/null | grep \* | sed 's/* //'`

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=`git status 2> /dev/null | grep "On branch" | sed 's/# On branch //'`
  fi

  local STATUS=`git status 2>/dev/null`
  local PROMPT_COLOR=$GREEN
  local STATE=" "
  local NOTHING_TO_COMMIT="# Initial commit"
  local BEHIND="# Your branch is behind"
  local AHEAD="# Your branch is ahead"
  local UNTRACKED="# Untracked files"
  local DIVERGED="have diverged"
  local CHANGED="# Changed but not updated"
  local TO_BE_COMMITED="# Changes to be committed"
  local LOG=`git log -1 2> /dev/null`
  local RUBY_VERSION=`ruby -e "puts RUBY_VERSION"`

  if [ "$STATUS" != "" ]; then
    if [[ "$STATUS" =~ "$NOTHING_TO_COMMIT" ]]; then
      PROMPT_COLOR=$RED
      STATE=""
    elif [[ "$STATUS" =~ "$DIVERGED" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↕${NO_COLOR}"
    elif [[ "$STATUS" =~ "$BEHIND" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↓${NO_COLOR}"
    elif [[ "$STATUS" =~ "$AHEAD" ]]; then
      PROMPT_COLOR=$RED
      STATE="${STATE}${RED}↑${NO_COLOR}"
    elif [[ "$STATUS" =~ "$CHANGED" ]]; then
      PROMPT_COLOR=$RED
      STATE=""
    elif [[ "$STATUS" =~ "$TO_BE_COMMITED" ]]; then
      PROMPT_COLOR=$RED
      STATE=""
    else
      PROMPT_COLOR=$GREEN
      STATE=""
    fi

    if [[ "$STATUS" =~ "$UNTRACKED" ]]; then
      STATE="${STATE}${YELLOW}*${NO_COLOR}"
    fi

    PS1="\n[\u@\h] ${YELLOW}\w\a${NO_COLOR} (${PROMPT_COLOR}${BRANCH}${NO_COLOR}${STATE}) (${YELLOW}${RUBY_VERSION}${NO_COLOR})\n$ "
  else
    PS1="\n[\u@\h] ${YELLOW}\w\a${NO_COLOR} (${YELLOW}${RUBY_VERSION}${NO_COLOR})\n\$ "
  fi
}

PROMPT_COMMAND=custom_prompt

spec(){
  bundle exec rspec $1
}

server(){
  bundle exec rails s
}

