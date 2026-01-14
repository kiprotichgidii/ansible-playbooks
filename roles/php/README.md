# PHP Role

Installs and configures PHP and PHP-FPM.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `php_version` | `8.2` | PHP version (Debian/Ubuntu). |
| `php_modules` | `[cli, curl, mysql...]` | List of extensions to install. |
| `php_enable_fpm` | `true` | Whether to install/enable PHP-FPM. |
| `php_fpm_user` | `www-data` | User for FPM pool. |
| `php_fpm_listen` | `/run/php/php8.2-fpm.sock` | FPM listen socket/port. |

## Example Playbook

```yaml
---
- hosts: web_servers
  become: true
  vars:
    php_version: "8.3"
    php_modules:
      - cli
      - fpm
      - mysql
      - gd
      - zip
    # Override FPM listen socket for Nginx upstream
    php_fpm_listen: "/run/php/php8.3-fpm.sock"
  roles:
    - php
```
