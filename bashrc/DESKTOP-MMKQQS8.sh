alias vim="nvim"

# Start SSH agent if not running
[[ "$BASHRC_VERBOSE" ]] && echo "Starting ssh-agent"
if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l &>/dev/null; then
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add /c/users/jay/.ssh/github 2>/dev/null
fi

glazewm_src="$REPO_CONFIG_PATH/.glzr"
glazewm_dest="$HOME/"

[[ "$BASHRC_VERBOSE" ]] && echo "Copying $glazewm_src to $glazewm_dest"
if [[ -d "$glazewm_src" ]]; then
  cp -r "$glazewm_src" "$glazewm_dest"
fi
