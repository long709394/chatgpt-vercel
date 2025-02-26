FROM node:alpine
WORKDIR /usr/src
RUN npm install -g pnpm
COPY package.json pnpm-lock.yaml ./
RUN pnpm install
COPY . .
RUN pnpm run build
ENV HOST=0.0.0.0 PORT=3331 NODE_ENV=production
EXPOSE $PORT
RUN pnpm start -p $PORT