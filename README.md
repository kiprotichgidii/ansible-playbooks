# Ansible Playbooks

This repository contains Ansible playbooks and roles for server configuration and application deployment.

## Repository Structure

- `inventories/`: Inventory files per environment (local, staging, production).
- `playbooks/`: Individual playbooks (e.g., user setup).
- `roles/`: Reusable Ansible roles.
- `main.yml`: Main entry point to run all configurations.
- `ansible.cfg`: Ansible configuration parameters.

## Setup

1.  **Run Setup Script**
    The `scripts/setup.sh` script automates the environment setup (venv, dependencies).
    ```bash
    ./scripts/setup.sh
    source venv/bin/activate
    ```

    *Alternatively, manual setup:*
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    pip install ansible ansible-lint
    # ansible-galaxy install -r requirements.yml
    ```

## Usage

### Run All configurations
The `main.yml` playbook is the main entry point.

```bash
ansible-playbook -i inventories/staging/hosts.ini main.yml
```

### Run Specific Playbook
You can run individual playbooks if needed.

```bash
ansible-playbook -i inventories/staging/hosts.ini playbooks/user-setup.yml -e "user_name=myuser"
```

## Quality Assurance

This repository includes automated workflows for code quality and documentation:

*   **Ansible Lint**: Runs `ansible-lint` on every push to ensure best practices. Configuration in `.ansible-lint`.
*   **Documentation Check**: Verifies that every role has a `README.md` file.

## Security Credentials (Ansible Vault)

We use Ansible Vault to encrypt sensitive variables (passwords, keys).

1.  **Create/Edit Encrypted File**
    To create or edit the secrets file:
    ```bash
    ansible-vault edit inventories/staging/group_vars/all/vault.yml
    ```
    *This will prompt you for a password and open your $EDITOR.*

2.  **Encrypt Existing File**
    If you have a plain file you want to encrypt:
    ```bash
    ansible-vault encrypt inventories/staging/group_vars/all/vault.yml
    ```

3.  **Running Playbooks**
    When running playbooks that use vaulted variables, add `--ask-vault-pass`:
    ```bash
    ansible-playbook -i inventories/staging/hosts.ini main.yml --ask-vault-pass
    ```
    
    Or use a password file (add path to `vault_password_file` in `ansible.cfg`).
