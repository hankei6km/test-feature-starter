#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check @githubnext/github-copilot-cli@0.1.29 is installed" github-copilot-cli --version | grep '0.1.29'

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
