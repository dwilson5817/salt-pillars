sites:
  panel.minersrealm.net:
    repo: https://gitlab.dylanwilson.dev/dylan/minersrealm-panel.git
    secrets:
      multicraft_config:
        from: php/application.php.dist
        to: php/application.php
nginx:
  servers:
    managed:
      minersrealm.net:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - '80'
              - server_name: 'panel.minersrealm.net'
              - location /:
                  - proxy_set_header: 'X-Real-IP $remote_addr'
                  - proxy_set_header: 'X-Forwarded-For $remote_addr'
                  - proxy_set_header: 'Host $host'
                  - proxy_pass: 'http://localhost:33935'
              - listen:
                  - '[::]:443 ssl'
                  - '443 ssl'
              - ssl_certificate: '/etc/letsencrypt/live/minersrealm.net/fullchain.pem'
              - ssl_certificate_key: '/etc/letsencrypt/live/minersrealm.net/privkey.pem'
              - include: '/etc/letsencrypt/options-ssl-nginx.conf'
              - ssl_dhparam: '/etc/letsencrypt/ssl-dhparams.pem'
