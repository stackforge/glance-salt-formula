keystone_glance_user:
  keystone.user_present:
    - name: glance
    - password: {{ salt['pillar.get']('glance:keystone:password') }}
    - email: {{ salt['pillar.get']('glance:keystone:email') }}
    - tenant: service
    - enable: True
    - roles:
      - service:
        - admin

keystone_glance_service:
  keystone.service_present:
    - name: glance
    - service_type: image
    - description: Openstack Image Service

keystone_glance_endpoint:
  keystone.endpoint_present:
    - name: glance
    - publicurl: http://{{ salt["pillar.get"]("glance:public_ip") }}:9292
    - internalurl: http://{{ salt["pillar.get"]("glance:internal_ip") }}:9292
    - adminurl: http://{{ salt["pillar.get"]("glance:admin_ip") }}:9292
