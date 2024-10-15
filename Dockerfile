# multistage docker build

FROM node as client-app

WORKDIR /app

COPY . .

RUN apt-get update -y

RUN npm i

EXPOSE 4200 80

RUN npm install -g @angular/cli@17

RUN ng build


# Final image
FROM ubuntu/apache2

WORKDIR /var/www/html

RUN apt-get update -y

RUN apt-get install systemctl -y

COPY --from=client-app /app/dist/* ./

EXPOSE 80

CMD ["systemctl","start", "apache2"]
