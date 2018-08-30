export VM_DEVELOP=true
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(chef shell-init bash)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true
source ~/.git-prompt.sh

print_before_the_prompt () {
    printf "\n%s: %s\n" "$USER" "$PWD"
}

# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COMMAND="print_before_the_prompt history -a"

# python set up
alias 2='python2'
alias 3='python3'
alias env3='python3 -m venv env'
alias senv='source env/bin/activate'

# git alias fun
alias gcb='git checkout -b'
alias gs='git status'
alias gl='git log'
alias gc='git checkout'
alias gbd='git branch -d'
alias gd='git diff'
alias gco='git commit'
alias ga='git add -A'
alias gb='git branch'

# frontend restarts
# build runs statis js files copies status into the nucleus public dir
# bin clean cleans node modules and cahced stuff
alias clean-build='cd ~ && j domino && bin/clean_frontend_assets.sh && bin/build_frontend_assets.sh && echo "***********  Restart Nucleus ***********"'
alias clean-only='cd ~ && j domino && bin/clean_frontend_assets.sh && echo "***********  Restart Nucleus ***********"'
alias install-run='cd ~ && j frontend && npm install && npm run install-app && npm run run-frontend-server-dev'
alias run-frontend='cd ~ && j frontend && npm run run-frontend-server-dev'

# storybook
alias story='cd ~ && j frontend && cd apps && cd web && npm run storybook'
PATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PATH}"
export PATH


export PATH=${PATH}:/usr/local/mysql/bin
export PS1="\[\033[0;36m\]\W |\$(parse_git_branch)\n ❄️  :> $(parse_git_branch)\[\e[0m\]"

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
