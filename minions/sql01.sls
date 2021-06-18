---
{%- set sql_passwords = salt['vault.read_secret']('salt/data/sql-passwords') %}
users:
  antrim:
    password: {{ sql_passwords.antrim }}
    host: "%"
    is_admin: False
    databases:
      - website
  dwlnco:
    password: {{ sql_passwords.dwlnco }}
    host: "%"
    is_admin: False
    databases:
      - website
  dylanw:
    password: {{ sql_passwords.dylanw }}
    host: "%"
    is_admin: False
    databases:
      - power-claim
  miners:
    password: {{ sql_passwords.miners }}
    host: "%"
    is_admin: False
    databases:
      - server
      - website
  muckam:
    password: {{ sql_passwords.muckam }}
    host: "%"
    is_admin: False
    databases:
      - website
  multic:
    password: {{ sql_passwords.multic }}
    host: "%"
    is_admin: False
    databases:
      - daemon
      - panel
  dylan:
    password: {{ sql_passwords.dylan }}
    host: localhost
    is_admin: True
