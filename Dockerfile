# Archivo Dockerfile para crear una imagen Docker que contiene la aplicación del microservicio en Node.js.
# Imagen base que se utiliza para construir la imagen.
FROM node:lts-alpine3.18

WORKDIR /app        # Establecer el directorio

COPY . .            # Copiar archivos en el directorio

RUN npm install     # Instalar dependencias

CMD ["npm", "start"] # Ejecutar la aplicación
