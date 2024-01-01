FROM node:lts-alpine as build
WORKDIR /app
COPY ./ /app/
RUN npm install
RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/dist/jm-angular-testing/browser /usr/share/nginx/html
EXPOSE 80
