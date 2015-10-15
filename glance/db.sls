{%- set name="glance" %}

{{ name }}-db:
  mysql_database.present:
    - name: {{ name }}
    - character_set: 'utf8'
    - collate: 'utf8_general_ci'
    - connection_host: "{{ salt["pillar.get"]("glance:mysql:ip","localhost") }}"
    - connection_user: "{{ salt["pillar.get"]("glance:mysql:user", "mysql") }}"
    - connection_pass: "{{ salt["pillar.get"]("glance:mysql:password", "default") }}"
  mysql_user.present:
    - name: {{ name }}
    - host: "{{ salt["pillar.get"](name + ":mysql:host","%") }}"
    - password: {{ salt["pillar.get"](name + ":mysql:password") }}
    - connection_host: "{{ salt["pillar.get"]("glance:mysql:ip","localhost") }}"
    - connection_user: "{{ salt["pillar.get"]("glance:mysql:user", "mysql") }}"
    - connection_pass: "{{ salt["pillar.get"]("glance:mysql:password", "default") }}"
  mysql_grants.present:
    - host: "{{ salt["pillar.get"](name + ":mysql:host","%") }}"
    - grant: all privileges
    - database: "{{ name }}.*"
    - user: {{ name }}
    - connection_host: "{{ salt["pillar.get"]("glance:mysql:ip","localhost") }}"
    - connection_user: "{{ salt["pillar.get"]("glance:mysql:user", "mysql") }}"
    - connection_pass: "{{ salt["pillar.get"]("glance:mysql:password", "default") }}"
