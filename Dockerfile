FROM node:20-bullseye

RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install

COPY . .

CMD ["node", "index.js"]
