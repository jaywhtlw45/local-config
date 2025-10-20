# .bashrc

# -----------------------------------------------------
# Environment Vars
export BASHRC_VERBOSE="true" # Enable Print Statements
export REPO_CONFIG_PATH="$HOME/local-config"

# -----------------------------------------------------
# Locate Repository
if [[ -d "$REPO_CONFIG_PATH" ]]; then
  [[ $BASHRC_VERBOSE ]] && echo "Repo path: $REPO_CONFIG_PATH"
else
  echo "❌ Could not locate $REPO_CONFIG_PATH"
  return
fi

# -----------------------------------------------------
# Host Files
hostnames=()
if [[ "$HOSTNAME" == "DESKTOP-MMKQQS8"]] && hostnames+=("DESKTOP-MMKQQS8")


for hostname in "${hostnames[@]}"; do
  host_file="$REPO_CONFIG_PATH/bashrc/$hostname.sh"
  if [[ -f "$host_file" ]]; then
    [[ $BASHRC_VERBOSE == "true" ]] && echo "Sourcing $host_file"
    source "$host_file"
  else
    echo "❌ Could not find $host_file"
  fi
done

# -----------------------------------------------------
git -C $REPO_CONFIG_PATH pull

# -----------------------------------------------------
# Bashrc File
bashrc_src="$REPO_CONFIG_PATH/bashrc/.bashrc"
bashrc_dest="$HOME/.bashrc"

# TODO If bashrc is new copy it over. There could be an infinite loop here??
# Consider environment var count to prevent infinite loop
if [[ -f $bashrc_src ]]; then
  [[ "$BASHRC_VERBOSE" == "true" ]] && echo "Copying bashrc from $bashrc_src to $bashrc_dest"
  cp "$bashrc_src" "$bashrc_dest"
else
  "❌ Could not find $bashrc_src"
fi

# -----------------------------------------------------
# Source Files
source_files=(
  "$REPO_CONFIG_PATH/bashrc/base.sh"
  "$REPO_CONFIG_PATH/bashrc/alias.sh"
)
for source_file in "${source_files[@]}"; do
  if [[ -f $source_file ]]; then
    [[ "$BASHRC_VERBOSE" == "true" ]] && echo "Sourcing $source_file"
    source $source_file
  else
    echo "❌ Could not source $source_file"
  fi
done
