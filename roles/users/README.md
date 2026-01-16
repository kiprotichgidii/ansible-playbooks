# Users Role

Manages user accounts and SSH access on Linux systems.

## Features

*   **User Creation**: Create multiple user accounts with custom UIDs, shells, and groups
*   **SSH Key Management**: Install SSH authorized keys from a centralized dictionary
*   **Sudo Access**: Configure passwordless sudo for specified group
*   **User Removal**: Remove unwanted user accounts with optional home directory cleanup
*   **Flexible Configuration**: Toggle user management on/off with `users_manage` flag

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `users_manage` | `true` | Enable/disable user management. |
| `users_default_shell` | `/bin/bash` | Default shell for new users. |
| `users_default_groups` | `[users]` | Default groups for new users. |
| `users_sudo_group` | `wheel` | Group for passwordless sudo access. |
| `users_create` | `[]` | List of users to create. |
| `users_remove` | `[]` | List of users to remove. |
| `ssh_public_keys` | `{}` | Dictionary of SSH keys by username. |

## User Definition

Each user in `users_create` can have:
*   `name`: (Required) Username
*   `uid`: Custom UID (optional)
*   `shell`: Custom shell (optional, defaults to `users_default_shell`)
*   `groups`: List of additional groups (optional)
*   `state`: `present` or `absent` (optional, defaults to `present`)

## SSH Keys

SSH keys are defined as a list within each user object using the `ssh_keys` attribute.

## Example Playbook

```yaml
---
- hosts: all
  become: true
  vars:
    users_sudo_group: wheel
    users_create:
      - name: admin
        uid: 1050
        groups: ["wheel", "docker"]
        ssh_keys:
          - "ssh-rsa AAAA..."
          - "ssh-ed25519 AAAA..."
      - name: deploy
        groups: ["wheel"]
        shell: /bin/zsh
        ssh_keys:
          - "ssh-rsa AAAA..."
    users_remove:
      - name: olduser
        remove_home: true
  roles:
    - users
```

## Notes

*   SSH keys are defined directly within each user object in `users_create`
*   The sudo group receives passwordless sudo access via `/etc/sudoers.d/`
*   User removal does not delete home directories by default (set `remove_home: true`)
