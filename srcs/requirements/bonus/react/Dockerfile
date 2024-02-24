FROM alpine:3.18.5 AS builder

RUN apk update && apk add nodejs npm

WORKDIR /app

RUN npm install -g yarn

COPY files/app/package.json files/app/yarn.lock ./

RUN yarn install --frozen-lockfile

COPY files/app ./
RUN yarn build

FROM alpine:3.18.5 AS runner

RUN apk update && apk add apache2

RUN mkdir -p /var/www/localhost/htdocs/react
COPY --from=builder /app/dist /var/www/localhost/htdocs/react

CMD [ "httpd", "-D", "FOREGROUND" ]