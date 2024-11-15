#!/bin/bash

#Asignamos la direccion de los discos a las variables
DISK1="/dev/sdd"
DISK2="/dev/sdc"

#Creamos los volumenes fisicos
sudo pvcreate "$DISK1" "$DISK2"
# Creamos volumen de grupo vg_temp y vg_datos
sudo vgcreate vg_datos "$DISK1"
sudo vgcreate vg_temp "$DISK2"

#Creamos el volumen logico para docker 
sudo lvcreate -L 5M -n lv_docker vg_datos
#Le damos formato
sudo mkfs.ext4 /dev/vg_datos/lv_docker
#Creamos la carpeta para montar el volumen
sudo mkdir -p /var/lib/docker
#lo montamos
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
#Y para asegurar que el volumen lógico esté disponible en /var/lib/docker en cada arranque.
echo '/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0' >> /etc/fstab

# Crear volumen lógico para work areas y montarlo
sudo lvcreate -L 1.5G -n lv_workareas vg_datos
#Le damos formato
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
#Creamos la carpeta para montar el volumen
sudo mkdir -p /work
#lo montamos
sudo mount /dev/vg_datos/lv_workareas /work
#Y para asegurar que el volumen lógico esté disponible en /var/lib/docker en cada arranque.
echo '/dev/vg_datos/lv_workareas /work ext4 defaults 0 0' >> /etc/fstab

#Crear volumen lógico para swap
sudo lvcreate -L 512M -n lv_swap vg_temp
#Prepara el volumen lógico como espacio de swap
sudo mkswap /dev/vg_temp/lv_swap
#Activa el espacio de swap
sudo swapon /dev/vg_temp/lv_swap
#Será activado automáticamente en cada arranque del sistema.
echo '/dev/vg_temp/lv_swap none swap sw 0 0' | sudo tee -a /etc/fstab
