FROM node:lts-buster
RUN apt-get update && apt-get install -y ffmpeg imagemagick webp && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*
COPY package.json .
RUN npm install
COPY . .
CMD ["node", "index.js"]
{
  "name": "prabath-md",
  "version": "1.0.0",
  "description": "WhatsApp AI Bot",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "@whiskeysockets/baileys": "latest",
    "pino": "^7.0.5",
    "pm2": "^5.2.0"
  }
}
FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "index.js"]

