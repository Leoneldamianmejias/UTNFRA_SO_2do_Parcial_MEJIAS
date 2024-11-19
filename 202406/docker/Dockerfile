# Usar una imagen base
FROM nginx:latest

# Copiar un archivo al contenedor
COPY index.html /usr/share/nginx/html/index.html

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto (opcional, ya lo tiene nginx)
CMD ["nginx", "-g", "daemon off;"]
