#!/bin/bash
set -e

echo "Setting up development environment..."

# Check if python3 is available
if ! command -v python3 &> /dev/null; then
    echo "Error: python3 is not installed."
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "Installing Ansible and dependencies..."
pip install ansible ansible-lint

# Install requirements if present
if [ -f "requirements.yml" ]; then
    echo "Installing Galaxy roles..."
    ansible-galaxy install -r requirements.yml
fi

echo "Setup complete! To activate the environment, run:"
echo "source venv/bin/activate"
