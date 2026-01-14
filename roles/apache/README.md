# Apache Role

Installs and configures Apache HTTP Server.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `apache_package` | `apache2` (Debian) / `httpd` (RedHat) | Package name. |
| `apache_service` | `apache2` (Debian) / `httpd` (RedHat) | Service name. |
| `apache_vhosts` | `[]` | List of virtual hosts to configure. |
| `apache_listen_port` | `80` | Default listening port. |

## Virtual Host Configuration

Each item in `apache_vhosts` can have:
*   `name`: (Required) Config filename (without extension).
*   `servername`: Domain name.
*   `serveralias`: Alias domain(s).
*   `documentroot`: Path to website files.
*   `extra_parameters`: Raw Apache config block (e.g., `<Directory>` directives).

## Example Playbook

```yaml
---
- hosts: web_servers
  become: true
  vars:
    apache_vhosts:
      - name: mywebsite
        servername: mywebsite.com
        documentroot: /var/www/html/mywebsite
        extra_parameters: |
          <Directory /var/www/html/mywebsite>
            AllowOverride All
            Require all granted
          </Directory>
  roles:
    - apache
```
