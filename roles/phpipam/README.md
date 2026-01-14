# PHPIPAM Role

Installs and configures PHPIPAM (PHP IP Address Management).

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `phpipam_version` | `1.6` | PHPIPAM version to install. |
| `phpipam_install_dir` | `/var/www/phpipam` | Installation directory. |
| `phpipam_db_host` | `localhost` | Database host. |
| `phpipam_db_name` | `phpipam` | Database name. |
| `phpipam_db_user` | `phpipam` | Database user. |
| `phpipam_db_password` | `changeme` | Database password. |
| `phpipam_webserver` | `nginx` | Web server (`nginx` or `apache`). |
| `phpipam_server_name` | `ipam.example.com` | Server name for virtual host. |

## Prerequisites

*   Web server (Nginx or Apache) must be installed
*   PHP and PHP-FPM must be installed
*   MySQL/MariaDB database must be available

## Example Playbook

```yaml
---
- hosts: ipam_servers
  become: true
  vars:
    phpipam_version: "1.6"
    phpipam_server_name: "ipam.company.com"
    phpipam_db_host: "db.company.com"
    phpipam_db_name: "phpipam"
    phpipam_db_user: "phpipam_user"
    phpipam_db_password: "{{ vault_phpipam_db_password }}"
    phpipam_webserver: "nginx"
  roles:
    - nginx
    - php
    - phpipam
```

## Post-Installation

After running this role, complete the PHPIPAM installation by:
1. Creating the database: `CREATE DATABASE phpipam;`
2. Granting privileges to the user
3. Accessing the web interface and following the setup wizard
