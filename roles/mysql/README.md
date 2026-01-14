# MySQL Role

Installs, secures, and configures MySQL Server.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `mysql_package` | `mysql-server` | Package name to install. |
| `mysql_service` | `mysql` | Service name to manage. |
| `mysql_bind_address` | `127.0.0.1` | Address to bind to. Set to `0.0.0.0` for external access. |
| `mysql_port` | `3306` | Port to listen on. |
| `mysql_root_password` | `change_me_securely` | Root password for the database. |
| `mysql_databases` | `[]` | List of databases to create. |
| `mysql_users` | `[]` | List of users to create. |

## Example Playbook

```yaml
---
- hosts: database_servers
  become: true
  vars:
    # Secure the root user
    mysql_root_password: "supersecretpassword"
    
    # Allow external access
    mysql_bind_address: "0.0.0.0"
    
    # Create application database
    mysql_databases:
      - name: app_db
        encoding: utf8mb4
        collation: utf8mb4_0900_ai_ci
        
    # Create application user
    mysql_users:
      - name: app_user
        password: "app_password"
        # Grant all privileges on app_db to app_user from any host
        priv: "app_db.*:ALL"
        host: "%"
  roles:
    - mysql
```
