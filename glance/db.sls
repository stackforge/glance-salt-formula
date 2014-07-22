{%- set name="glance" %}

{{ name }}-db:
  mysql_database.present:
    - name: {{ name }}
    - character_set: 'utf8'
    - collate: 'utf8_general_ci'
  mysql_user.present:
    - name: {{ name }}
    - host: "{{ salt["pillar.get"](name + ":mysql:host","%") }}"
    - password: {{ salt["pillar.get"](name + ":mysql:password") }}
  mysql_grants.present:
    - host: "{{ salt["pillar.get"](name + ":mysql:host","%") }}"
    - grant: all privileges
    - database: "{{ name }}.*"
    - user: {{ name }}
