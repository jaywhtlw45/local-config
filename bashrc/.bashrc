# .bashrc
repo_path="$HOME/local-config"

bashrc_src="$repo_path/bashrc/.bashrc"
bashrc_dest="$HOME/.bashrc"

# Files that need to be sourced
base_path="$repo_path/bashrc/base.sh"
alias_path="$repo_path/bashrc/alias.sh"
source_files=("$base_path" "$alias_path")

# Additional Config
glazewm_source="$repo_path/.glzr"
glazewm_dest="$HOME/"

# Print Statements. Set to "true" to print
verbose="true"

if [[ -d "$repo_path" ]]; then
  echo "Updating repo at $repo_path..."
  git -C "$repo_path" pull

  # TODO If bashrc is new copy it over. There could be an infinite loop here??
  # Consider environment var count to prevent infinite loop
  [[ "$verbose" == "true" ]] && echo "Copying bashrc from $bashrc_src to $bashrc_dest"
  cp "$bashrc_src" "$bashrc_dest"

  # Source Files
  for file in "${source_files[@]}"; do
    if [[ -f $file ]]; then
      [[ "$verbose" == "true" ]] && echo "Sourcing $file"
      source $file
    else
      echo "Could not source $file"
    fi
  done

else
  echo "Repository not found at $repo_path"
fi

# Start ssh-agent on Windows Laptop
if [[ "$(hostname)" == "DESKTOP-MMKQQS8" ]]; then
  # Start SSH agent if not running
  echo "Starting ssh-agent"
  if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l &>/dev/null; then
    eval "$(ssh-agent -s)" >/dev/null
    ssh-add /c/users/jay/.ssh/github 2>/dev/null
  fi

  if [[ -d "$glazewm_source" ]]; then
    cp -r "$glazewm_source" "$glazewm_dest"
  fi
fi
