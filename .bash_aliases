# in ~/.bashrc, include this file using

# if [ -f ~/.bash_aliases ]; then
#     source ~/.bash_aliases
# fi

alias glog=$'git log --oneline --graph --decorate --pretty="%C(auto)%h %Cblue%ad %Creset%s%C(auto)%d %Cblue(%an)" --date=format-local:\'%Y-%m-%d %H:%M\' HEAD origin/main $(gt) $(gb | head -n 5 | grep -v \'*\')'
alias glogger=$'git log --oneline --graph --decorate --pretty="%C(auto)%h %Cblue%ad %Creset%s%C(auto)%d %Cblue(%an)" --date=format-local:\'%Y-%m-%d %H:%M\''
alias gt='git status -sb | head -n 1 | sed "s/.*\.\.\.\([^ ]*\).*/\1/" | grep -v "##"'
alias gb='git branch --sort=-committerdate --column'
alias gm='gs --short | awk '"'"'match($1, "M"){print $2}'"'"'' # https://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings
alias gbm='gs --short | awk '"'"'match($1, "UU"){print $2}'"'"''
alias gd='gs --short | grep "^ " | awk '"'"'match($1, "D"){print $2}'"'"''
alias gdu='git diff' # unstaged
alias gam='git add $(gm)'
alias gad='git add $(gd)'
alias gabm='git add $(gbm)'
alias gsm='git stash push $(gm)'
alias gs='git status'
alias gdm='git diff $(gm)'
alias gdbm='git diff $(gbm)'
alias gdd='git diff $(gbd)'
alias gds='git diff --staged'
alias gl='git log'
alias gcan='git commit --amend --no-edit'
alias gsl='git stash list'
alias gtd='git diff $(gt)..'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias grs='git restore --staged .'
alias gs-='git switch -'
alias gf='git fetch'

gd-() {
    git diff "HEAD~$1.." "${@:2}"
}
gd.() {
    git diff "HEAD~$1..HEAD~$2" "${@:3}"
}

alias git-rebase-diff='diff <(git diff origin/main...) <(git diff origin/main...$(gt))'
alias mv-untracked-to-local='git ls-files --others --exclude-standard | while read -r file; do mkdir -p "local/$(dirname "$file")"; mv -i "$file" "local/$file" < /dev/tty; done'
