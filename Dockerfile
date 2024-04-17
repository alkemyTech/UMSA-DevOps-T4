# Archivo Dockerfile para crear una imagen Docker que contiene la aplicación Node.js.
# Imagen base que se utiliza para construir la imagen.
FROM node:lts-alpine3.18

WORKDIR /app

COPY . .

RUN npm install

CMD ["npm", "start"]
