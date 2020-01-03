#! /bin/bash

readonly RAW_GITHUB_URL="https://raw.githubusercontent.com/deresmos/actions-sample/master"
readonly WORKFLOWS_PATH=".github/workflows"

function create_direction () {
  if [ ! -e $WORKFLOWS_PATH ]; then
    mkdir -p $WORKFLOWS_PATH \
      && echo "Create $WORKFLOWS_PATH"
  fi
}

function get_file () {
  echo "Get $1"
  curl -s "$RAW_GITHUB_URL/$1" > "$1"
}

function get_common_actions () {
  # Labeler
  get_file ".github/labeler.yml"
  get_file ".github/workflows/labeler.yml"

  # Sync Labels
  get_file ".github/labels.yml"
  get_file ".github/workflows/sync_labels.yml"

  # Release Drafter
  get_file ".github/release-drafter.yml"
  get_file ".github/workflows/release_drafter.yml"
}


# main
create_direction
get_common_actions
