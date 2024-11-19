---
# tasks file for 2do_parcial

- debug:
    msg: "Tareas del 2do Parcial"

- name: "Crear directorios en /tmp/2do_parcial/"
  file:
    path: "/tmp/2do_parcial/{{ item }}"
    state: directory
    recurse: yes
  with_items:
    - "alumno"
    - "equipo"

- name: "Agrego archivo desde template para alumno"
  template:
    src: "roles/2do_parcial/templates/template01.j2"
    dest: /tmp/2do_parcial/alumno/datos_alumno.txt

- name: "Agrego archivo desde template para equipo"
  template:
    src: "roles/2do_parcial/templates/template02.j2"
    dest: /tmp/2do_parcial/equipo/datos_equipo.txt


- debug:
    msg: "Configurando sudoers para el grupo 2PSupervisores"

- name: "Configurar sudoers para que todo usuario del grupo '2PSupervisores' no requiera password al ejecutar sudo"
  become: yes
  lineinfile:
    path: /etc/sudoers
    state: present
    regexp: '^%2PSupervisores'
    line: '%2PSupervisores ALL=(ALL) NOPASSWD: ALL'
    validate: 'visudo -cf %s'
