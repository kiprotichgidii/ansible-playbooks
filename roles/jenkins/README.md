# Jenkins Role

This role installs and configures Jenkins.

## Requirements

None

## Role Variables

- `jenkins_port`: The port Jenkins will listen on. Default is `8080`.
- `jenkins_java_opts`: Additional Java options. Default is `"-Djava.awt.headless=true"`.

## Dependencies

None

## Example Playbook

```yaml
- hosts: servers
  roles:
     - role: jenkins
```
