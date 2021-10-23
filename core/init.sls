---
{%- set dns_cloudflare = salt['vault.read_secret']('salt/data/dns-cloudflare') %}
docker:
  pkg:
    docker:
      use_upstream: repo
      daemon_config:
        ipv6: true
        fixed-cidr-v6: fd00::/80
letsencrypt:
  use_package: true
  pkgs:
    - python3-certbot-dns-cloudflare
  dns_credentials:
    email: {{ dns_cloudflare.email }}
    api_key: {{ dns_cloudflare.api_key }}
    api_token: {{ dns_cloudflare.api_token }}
munin_node:
  log_level: 4
  log_file: /var/log/munin/munin-node.log
  pid_file: /var/run/munin/munin-node.pid
  background: 1
  setsid: 1
  user: root
  group: root
  ignore_file:
    - "[\\#~]$"
    - "DEADJOE$"
    - "\\.bak$"
    - "%$"
    - "\\.dpkg-(tmp|new|old|dist)$"
    - "\\.rpm(save|new)$"
    - "\\.pod$"
  host_name: {{ grains['host'] }}
  allow:
    - ^51\.255\.143\.146$
    - ^127\.0\.0\.1$
    - ^2001:41d0:203:1fbe::9677:95ab$
    - ^::1$
  host: "*"
  port: 4949
