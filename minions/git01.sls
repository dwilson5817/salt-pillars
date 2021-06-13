---
{%- set dns_cloudflare = salt['vault.read_secret']('salt/data/dns-cloudflare') %}
letsencrypt:
  use_package: true
  pkgs:
    - python3-certbot-dns-cloudflare
  dns_credentials:
    email: {{ dns_cloudflare.email }}
    api_key: {{ dns_cloudflare.api_key }}
    api_token: {{ dns_cloudflare.api_token }}
