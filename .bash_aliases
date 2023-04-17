#ls
alias ls='ls --color'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -l'

#EXA - LS
alias lls='exa -l -@'
alias ld='exa -D'
alias la='exa -a'
alias llo='exa -l --octal-permissions'
alias lla='exa -la'

#grep
alias grep='grep --color -n'
alias rgrep='grep -r'

#TAR
alias untar='tar xzvf'
alias compress='tar czvf'

#DIG   -> You can create a .digrc file with "+nocmd +noall +answer" in
alias dig='dig +nocmd +noall +answer'

#IP
alias publicIP='curl ifconfig.io'

#VIM
alias v='vim'
alias V='vim'

#PYTHON
alias setenv='python3 -m venv'
alias setenv2='python -m venv'

#PODMAN
alias pod='podman'
alias docker='podman'
alias docker-compose='podman-compose'

#7Z
alias 7pass='echo "7z a dir.7z file -p"'

#IP
alias ipaddress="ip addr | grep -o 'inet [0-9]\+.[0-9]\+.[0-9]\+.[0-9]\+' | cut -d' ' -f2"

#SIZE
alias realsize='du -sh * 2>/dev/null|sort -h'

#SUDO
alias ⁼='sudo -i'
alias ⁺='sudo su'
alias ⁽⁼⁾='echo $SHELL'
alias œ="sudo -i"

#TMUX
alias tnew='tmux new'
alias tn='tmux new'
alias ta='tmux a'

#GIT
alias github='\git config --global user.name "GithubUser" ; \git config --global user.email "###@###" ; \git'
alias gitlab='\git config --global user.name "GitlabUser" ; \git config --global user.email "###@###" ; \git'
alias git='gitcheck'
alias pullup='find . -maxdepth 1 -type d | while read -r dir; do if [[ -d "$dir/.git" ]]; then echo -e "\nGit dir: ${dir##*/}"; \git -C "$dir" pull; fi; done'
alias pullupall='for hubdir in $(find ~/GitHub -maxdepth 1 -type d); do echo -e "\nGit\033[1;96Hub\033[0m dir: ${hubdir##*/}"; \git -C $hubdir pull; done; for labdir in $(find ~/GitLab -maxdepth 1 -type d); do echo -e "\nGit\033[1;33mLab\033[0m dir: ${labdir##*/}"; \git -C $labdir pull; done'
alias gstat='git status'
alias gstatus='git status'
alias gdiff='git --no-pager diff'
alias gpull='git pull'
alias gadd='git add'
alias gcommit='git commit'
alias gpush='git push'
alias gpushu='git push upstream'

#KUBERNETES
alias kubectl='microk8s.kubectl'

#MAN
alias man='man++'

#REALCOUNT
realcount() { < $1 grep -vE "(^#|^$|^\/)" |wc -l }

#RANDOM
alias random_token='tr -dc "a-zA-Z0-9" < /dev/urandom|fold -w 32|head -n1'
alias rtoken='tr -dc "a-zA-Z0-9" < /dev/urandom|fold -w 32|head -n1'
alias token='tr -dc "a-zA-Z0-9" < /dev/urandom|fold -w 32|head -n1'

#DIR
alias cdp='cd ${_%/*}'

# Rust
alias runrs="$(pwd)/target/debug/proj"
alias rr="$(pwd)/target/debug/proj"

# Sec
alias rustscan='podman run -ti --rm rustscan/rustscan:latest -b 10 -a'

# MAC OS
alias apt="brew"

# CLOUD
alias aws="podman run --rm -ti amazon/aws-cli"
alias az="podman run --rm -ti mcr.microsoft.com/azure-cli az"
alias scw="podman run --rm -ti scaleway/cli"
