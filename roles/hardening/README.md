# Hardening Role

Applies security hardening to Linux servers following industry best practices.

## Features

*   **SSH Hardening**: Disables root login, enforces key-based auth, configures timeouts
*   **Firewall (UFW)**: Configures host-based firewall with default deny policy
*   **Kernel Hardening**: Applies sysctl parameters for network security
*   **Fail2ban**: Protects against brute-force attacks
*   **Automatic Updates**: Enables unattended security updates
*   **Service Cleanup**: Disables unnecessary services

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `hardening_ssh_port` | `22` | SSH port. |
| `hardening_ssh_permit_root_login` | `no` | Allow root login via SSH. |
| `hardening_ssh_password_authentication` | `no` | Allow password authentication. |
| `hardening_ssh_allowed_users` | `[]` | Restrict SSH to specific users. |
| `hardening_enable_ufw` | `true` | Enable UFW firewall. |
| `hardening_ufw_allowed_ports` | `["22/tcp"]` | Ports to allow through firewall. |
| `hardening_enable_fail2ban` | `true` | Enable fail2ban. |
| `hardening_fail2ban_maxretry` | `5` | Max login attempts before ban. |
| `hardening_enable_auto_updates` | `true` | Enable automatic security updates. |

## Example Playbook

```yaml
---
- hosts: all_servers
  become: true
  vars:
    hardening_ssh_port: 2222
    hardening_ssh_allowed_users:
      - admin
      - deploy
    hardening_ufw_allowed_ports:
      - "2222/tcp"  # SSH
      - "80/tcp"    # HTTP
      - "443/tcp"   # HTTPS
    hardening_fail2ban_maxretry: 3
  roles:
    - hardening
```

## Important Notes

> [!WARNING]
> This role modifies SSH configuration. Ensure you have:
> 1. SSH key-based authentication configured
> 2. Added your user to `hardening_ssh_allowed_users` if using that feature
> 3. Updated `hardening_ufw_allowed_ports` to include your SSH port
> 
> **Failure to do so may lock you out of the server!**

## Post-Application

After applying this role:
*   SSH will require key-based authentication
*   UFW firewall will be active with default deny
*   Fail2ban will monitor SSH login attempts
*   System will automatically install security updates
