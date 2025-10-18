# Source my custom bashrc from repo
REPO_PATH="$HOME/local-config/bashrc/"

if [[ -d "$REPO_PATH" ]]; then
  # Attempt to pull latest changes
  # echo "Updating repo at $REPO_PATH..."
  (cd "$REPO_PATH" && git pull --quiet 2>/dev/null)

  # Source the bashrc if it exists
  BASHRC_PATH="$REPO_PATH/base.sh"
  if [[ -f "$BASHRC_PATH" ]]; then
    source "$BASHRC_PATH"
    # echo "Sourced base from $BASHRC_PATH"
  else
    echo "Could not source base"
  fi

  ALIAS_PATH="$REPO_PATH/alias.sh"
  if [[ -f "$ALIAS_PATH" ]]; then
    source "$ALIAS_PATH"
    # echo "Sourced alias from $ALIAS_PATH"
  else
    echo "Could not source alias"
  fi

else
  echo "Repository not found at $REPO_PATH"
fi

# Start ssh-agent on Windows Laptop
if [[ "$(hostname)" == "DESKTOP-MMKQQS8" ]]; then
  # Start SSH agent if not running
  if [ -z "$SSH_AUTH_SOCK" ] || ! ssh-add -l &>/dev/null; then
    eval "$(ssh-agent -s)" >/dev/null
    ssh-add /c/users/jay/.ssh/github 2>/dev/null
  fi
fi
