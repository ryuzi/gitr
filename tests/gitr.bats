#!/usr/bin/env bats

setup() {
  export GITR_ROOT="$BATS_TEST_DIRNAME/.gitr_test"
  rm -rf "$GITR_ROOT"
  mkdir -p "$GITR_ROOT/github.com/user/repo"
}

teardown() {
  rm -rf "$GITR_ROOT"
}

@test "sourcing defines helper functions" {
  source "$BATS_TEST_DIRNAME/../gitr"
  run type __gitr_list
  [ "$status" -eq 0 ]
  run type __gitr_dir
  [ "$status" -eq 0 ]
}

@test "__gitr_list lists the repo path" {
  source "$BATS_TEST_DIRNAME/../gitr"
  run __gitr_list
  [ "$status" -eq 0 ]
  [[ "$output" == *"github.com/user/repo" ]]
}

@test "__gitr_dir returns matching full dir when present" {
  source "$BATS_TEST_DIRNAME/../gitr"
  run __gitr_dir "github.com/user/repo"
  [ "$status" -eq 0 ]
  [[ "$output" == *"/.gitr_test/github.com/user/"* || "$output" == *"github.com/user/repo"* ]]
}
