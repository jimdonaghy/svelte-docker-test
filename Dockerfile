FROM node:18-alpine AS build

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginxinc/nginx-unprivileged
COPY --from=build /app/public /usr/share/nginx/html