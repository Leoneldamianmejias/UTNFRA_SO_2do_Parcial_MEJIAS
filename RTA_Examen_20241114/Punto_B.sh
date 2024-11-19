#!/bin/bash
# Variable donde se va a ubicar el script ejecutable.
destino_script="/usr/local/bin/mejiasAltaUser-Groups.sh"
cat <<EOF | sudo tee "$destino_script" > /dev/null
#!/bin/bash

# Usuario de referencia para obtener la clave
USUARIO_ORIGEN="mejias"

# Ruta del archivo de usuarios
LISTA="/home/mejias/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt"

# Obtener la contraseña cifrada de 'mejias' desde /etc/shadow
CLAVE_CIFRADA=$(sudo grep "^$USUARIO_ORIGEN:" /etc/shadow | cut -d: -f2)

# Comprobar si se obtuvo la contraseña correctamente
if [ -z "$CLAVE_CIFRADA" ]; then
    echo "Error: No se pudo obtener la contraseña cifrada de $USUARIO_ORIGEN."
    exit 1
fi

# Separar las líneas del archivo por salto de línea
ANT_IFS=$IFS
IFS=$'\n'

# Leer cada línea del archivo y procesar
for i in $(cat "$LISTA" | awk -F ',' '{print $1" "$2" "$3}' | grep -v "#"); do
    # Obtener los valores de cada línea
    USUARIO_NUEVO=$(echo "$i" | awk '{print $1}')
    GRUPO=$(echo "$i" | awk '{print $2}')
    HOME_USR=$(echo "$i" | awk '{print $3}')

    # Crear el grupo si no existe
    if ! grep -q "^$GRUPO:" /etc/group; then
        sudo groupadd "$GRUPO"
        echo "Grupo creado: $GRUPO"
    fi

    # Crear el usuario si no existe
    if ! id "$USUARIO_NUEVO" &>/dev/null; then
        sudo useradd -m -d "$HOME_USR" -s /bin/bash -G "$GRUPO" -p "$CLAVE_CIFRADA" "$USUARIO_NUEVO"
        echo "Usuario creado: $USUARIO_NUEVO con grupo $GRUPO y home $HOME_USR"
    else
        echo "El usuario $USUARIO_NUEVO ya existe, se omite la creación."
    fi
done

# Restaurar IFS original
IFS=$ANT_IFS

echo "Proceso finalizado."
EOF

# Permisos al script mejiasAltaUser-Groups.sh
sudo chmod +x "$destino_script"
