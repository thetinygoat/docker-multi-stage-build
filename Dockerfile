FROM node:alpine as builder
WORKDIR '/app'
RUN apk add --update yarn
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html