alias ll="ls -la"
alias ls="ls -l"

# Docker
dcup(){
    docker compose up "$@"
}
dcd(){
    docker compose down "$@"
}
dps(){
    docker ps "$@"
}

# WSL
wsll(){
    wsl --list "$@"
}
wslsd(){
    wsl --set-default "$@"
}

# Git
ga(){ 
    git add "$@" 
}
gc(){
    git commit -m "$@"
}
gpush(){
    git push "$@"
}
gpull(){
    git pull "$@"
}
gs(){
    git status "$@"
}

# Docker
dcup(){
    docker compose up "$@"
}
dcd(){
    docker compose down "$@"
}
dps(){
    docker ps "$@"
}
