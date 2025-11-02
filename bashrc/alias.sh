alias ll="ls -la"
alias ls="ls -l"
alias cl="clear"

# Docker
dex() {
  docker exec -it "$@"
}
dcup() {
  docker compose up "$@"
}

dcd() {
  docker compose down "$@"
}

dps() {
  docker ps "$@"
}

# WSL
wsll() {
  wsl --list "$@"
}

wslsd() {
  wsl --set-default "$@"
}

# Git
ga() {
  git add "$@"
}

gc() {
  git commit -m "$*"
}

gph() {
  git push "$@"
}

gpl() {
  git pull "$@"
}

gs() {
  git status "$@"
}

