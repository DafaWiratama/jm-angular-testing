FROM node:lts-alpine as build
WORKDIR /app
COPY ./test /app/
RUN npm install
RUN npm run build

FROM nginx:latest
COPY --from=build /app/dist/jm-angular-testing /usr/share/nginx/html
EXPOSE 80
