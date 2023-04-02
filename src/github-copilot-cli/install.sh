#!/usr/bin/env bash

TARGET_PACKAGE="@githubnext/github-copilot-cli"
TARGET_VERSION=${VERSION:-"latest"}
INSTALL_HELPER=${HELPER:-"false"}

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

echo "Installing npm package: ${TARGET_PACKAGE}@${TARGET_VERSION}"
npm install -g --omit=dev "${TARGET_PACKAGE}@${TARGET_VERSION}"

if test "${INSTALL_HELPER}" = "true"; then
  echo "Installing helper script: helper-gh-copilot-cli.sh"
  cp "$(dirname "${0}")/helper-gh-copilot-cli.sh" /usr/local/bin/helper-gh-copilot-cli.sh
fi