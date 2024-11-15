#!/bin/bash
# Variable donde se va a ubicar el script ejecutable.
destino_script="/usr/local/bin/mejiasAltaUser-Groups.sh"
cat <<EOF | sudo tee "$destino_script" > /dev/null
#!/bin/bash

# Obtener los parámetros
usuario_origen="\$1"
archivo="\$2"

# Verificar que se pasaron los parámetros
if [ -z "\$usuario_origen" ] || [ -z "\$archivo" ]; then
    echo "Uso: \$0 <usuario_origen> <ruta_archivo_lista_usuarios>"
    exit 1
fi

# Obtener la clave del usuario origen
clave=\$(getent shadow "\$usuario_origen" | cut -d: -f2)
if [ -z "\$clave" ]; then
    echo "No se pudo obtener la clave para el usuario \$usuario_origen"
    exit 2
fi

# Leer archivo línea por línea
while IFS=, read -r usuario grupo_home dir_home
do
    # Crear el grupo si no existe
    if ! getent group "\$grupo_home" > /dev/null 2>&1; then
        groupadd "\$grupo_home"
    fi

    # Crear el usuario si no existe
    if ! id "\$usuario" &>/dev/null; then
        useradd -m -g "\$grupo_home" -d "\$dir_home" -s "/bin/bash" "\$usuario"
        echo "\$usuario:\$clave" | chpasswd
        echo "Usuario \$usuario creado con éxito con la clave de \$usuario_origen."
    else
        echo "El usuario \$usuario ya existe."
    fi
done < "\$archivo"
EOF

# Permisos al script mejiasAltaUser-Groups.sh
sudo chmod +x "$destino_script"
