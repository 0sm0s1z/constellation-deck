#!/usr/bin/env bash
# Repository contract check for Constellation Deck M0.
# Requires bash, git, and jq. Does not build or launch an application.

set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$ROOT"

failures=0
warnings=0

ok() {
  printf 'ok    %s\n' "$1"
}

warn() {
  printf 'warn  %s\n' "$1"
  warnings=$((warnings + 1))
}

fail() {
  printf 'fail  %s\n' "$1"
  failures=$((failures + 1))
}

section() {
  printf '\n==> %s\n' "$1"
}

need_cmd() {
  if command -v "$1" >/dev/null 2>&1; then
    ok "$1"
  else
    fail "$1 is required"
  fi
}

require_file() {
  if [ ! -f "$1" ]; then
    fail "$1 is missing"
  elif [ ! -s "$1" ]; then
    fail "$1 is empty"
  else
    ok "$1"
  fi
}

parent_file() {
  if [ ! -f "$1" ]; then
    warn "$1 is not present yet (parent-owned; not blocking)"
  elif [ ! -s "$1" ]; then
    warn "$1 exists but is empty (parent-owned; not blocking)"
  else
    ok "$1"
  fi
}

CONFIG="Config/deck.example.json"

jq_raw() {
  jq -r "$1" "$CONFIG" 2>/dev/null || printf '%s' '__jq_error__'
}

expect() {
  label="$1"
  expr="$2"
  expected="$3"
  actual="$(jq_raw "$expr")"
  if [ "$actual" = "$expected" ]; then
    ok "$label"
  else
    fail "$label (expected ${expected}, got ${actual})"
  fi
}

expect_type() {
  path="$1"
  expected="$2"
  expect "${path} type is ${expected}" "${path} | type" "$expected"
}

section "Tools"
need_cmd git
need_cmd jq

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  ok "git working tree"
else
  fail "not a git working tree"
fi

section "Required files"
require_file "README.md"
require_file "LICENSE"
require_file ".gitignore"
require_file ".editorconfig"
require_file ".gitattributes"
require_file "CONTRIBUTING.md"
require_file "SECURITY.md"
require_file "Config/deck.example.json"
require_file "Config/README.md"
require_file "Scripts/verify.sh"
require_file ".github/workflows/verify.yml"
require_file ".github/ISSUE_TEMPLATE/bug_report.yml"
require_file ".github/ISSUE_TEMPLATE/feature_request.yml"
require_file ".github/pull_request_template.md"

section "Parent specification files"
parent_file "PRD.md"
parent_file "Docs/DECISIONS.md"
parent_file "Docs/RESEARCH.md"
parent_file "programs/mvp/PROGRAM.md"
parent_file "AGENTS.md"

section "Example configuration"
if jq empty "$CONFIG" >/dev/null 2>&1; then
  ok "Config/deck.example.json is valid JSON"
else
  fail "Config/deck.example.json is not valid JSON"
fi

expect "required top-level keys" \
  '. as $doc | ["schemaVersion","mode","dataDirectory","constellation","herdr","cua","orchestration","capture","service"] | all(in($doc)) | tostring' \
  "true"

expect_type ".schemaVersion" "string"
expect "schemaVersion" ".schemaVersion" "deck.config/v1"

expect_type ".mode" "string"
expect "mode is fixture" ".mode" "fixture"

expect_type ".dataDirectory" "null"
expect "dataDirectory unset" ".dataDirectory" "null"

expect_type ".constellation" "object"
expect "constellation.enabled type" ".constellation.enabled | type" "boolean"
expect "constellation.enabled" ".constellation.enabled | tostring" "false"
expect_type ".constellation.baseURL" "null"
expect "constellation.baseURL unset" ".constellation.baseURL" "null"
expect_type ".constellation.credentialReference" "null"
expect "constellation.credentialReference unset" ".constellation.credentialReference" "null"
expect_type ".constellation.modelPolicy" "string"
expect "constellation.modelPolicy" ".constellation.modelPolicy" "router-default"

expect_type ".herdr" "object"
expect "herdr.enabled type" ".herdr.enabled | type" "boolean"
expect "herdr.enabled" ".herdr.enabled | tostring" "false"
expect_type ".herdr.socketPath" "null"
expect "herdr.socketPath unset" ".herdr.socketPath" "null"

expect_type ".cua" "object"
expect "cua.enabled type" ".cua.enabled | type" "boolean"
expect "cua.enabled" ".cua.enabled | tostring" "false"
expect_type ".cua.connectionReference" "null"
expect "cua.connectionReference unset" ".cua.connectionReference" "null"

expect_type ".orchestration" "object"
expect_type ".orchestration.mode" "string"
expect "orchestration.mode" ".orchestration.mode" "external"
expect "orchestration.automaticContinuation type" ".orchestration.automaticContinuation | type" "boolean"
expect "orchestration.automaticContinuation" ".orchestration.automaticContinuation | tostring" "false"
expect_type ".orchestration.maxCorrectiveAttempts" "number"
expect "orchestration.maxCorrectiveAttempts" ".orchestration.maxCorrectiveAttempts | tostring" "3"
expect_type ".orchestration.maxRunMinutes" "number"
expect "orchestration.maxRunMinutes" ".orchestration.maxRunMinutes | tostring" "60"
expect_type ".orchestration.repeatedFailureLimit" "number"
expect "orchestration.repeatedFailureLimit" ".orchestration.repeatedFailureLimit | tostring" "2"

expect_type ".capture" "object"
expect "capture.continuousRecording type" ".capture.continuousRecording | type" "boolean"
expect "capture.continuousRecording" ".capture.continuousRecording | tostring" "false"
expect_type ".capture.artifactRetentionDays" "number"
expect "capture.artifactRetentionDays" ".capture.artifactRetentionDays | tostring" "30"

expect_type ".service" "object"
expect_type ".service.transport" "string"
expect "service.transport" ".service.transport" "unix"
expect "service.remoteAccess type" ".service.remoteAccess | type" "boolean"
expect "service.remoteAccess" ".service.remoteAccess | tostring" "false"

if git check-ignore -q Config/deck.example.json; then
  fail "Config/deck.example.json is ignored by git"
else
  ok "Config/deck.example.json is not ignored"
fi

section "Workflow contract"
workflow=".github/workflows/verify.yml"
if grep -q 'ubuntu-latest' "$workflow" 2>/dev/null; then
  ok "workflow runs on ubuntu-latest"
else
  fail "workflow does not name ubuntu-latest"
fi
if grep -q 'contents: read' "$workflow" 2>/dev/null; then
  ok "workflow contents permission is read"
else
  fail "workflow does not set contents: read"
fi
if grep -q './Scripts/verify.sh' "$workflow" 2>/dev/null; then
  ok "workflow runs ./Scripts/verify.sh"
else
  fail "workflow does not run ./Scripts/verify.sh"
fi

section "Shell syntax"
if bash -n Scripts/verify.sh; then
  ok "Scripts/verify.sh"
else
  fail "Scripts/verify.sh failed bash -n"
fi

section "Whitespace"
if git diff --check && git diff --cached --check; then
  ok "git diff --check"
else
  fail "git diff --check reported whitespace errors"
fi

printf '\n'
if [ "$failures" -eq 0 ]; then
  if [ "$warnings" -eq 0 ]; then
    printf 'Verification passed.\n'
  else
    printf 'Verification passed with %s warning(s).\n' "$warnings"
  fi
  exit 0
fi

printf 'Verification failed with %s error(s) and %s warning(s).\n' "$failures" "$warnings"
exit 1
