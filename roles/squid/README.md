Ansible Role: Squid
=========
Ansible Role to Installs/Configures Squid

[![Build Status](https://travis-ci.com/kilip/ansible-role-squid.svg?branch=master)](https://travis-ci.com/kilip/ansible-role-squid)

Role Variables
--------------

Define your squid cache dirs with this variables:
```yaml
# rendered squid.conf will be:
# cache_dir aufs /srv/cache/disk1 5000 24 256
squid_cache_dirs:
- dir: /srv/cache/disk1
  type: aufs
  options: 5000 24 256
```

You can include raw config files in ```squid``` variables:
```yaml
squid: |
  acl localnet src 0.0.0.1-0.255.255.255
  acl localnet src 10.0.0.0/8
```

Example Playbook
----------------
```yaml
# path/to/playbook.yml
- hosts: servers
  roles:
  - { role: squid, x: 42 }
```

License
-------
MIT

Author Information
------------------
This role created in 2020 by [Anthonius Munthi](https://itstoni.com).
