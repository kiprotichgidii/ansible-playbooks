#!/bin/bash
set -e

# Check if ansible-lint is available
if ! command -v ansible-lint &> /dev/null; then
    echo "Error: ansible-lint is not installed. Please run ./scripts/setup.sh first or activate your venv."
    exit 1
fi

echo "Running Ansible Lint..."
ansible-lint
