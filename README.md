# Ansible Playbooks

This repository contains Ansible playbooks and roles for server configuration and application deployment.

## Repository Structure

- `inventories/`: Inventory files per environment (local, staging, production).
- `playbooks/`: Individual playbooks (e.g., user setup).
- `roles/`: Reusable Ansible roles.
- `site.yml`: Main entry point to run all configurations.
- `ansible.cfg`: Ansible configuration parameters.

## Setup

1.  **Create Virtual Environment**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    pip install ansible
    ```

2.  **Install Requirements**
    (If you add external roles in requirements.yml)
    ```bash
    # ansible-galaxy install -r requirements.yml
    ```

## Usage

### Run All configurations
The `site.yml` playbook is the main entry point.

```bash
ansible-playbook -i inventories/staging/hosts.ini site.yml
```

### Run Specific Playbook
You can run individual playbooks if needed.

```bash
ansible-playbook -i inventories/staging/hosts.ini playbooks/user-setup.yml -e "user_name=myuser"
```

## Security Credentials

Secrets should be encrypted using **Ansible Vault**.
```bash
ansible-vault encrypt inventories/production/group_vars/all/vault.yml
```
