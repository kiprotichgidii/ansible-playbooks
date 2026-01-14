# PostgreSQL Role

Installs, secures, and configures PostgreSQL Server.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `postgresql_version` | `14` | Version of PostgreSQL to install. |
| `postgresql_port` | `5432` | Port to listen on. |
| `postgresql_listen_addresses` | `localhost` | Addresses to listen on. |
| `postgresql_users` | `[]` | List of users to create. |
| `postgresql_databases` | `[]` | List of databases to create. |
| `postgresql_hba_entries` | `[]` | List of entries for `pg_hba.conf`. |

## Example Playbook

```yaml
---
- hosts: db_servers
  become: true
  vars:
    postgresql_version: "14"
    postgresql_listen_addresses: "*"
    
    postgresql_databases:
      - name: myapp_db
        owner: myapp_user

    postgresql_users:
      - name: myapp_user
        password: secure_password
        db: myapp_db # Grants privileges on this DB
        priv: "ALL"

    postgresql_hba_entries:
      - type: host
        database: all
        user: all
        address: 0.0.0.0/0
        method: md5
  roles:
    - postgresql
```
