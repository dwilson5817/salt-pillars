---
munin_master:
  globals:
    dbdir: /var/lib/munin
    htmldir: /var/cache/munin/www
    logdir: /var/log/munin
    rundir: /var/run/munin
    tmpldir: /etc/munin/templates
    includedir: /etc/munin/munin-conf.d
  hosts:
    salt01.dylanw.net:
      address: 127.0.0.1
      use_node_name: yes
    mail01.dylanw.net:
      address: mail01.dylanw.net
      use_node_name: yes
    web01.dylanw.net:
      address: web01.dylanw.net
      use_node_name: yes
    game01.dylanw.net:
      address: game01.dylanw.net
      use_node_name: yes
    git01.dylanw.net:
      address: git01.dylanw.net
      use_node_name: yes
    runner01.dylanw.net:
      address: runner01.dylanw.net
      use_node_name: yes
    runner02.dylanw.net:
      address: runner02.dylanw.net
      use_node_name: yes
    sql01.dylanw.net:
      address: sql01.dylanw.net
      use_node_name: yes
vault:
  version: 1.7.2
  platform: linux_amd64
  dev_mode: False
  verify_download: True
  config:
    ui: true
    storage:
      file:
        path: /var/lib/vault/data
    listener:
      tcp:
        address: 0.0.0.0:8200
        tls_disable: True
        tls_cert_file: ""
        tls_key_file: ""
    default_lease_ttl: 768h
    max_lease_ttl: 768h
