export VM_DEVELOP=true

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
alias env3='pipenv shell'
alias env2='source env/bin/activate'

# docker-compose goodness
alias dcb='docker-compose build'
alias dcd='docker-compose down'
alias d-volumes='docker volume ls'
alias dcup='docker-compose up'
alias docker-kill-all='docker kill $(docker ps -a -q)'
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias dps='docker ps'
alias dstart='docker-compose start'
alias dstop='docker-compose stop'
alias drestart='docker-compose restart'
alias dexec='docker exec -it'
alias drun='docker-compose run'
alias d-logs='docker logs'

# Fleetcommand
alias fc-local='cd ~ && j platform-apps && docker-compose -f resources/fleetcommand/docker-compose.yaml up'

# git alias fun
alias gcb='git checkout -b'
alias gs='git status'
alias gl="git log"
alias gc='git checkout'
alias gbd='git branch -d'
alias gd='git diff'
alias gco='git commit'
alias ga='git add -A'
alias gb='git branch'
alias gb-clean='git branch -D `git branch | grep -E "DOM*"`'

# Kubernetes
alias kc='kubectl get po'
alias kcn='kubectl get po | grep -v Running'
alias mini='cd ~ && j domino && ./sbt-minikube'
alias exe='cd ~ && j domino && ./sbt-executor'
alias fc-apply='kubectl apply -f fleetcommand/services/fleetcommand'
alias kclogs='kubectl logs'
alias fc-stg-deploy='j Repos && helm upgrade fleetcommand charts/domino/fleetcommand -f internal-delta/fleetcommand-staging/helm/fleetcommand.yaml'
alias fc-deploy='j Repos && helm upgrade fleetcommand charts/domino/fleetcommand -f internal-delta/fleetcommand/helm/fleetcommand.yaml && echo check "https://rpm.newrelic.com/accounts/1966044/applications/103158392" for errors'

# Minikube troubleshooting
alias mini-delete='cd ~ && j domino && minikube delete'
alias mini-reinstall='cd ~ && j domino && minikube delete && ./dev/minikube-setup && kc'
alias mini-sudo-delete='cd ~ && j domino && sudo rm -rf ~/.minikube/machines/minikube && ./dev/minikube-setup && kc'
alias mini-deep-clean='cd ~ && j domino && ./bin/deep-clean.sh && ./sbt-minikube'

# frontend restarts
# build runs static js files copies status into the nucleus public dir
# bin clean cleans node modules and cahced stuff
alias clean-build='cd ~ && j domino && build/clean_frontend_assets.sh && build/build_frontend_assets.sh && echo "***********  Restart Nucleus ***********"'
alias clean-only='cd ~ && j domino && build/clean_frontend_assets.sh && echo "***********  Restart Nucleus ***********"'
alias build-only='cd ~ && j domino && build/build_frontend_assets.sh && echo "***********  Restart Nucleus ***********"'
alias deep-clean='cd ~ && j domino && ./dev/deep-clean.sh && echo "***********  Restart Nucleus ***********"'
alias install-run='cd ~ && j frontend && npm install && npm run install-app && npm run run-frontend-server-dev'
alias run-frontend='cd ~ && j frontend && npm run run-frontend-server-dev'
alias from-nucleus='cd ~ && j frontend && npm run generate-api-from-nucleus && echo "***********  install-run ***********"'
alias react-server='cd ~ && j frontend && npm run start-react-components-dev-server && echo "***********  local host 3000 ***********"'

# storybook
alias story-web='cd ~ && j frontend && cd apps && cd web && npm run storybook'
alias story-environments='cd ~ && j frontend && npm run storybook-environments'
alias story-auth='cd ~ && j frontend && npm run storybook-auth-and-admin'
alias story-file='cd ~ && j frontend && npm run storybook-file-browser'
alias story-launchers='cd ~ && j frontend && npm run storybook-launchers'
alias story-model='cd ~ && j frontend && npm run storybook-model-manager'
alias story-shared='cd ~ && j frontend && npm run storybook-shared-components'
alias story-workspace='cd ~ && j frontend && npm run storybook-workspaces'

# What is running?
# show a list of all running processes and various statistics about each process, sorted by memory.
alias why-so-slow='top -o rsize'

#Env variables
PATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PATH}"
export PATH

export PATH=${PATH}:/usr/local/mysql/bin
export PATH=${PATH}:${HOME}/Repos

export PS1="\[\033[0;36m\]\W |\$(parse_git_branch)\n ❄ :> \[\e[0m\]"

# Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
alias ls='ls -lh --color=auto'

# Save all of my bash history
HISTFILESIZE=''
HISTSIZE=''
HISTCONTROL=ignoreboth

# Autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

