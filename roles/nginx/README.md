# Nginx Role

Installs and configures Nginx with support for multiple virtual hosts.

## Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `nginx_package` | `nginx` | Package name to install. |
| `nginx_service` | `nginx` | Service name to manage. |
| `nginx_user` | `www-data` | User to run Nginx as. |
| `nginx_client_max_body_size` | `64m` | Max upload size. |
| `nginx_vhosts` | `[]` | List of virtual hosts to configure. |

## Virtual Host Configuration

Each item in `nginx_vhosts` can have:
*   `name`: (Required) Filename for the config.
*   `listen`: Port to listen on (default `80`).
*   `server_name`: Domain name(s).
*   `root`: Document root.
*   `index`: Index files.
*   `extra_parameters`: Raw Nginx config block (e.g., location settings).

## Example Playbook

```yaml
---
- hosts: web_servers
  become: true
  vars:
    nginx_vhosts:
      - name: myapp
        server_name: myapp.example.com
        root: /var/www/myapp
        extra_parameters: |
          location / {
            try_files $uri $uri/ =404;
          }
      - name: api
        server_name: api.example.com
        listen: 8080
        root: /var/www/api
  roles:
    - nginx
```
