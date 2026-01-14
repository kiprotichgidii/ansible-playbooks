# MariaDB Role

Installs, secures, and configures MariaDB Server.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `mariadb_package` | `mariadb-server` | Package name to install. |
| `mariadb_service` | `mariadb` | Service name to manage. |
| `mariadb_bind_address` | `127.0.0.1` | Address to bind to. Set to `0.0.0.0` for external access. |
| `mariadb_port` | `3306` | Port to listen on. |
| `mariadb_root_password` | `change_me_securely` | Root password for the database. |
| `mariadb_databases` | `[]` | List of databases to create. |
| `mariadb_users` | `[]` | List of users to create. |

## Example Playbook

```yaml
---
- hosts: database_servers
  become: true
  vars:
    # Secure the root user
    mariadb_root_password: "supersecretpassword"
    
    # Allow external access
    mariadb_bind_address: "0.0.0.0"
    
    # Create application database
    mariadb_databases:
      - name: app_db
        encoding: utf8mb4
        collation: utf8mb4_unicode_ci
        
    # Create application user
    mariadb_users:
      - name: app_user
        password: "app_password"
        # Grant all privileges on app_db to app_user from any host
        priv: "app_db.*:ALL"
        host: "%"
  roles:
    - mariadb
```
