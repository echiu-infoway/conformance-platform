#!/bin/bash
set -e

#####################################
# CONFIGURATION - everything should be set.
#####################################
GIT_BASE_REPO_URL="https://github.com/AccessDigitalHealth/"
GIT_BRANCH="master"

# Projects: name|repo
PROJECTS=(
  "Conformance Suite Portal UI|conformance-platform-ui"
  "Conformance Suite Portal Core|conformance-platform-core"
  "Conformance Suite Test: PS-CA|conformance-psca-suite"
  "Conformance Suite Test: eReC|conformance-erec-suite"
  "Conformance Suite Portal API|conformance-platform-api"  
  "Conformance FHIR Validator|conformance-fhir-validator"
)

#####################################
# FUNCTIONS
#####################################

clone() {
  local name="$1"
  local repo="$2"

  if [ -d "$repo" ]; then
    cd "$repo"
    git fetch
	# origin - so we always get the latest from the repo
    git reset --hard "origin/$GIT_BRANCH"
    #git clean -fdx
    cd ..
  else
	  git clone --depth 1 -b "$GIT_BRANCH" "$GIT_BASE_REPO_URL/$repo.git" || { echo "Clone failed"; exit 1; }
  fi

#  echo "Cleaning $repo folder..."
#  rm -rf ./* ./.??* 2>/dev/null || true

#  echo "Cloning $repo..."
#  git clone --depth 1 -b "$GIT_BRANCH" "$GIT_BASE_REPO_URL/$repo.git" . || { echo "Clone failed"; exit 1; }

  echo "$name cloned or reset successfully!"
}

show_menu() {
  echo "Please select project to deploy:"
  echo "--------------"
  for i in "${!PROJECTS[@]}"; do
    name=$(echo "${PROJECTS[$i]}" | cut -d'|' -f1)
    echo "$((i+1))) $name"
  done
  echo "--------------"
  echo "A) Clone or Reset All"
  echo "Q) Quit"
}

#####################################
# MAIN SCRIPT
#####################################
cd "$(dirname "$0")"

while true; do
  set +x   # stop printing commands
  show_menu
  read -p "Enter choice: " choice
  set -x   # start printing commands
  case "$choice" in
    [1-7])
      idx=$((choice-1))
      IFS='|' read -r name repo <<< "${PROJECTS[$idx]}"
      clone "$name" "$repo"
      ;;
    [Aa])
      for i in "${!PROJECTS[@]}"; do
        IFS='|' read -r name repo <<< "${PROJECTS[$i]}"
        clone "$name" "$repo"
      done
      ;;
    [Qq])
      echo "Exiting."
      exit 0
      ;;
    *)
      echo "Invalid option."
      ;;
  esac
done
