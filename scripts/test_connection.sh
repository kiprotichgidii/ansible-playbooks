#!/bin/bash
set -e

INVENTORY=${1:-inventories/staging/hosts.ini}

# Check if ansible is available
if ! command -v ansible &> /dev/null; then
    echo "Error: ansible is not installed. Please run ./scripts/setup.sh first or activate your venv."
    exit 1
fi

echo "Testing connectivity to hosts in ${INVENTORY}..."
ansible -i "${INVENTORY}" -m ping all
