clear
pwd
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
sudo apt update
sudo apt install git
ls
sudo fdisk -l
sudo fdisk /dev/sdd
sudo fdisk -l
sudo pvcreate /dev/sdd1
sudo vgcreate vg_datos /dev/sdd1 
sudo pvs
sudo vgs
sudo fdisk /dev/sdd
sudo pvcreate /dev/sdd2
sudo vgcreate vg_datos /dev/sdd2 
sudo pvs
sudo vgs
sudo vgextend vg_datos /dev/sdd2 
sudo pvs
sudo vgs
sudo fdisk /dev/sde
sudo pvcreate /dev/sde1
sudo vgcreate vg_temp /dev/sde1 
sudo pvs
sudo vgs
sudo lvcreate -L +5M vg_datos -n lv_docker 
sudo vgs 
sudo lvcreate -L +512M vg_temp -n lv_swap 
lvdisplay
sudo lvdisplay
sudo lvchange -an /dev/vg_datos/lv_docker
sudo vgchange -an vg_datos
sudo lvremove /dev/vg_datos/lv_docker
sudo vgremove vg_datos
sudo pvdisplay
sudo vgchange -an vg_temp
sudo vgremove vg_temp
sudo pvremove /dev/sde1
sudo pvremove /dev/sdd1
sudo pvremove /dev/sdd2
sudo pvdisplay
sudo fdisk /dev/sdd
sudo fdisk /dev/sde
sudo fdisk /dev/sdd
sudo pvcreate /dev/sdd1
sudo fdisk /dev/sdd
sudo fdisk /dev/sde
sudo vgcreate vg_temp /dev/sde1 
sudo vgcreate vg_datos /dev/sdd1 
sudo vgs 
sudo lvcreate -L +5M vg_datos -n lv_docker 
sudo vgs 
sudo lvcreate -L +1500M vg_datos -n lv_workeareas 
sudo vgs 
sudo lvcreate -L +512M vg_temp -n lv_swap 
sudo vgs 
sudo lvs 
sudo fdisk -l
sudo mkds.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workeareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo cd /var/lib/docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo cd /var/lib/docker
sudo docker run hello-world
sudo fdisk -l
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
df -h
sudo mkdir work
sudo mkdir /work
sudo mount /dev/mapper/vg_datos-lv_workeareas /work/
df -h
free -h
sudo swapon /dev/mapper/vg_temp-lv_swap
free -h
sudo systemctl status docker
exit
pwd
ls
cd UTN-FRA_SO_Examenes/
cd ..
tree work/
snap install tree 
sudo snap install tree 
tree work/
cd work/
ls -la
cd ..
rm -r work/
sudo rm -r work/
clear
cd UTN-FRA_SO_Examenes/
cd ..
cd UTN-FRA_SO_Examenes/
ls
cd /202406/bash_script/Lista_Usuarios.txt
cd 202406/bash_script/
pwd
sudo cd /usr/local/bin/
sudo cd usr/local/bin/
sudo cd usr/local/bin
sudo cd usr/local
sudo cd usr/
sudo cd /usr/
cd ..
cd
cd ..
ls
sudo cd home/
cd usr/
ls
cd bin/
ls
clear
pwd
cd ..
cd local/c
cd local/
ls
cd bin/
ls
sudo vim mejiasAltaUser-Groups.sh
sudo chmod +x mejiasAltaUser-Groups.sh 
./mejiasAltaUser-Groups.sh 
cd /home/mejias/
ls
cd RTA_Examen_20241116/
ls
vim Punto_B.sh 
clear
cd /usr/local/bin/
vim mejiasAltaUser-Groups.sh 
sudo vim mejiasAltaUser-Groups.sh 
cd /home/mejias/
ls
cd RTA_Examen_20241116/
ls
sudo vim Punto_B.sh 
cd /usr/local/bin/
sudo vim mejiasAltaUser-Groups.sh 
cd /home/mejias/
clear
ls
cd UTN-FRA_SO_Examenes/
/202406/docker/
cd /202406
ls
cd 202406
ls
cd
cd RTA_Examen_20241116/
vim Punto_
vim Punto_B.sh 
cd RTA_Examen_20241116/
cd
cd UTN-FRA_SO_Examenes/
cd 202406
cd docker/
sudo vim index.html 
sudo touch Dockerfile
sudo vim Dockerfile 
ls
docker build -t web1-mejias .
sudo usermod -aG docker ($whoami)
sudo usermod -aG docker $whoami
id
sudo usermod -aG docker $(whoami)
id
clear
exi
exit
su - mejias
exi
exit
id
cd UTN-FRA_SO_Examenes/
cd 202406
ls
cd docker/
clear
docker build -t web1-mejias .
docker login
docker tag web1-mejias leoneldamianmejias/web1-mejias
docker push leoneldamianmejias/web1-mejias
sudo vim run.sh
chmod +x run.sh
sudo chmod +x run.sh
./run.sh
curl ifconfig.me
docker ps
vagrant ssh -c "ip addr show"
apt install vagrant
sudo apt install vagrant
vagrant ssh -c "ip addr show"
exit
clear
cd UTN-FRA_SO_Examenes/
cd 202406
clear
ls
cd docker/
ls
docker ps
docker logs stoic_jackson
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' stoic_jackson
docker ps
sudo netstat -tuln | grep 8080
sudo ss -tuln | grep 8080
sudo ufw status
hostname -I
docker restart stoic_jackson
docker logs stoic_jackson
clear
cd ..
cd ansible/
ls
cat roles/
cd roles/
ls
cd 2do_parcial/
ls
cd ..
ll
cd roles/
ll
cd 2do_parcial/
ll
cd tasks/
ls
cat main.yml 
sudo vim main.yml 
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd roles/
cd 2do_parcial/
ls
sudo mkadir -p templates/
sudo mkdir -p templates/
ls
ll
sudo touch template01.j2
vim template01.j2 
sudo vim template01.j2 
sudo touch template02.j2
sudo vim template02.j2 
cd ..
ls
cd tasks/
ls
sudo vim main.yml 
cd ..
ls
cd templates/
ls
pwd
cd ..
cd tasks/
sudo vim main.yml 
clear
ls
pwd
cd ..
ll
sudo touch 2do_parcial_playbook.yml
ll
sudo vim 2do_parcial_playbook.yml 
clear
ll
vim 2do_parcial_playbook.yml 
ansible-playbook -i inventario 2do_parcial_playbook.yml
sudo apt install ansible 
ansible-playbook -i inventario 2do_parcial_playbook.yml
echo [local]
localhost ansible_connection=local > inventario
echo "localhost ansible_connection=local" > inventario
cat inventario 
ansible-playbook -i inventario 2do_parcial_playbook.yml
exit
ls
cd UTN-FRA_SO_Examenes/
cd 202406
cd ansible/
ls
ll
cat README.md 
cat ansible.cfg 
cd roles/
ll
cd 2do_parcial/
ll
cd ..
ls
ansible-playbook -i inventory/hosts playbook.yml
ll
sudo vim inventory/hosts
ansible -i inventory/hosts all -m ping
cat inventory/hosts
sudo vim inventory/hosts
ansible -i inventory/hosts all -m ping
ansible-playbook -i inventory/hosts playbook.yml --ask-become-pass
clear
cd ..
ls
cd ..
ls
cd ..
ls
git clone git@github.com:Leoneldamianmejias/UTNFRA_SO_2do_Parcial_MEJIAS.git
ssh-keygen -t ed25519 -C "leocarp277@gmail.com"
ls -la
cd ss
cd .ssh/
ls
cat id_ed25519.pub 
cd ..
ls
git clone git@github.com:Leoneldamianmejias/UTNFRA_SO_2do_Parcial_MEJIAS.git
ll
cd UTNFRA_SO_2do_Parcial_MEJIAS/
ls
cd ..
cd UTN-FRA_SO_Examenes/
ls
sudo mv 202406 
CD ..
cd ..
ls
cd UTNFRA_SO_2do_Parcial_MEJIAS/
pwd
cd ..
cd UTN-FRA_SO_Examenes/
ll
sudo mv 202406 /home/mejias/UTNFRA_SO_2do_Parcial_MEJIAS
cd ..
cd UTNFRA_SO_2do_Parcial_MEJIAS/
ls
sudo rm -r 20231204/
ls
tree
cat ~/.bash_history
clear
history -a
cat ~/.bash_history
touch ~/.bash_history
ls
ll
touch .bash_history
ls
touch .bash_history
ll
cat ~/.bash_history >> .bash_history 
cat .bash_history 
clear
ls
tree
cd ..
clear
tree 
clear
tree UTNFRA_SO_2do_Parcial_MEJIAS/
clear
cd UTNFRA_SO_2do_Parcial_MEJIAS/
ll
history -a
