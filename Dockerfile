FROM node:lts-alpine3.18

COPY . .

RUN npm install

CMD ["npm", "start"]
