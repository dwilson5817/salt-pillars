---
{%- set sql_passwords = salt['vault.read_secret']('salt/data/sql-passwords') %}
users:
  antrim:
    password: {{ sql_passwords.antrim }}
    host: '%'
    is_admin: false
    databases:
      - website
  dwlnco:
    password: {{ sql_passwords.dwlnco }}
    host: '%'
    is_admin: false
    databases:
      - website
  dylanw:
    password: {{ sql_passwords.dylanw }}
    host: '%'
    is_admin: false
    databases:
      - muckamore-credit-union-website
      - power-claim
  miners:
    password: {{ sql_passwords.miners }}
    host: '%'
    is_admin: false
    databases:
      - panel
      - server
      - website
  muckam:
    password: {{ sql_passwords.muckam }}
    host: '%'
    is_admin: false
    databases:
      - website
  dylan:
    password: {{ sql_passwords.dylan }}
    host: localhost
    is_admin: frue
