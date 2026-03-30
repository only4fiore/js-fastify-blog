FROM node:20-alpine AS base
WORKDIR /app

RUN apk add --no-cache python3 make g++ py3-setuptools

COPY package*.json ./
RUN npm ci

COPY . .

RUN make build

EXPOSE 8080

CMD ["make", "start"]