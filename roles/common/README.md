# Common Role

Provides base system configuration for all servers.

## Features

*   **Essential Packages**: Installs common utilities (vim, git, curl, htop, etc.)
*   **Timezone Configuration**: Sets system timezone
*   **Hostname Management**: Configures hostname and /etc/hosts
*   **Time Synchronization**: Configures NTP (systemd-timesyncd or chrony)
*   **Locale Settings**: Sets system locale
*   **MOTD**: Customizable message of the day
*   **Swap Configuration**: Optional swap file creation

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `common_packages` | `[vim, curl, git...]` | Essential packages to install. |
| `common_timezone` | `UTC` | System timezone. |
| `common_set_hostname` | `false` | Whether to set hostname. |
| `common_hostname` | `""` | Hostname to set. |
| `common_enable_ntp` | `true` | Enable time synchronization. |
| `common_ntp_servers` | `[0-2.pool.ntp.org]` | NTP servers. |
| `common_locale` | `en_US.UTF-8` | System locale. |
| `common_enable_motd` | `true` | Enable custom MOTD. |
| `common_configure_swap` | `false` | Create swap file. |
| `common_swap_size_mb` | `2048` | Swap file size in MB. |

## Example Playbook

```yaml
---
- hosts: all
  become: true
  vars:
    common_timezone: "America/New_York"
    common_set_hostname: true
    common_hostname: "web01.example.com"
    common_packages:
      - vim
      - git
      - htop
      - curl
      - wget
      - net-tools
    common_configure_swap: true
    common_swap_size_mb: 4096
  roles:
    - common
```

## Usage

This role is typically applied to all servers as a baseline configuration. It should be one of the first roles in your playbook execution order.

```yaml
roles:
  - common
  - hardening
  - nginx
```
