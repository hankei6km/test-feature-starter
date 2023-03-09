#!/usr/bin/env bash

AICOMMITS_PACKAGE="aicommits"
AICOMMITS_VERSION=${VERSION:-"latest"}

set -e

# https://github.com/Balazs23/devcontainers-features/blob/main/src/nx/install.sh
command_exists() {
  command -v "$@" > /dev/null 2>&1
}
# Check if npm is installed
if ! command_exists npm; then
  echo -e 'Feature requires npm to be installed. Please use a node-based image like:'
  echo -e ' - mcr.microsoft.com/vscode/devcontainers/typescript-node:${VARIANT}'
  echo -e 'You can also add as feature like:'
  echo -e ' - "ghcr.io/devcontainers/features/node:1": {}'
fi

echo "Installing npm package: ${AICOMMITS_PACKAGE}@${AICOMMITS_VERSION}"
npm install -g --omit=dev "${AICOMMITS_PACKAGE}@${AICOMMITS_VERSION}"
npm cache clean --force