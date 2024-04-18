# Archivo Dockerfile para crear una imagen Docker que contiene la aplicación del microservicio en Node.js.

# Imagen base que se utiliza para construir la imagen.
FROM node:lts-alpine3.18

# Establecer el directorio
WORKDIR /app   

# Copiar archivos en el directorio
COPY . . 

# Instalar dependencias
RUN npm install

# Ejecutar la aplicación
CMD ["npm", "start"] 
