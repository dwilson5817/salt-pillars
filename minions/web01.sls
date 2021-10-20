---
node:
  pkg:
    version: 14
    use_upstream_repo: true
sites:
  antrimtiling.com:
    - www
  dwln.co:
    - www
  dylanw.net:
    - www
  dylanwilson.dev:
    - muckamore-credit-union
  dylanwilson.co.uk:
    - www
  dylanwilson.uk:
    - www
  minersrealm.net:
    - www
    - panel
nginx:
  servers:
    managed:
      antrimtiling.com:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: antrimtiling.com www.antrimtiling.com
              - location /:
                  - return: 301 https://$host$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: antrimtiling.com www.antrimtiling.com
              - root: /srv/www/antrimtiling.com/www
              - index: index.php
              - ssl_certificate: /etc/letsencrypt/live/antrimtiling.com/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/antrimtiling.com/privkey.pem
              - ssl_session_timeout: 1d
              - ssl_session_cache: shared:MozSSL:10m
              - ssl_session_tickets: 'off'
              - ssl_dhparam: /etc/letsencrypt/ssl-dhparams.pem
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
              - ssl_prefer_server_ciphers: 'off'
              - add_header: Strict-Transport-Security "max-age=63072000" always
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - ssl_trusted_certificate: /etc/letsencrypt/live/antrimtiling.com/chain.pem
              - location = /favicon.ico:
                  - log_not_found: 'off'
                  - access_log: 'off'
              - location = /robots.txt:
                  - allow: all
                  - log_not_found: 'off'
                  - access_log: 'off'
              - location /:
                  - try_files: '$uri $uri/ /index.php?$args'
              - location ~ \.php$:
                  - include: fastcgi_params
                  - fastcgi_intercept_errors: 'on'
                  - fastcgi_pass: unix:/run/php/php8.0-fpm.sock
                  - fastcgi_param:  SCRIPT_FILENAME $document_root$fastcgi_script_name
              - location ~* \.(js|css|png|jpg|jpeg|gif|ico)$:
                  - expires: max
                  - log_not_found: 'off'
      dwln.co:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: dwln.co www.dwln.co
              - location /:
                  - return: 301 https://$host$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: dwln.co www.dwln.co
              - root: /srv/www/dwln.co/www/public
              - add_header: X-Frame-Options "SAMEORIGIN"
              - add_header: X-Content-Type-Options "nosniff"
              - index: index.php
              - charset: utf-8
              - ssl_certificate: /etc/letsencrypt/live/dwln.co/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/dwln.co/privkey.pem
              - ssl_session_timeout: 1d
              - ssl_session_cache: shared:MozSSL:10m
              - ssl_session_tickets: 'off'
              - ssl_dhparam: /etc/letsencrypt/ssl-dhparams.pem
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
              - ssl_prefer_server_ciphers: 'off'
              - add_header: Strict-Transport-Security "max-age=63072000" always
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - ssl_trusted_certificate: /etc/letsencrypt/live/dwln.co/chain.pem
              - location /:
                  - try_files: '$uri $uri/ /index.php?$query_string'
              - location = /favicon.ico:
                  - access_log: 'off'
                  - log_not_found: 'off'
              - location = /robots.txt:
                  - access_log: 'off'
                  - log_not_found: 'off'
              - error_page: 404 /index.php
              - location ~ \.php$:
                  - fastcgi_pass: unix:/run/php/php8.0-fpm.sock
                  - fastcgi_param: SCRIPT_FILENAME $realpath_root$fastcgi_script_name
                  - include: fastcgi_params
              - location ~ /\.(?!well-known).*:
                  - deny: all
      dylanw.net:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: dylanw.net www.dylanw.net
              - location /:
                  - return: 301 https://www.dylanwilson.dev$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: dylanw.net www.dylanw.net
              - location /:
                  - return: 301 https://www.dylanwilson.dev$request_uri
              - ssl_certificate: /etc/letsencrypt/live/dylanw.net/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/dylanw.net/privkey.pem
              - ssl_session_timeout: 1d
              - ssl_session_cache: shared:MozSSL:10m
              - ssl_session_tickets: 'off'
              - ssl_dhparam: /etc/letsencrypt/ssl-dhparams.pem
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
              - ssl_prefer_server_ciphers: 'off'
              - add_header: Strict-Transport-Security "max-age=63072000" always
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - ssl_trusted_certificate: /etc/letsencrypt/live/dylanw.net/chain.pem
      dylanwilson.dev:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: muckamore-credit-union.dylanwilson.dev
              - location /:
                  - return: 301 https://$host$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: muckamore-credit-union.dylanwilson.dev
              - root: /srv/www/dylanwilson.dev/muckamore-credit-union/public
              - add_header: X-Frame-Options "SAMEORIGIN"
              - add_header: X-Content-Type-Options "nosniff"
              - index: index.php
              - charset: utf-8
              - ssl_certificate: /etc/letsencrypt/live/dylanwilson.dev/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/dylanwilson.dev/privkey.pem
              - ssl_session_timeout: 1d
              - ssl_session_cache: shared:MozSSL:10m
              - ssl_session_tickets: 'off'
              - ssl_dhparam: /etc/letsencrypt/ssl-dhparams.pem
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
              - ssl_prefer_server_ciphers: 'off'
              - add_header: Strict-Transport-Security "max-age=63072000" always
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - ssl_trusted_certificate: /etc/letsencrypt/live/dylanwilson.dev/chain.pem
              - location /:
                  - try_files: '$uri $uri/ /index.php?$query_string'
              - location = /favicon.ico:
                  - access_log: 'off'
                  - log_not_found: 'off'
              - location = /robots.txt:
                  - access_log: 'off'
                  - log_not_found: 'off'
              - error_page: 404 /index.php
              - location ~ \.php$:
                  - fastcgi_pass: unix:/run/php/php8.0-fpm.sock
                  - fastcgi_param: SCRIPT_FILENAME $realpath_root$fastcgi_script_name
                  - include: fastcgi_params
              - location ~ /\.(?!well-known).*:
                  - deny: all
      dylanwilson.co.uk:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: dylanwilson.co.uk www.dylanwilson.co.uk
              - location /:
                  - return: 301 https://www.dylanwilson.dev$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: dylanwilson.co.uk www.dylanwilson.co.uk
              - location /:
                  - return: 301 https://www.dylanwilson.dev$request_uri
              - ssl_certificate: /etc/letsencrypt/live/dylanw.net/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/dylanw.net/privkey.pem
              - ssl_session_timeout: 1d
              - ssl_session_cache: shared:MozSSL:10m
              - ssl_session_tickets: 'off'
              - ssl_dhparam: /etc/letsencrypt/ssl-dhparams.pem
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
              - ssl_prefer_server_ciphers: 'off'
              - add_header: Strict-Transport-Security "max-age=63072000" always
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - ssl_trusted_certificate: /etc/letsencrypt/live/dylanw.net/chain.pem
      dylanwilson.uk:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: dylanwilson.uk www.dylanwilson.uk
              - location /:
                  - return: 301 https://www.dylanwilson.dev$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: dylanwilson.uk www.dylanwilson.uk
              - location /:
                  - return: 301 https://www.dylanwilson.dev$request_uri
              - ssl_certificate: /etc/letsencrypt/live/dylanwilson.uk/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/dylanwilson.uk/privkey.pem
              - ssl_session_timeout: 1d
              - ssl_session_cache: shared:MozSSL:10m
              - ssl_session_tickets: 'off'
              - ssl_dhparam: /etc/letsencrypt/ssl-dhparams.pem
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
              - ssl_prefer_server_ciphers: 'off'
              - add_header: Strict-Transport-Security "max-age=63072000" always
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - ssl_trusted_certificate: /etc/letsencrypt/live/dylanwilson.uk/chain.pem
      minersrealm.net:
        enabled: true
        config:
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: www.minersrealm.net minersrealm.net
              - location /:
                  - return: 301 https://$host$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: www.minersrealm.net minersrealm.net
              - root: /srv/www/minersrealm.net/www
              - index: index.php
              - client_max_body_size: 100m
              - client_body_timeout: 120s
              - sendfile: 'off'
              - ssl_certificate: /etc/letsencrypt/live/minersrealm.net/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/minersrealm.net/privkey.pem
              - ssl_session_cache: shared:SSL:10m
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: '"ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384"'
              - ssl_prefer_server_ciphers: 'on'
              - location /:
                  - try_files: '$uri $uri/ /index.php?route=$uri&$args'
              - location ~ [^/]\.php(/|$):
                  - fastcgi_split_path_info: '^(.+?\.php)(/.*)$'
                  - if (!-f $document_root$fastcgi_script_name):
                      - return: 404
                  - fastcgi_param: SCRIPT_FILENAME $document_root$fastcgi_script_name
                  - fastcgi_param: HTTP_PROXY ""
                  - fastcgi_pass: unix:/run/php/php-fpm.sock
                  - fastcgi_index: index.php
                  - include: fastcgi_params
              - location ~ /\.ht:
                  - deny: all
              - location ~ \.(tpl|cache)$:
                  - return: 403
              - add_header: X-Frame-Options "SAMEORIGIN"
          - server_tokens: 'off'
          - server:
              - listen:
                  - '[::]:80'
                  - 80
              - server_name: panel.minersrealm.net
              - location /:
                  - return: 301 https://$host$request_uri
          - server:
              - listen:
                  - '[::]:443 ssl http2'
                  - 443 ssl http2
              - server_name: panel.minersrealm.net
              - root: /srv/www/minersrealm.net/panel/public
              - index: index.php
              - access_log: /var/log/nginx/pterodactyl.app-access.log
              - error_log:  /var/log/nginx/pterodactyl.app-error.log error
              - client_max_body_size: 100m
              - client_body_timeout: 120s
              - sendfile: 'off'
              - ssl_certificate: /etc/letsencrypt/live/minersrealm.net/fullchain.pem
              - ssl_certificate_key: /etc/letsencrypt/live/minersrealm.net/privkey.pem
              - ssl_session_cache: shared:SSL:10m
              - ssl_protocols: TLSv1.2 TLSv1.3
              - ssl_ciphers: '"ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384"'
              - ssl_prefer_server_ciphers: 'on'
              - add_header: X-Content-Type-Options nosniff
              - add_header: X-XSS-Protection "1; mode=block"
              - add_header: X-Robots-Tag none
              - add_header: Content-Security-Policy "frame-ancestors 'self'"
              - add_header: X-Frame-Options DENY
              - add_header: Referrer-Policy same-origin
              - location /:
                  - try_files: '$uri $uri/ /index.php?$query_string'
              - location ~ \.php$:
                  - fastcgi_split_path_info: '^(.+\.php)(/.+)$'
                  - fastcgi_pass: unix:/run/php/php8.0-fpm.sock
                  - fastcgi_index: index.php
                  - include: fastcgi_params
                  - fastcgi_param: PHP_VALUE "upload_max_filesize = 100M \n post_max_size=100M"
                  - fastcgi_param: SCRIPT_FILENAME $document_root$fastcgi_script_name
                  - fastcgi_param: HTTP_PROXY ""
                  - fastcgi_intercept_errors: 'off'
                  - fastcgi_buffer_size: 16k
                  - fastcgi_buffers: 4 16k
                  - fastcgi_connect_timeout: 300
                  - fastcgi_send_timeout: 300
                  - fastcgi_read_timeout: 300
                  - include: /etc/nginx/fastcgi_params
              - location ~ /\.ht:
                  - deny: all
