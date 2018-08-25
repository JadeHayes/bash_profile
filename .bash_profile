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

PROMPT_COMMAND="print_before_the_prompt history -a"

# python set up
alias 2='python2'
alias 3='python3'
alias env3='python3 -m venv env'
alias senv='source env/bin/activate'

alias subl='sublime'

PATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PATH}"
export PATH


export PATH=${PATH}:/usr/local/mysql/bin
export PS1='$(__git_ps1 "(%s)") ❄️\[. -->\] \[\e[0m\]'

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh