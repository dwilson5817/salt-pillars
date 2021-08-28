sites:
  panel.minersrealm.net:
    repo: https://gitlab.dylanwilson.dev/dylan/minersrealm-panel.git
    secrets:
      multicraft_config:
        from: php/application.php.dist
        to: php/application.php
