
# alias vim="nvim"

glazewm_dest="$HOME/"
glazewm_src="$REPO_CONFIG_PATH/.glzr"

[[ "$BASHRC_VERBOSE" ]] && echo "Copying $glazewm_src to $glazewm_dest"
if [[ -d "$glazewm_src" ]]; then
  cp -r "$glazewm_src" "$glazewm_dest"
fi
