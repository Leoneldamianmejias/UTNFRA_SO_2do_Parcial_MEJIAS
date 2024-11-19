#Docker file
# Usar una imagen base
FROM nginx:latest

# Copiar un archivo al contenedor
COPY index.html /usr/share/nginx/html/index.html

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto (opcional, ya lo tiene nginx)
CMD ["nginx", "-g", "daemon off;"]

#index.html
<div>
<h1> Sistemas Operativos - UTNFRA </h1></br>
<h2> 2do Parcial - Junio 2024 </h2> </br>
<h3> Tu-Nombre MEJIAS</h3>
<h3> División: 113</h3>
</div>

#run.sh
#!/bin/bash

# Ejecutar el contenedor con la imagen pusheada en el puerto 8080
docker run -d -p 8080:80 leoneldamianmejias/web1-mejias
