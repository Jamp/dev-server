FROM node:8-alpine

MAINTAINER Jaro Marval <jaro@tooldata.io>
LABEL maintaner="Jaro Marval <jaro@tooldata.io>"

RUN apk add --no-cache git

RUN mkdir -p /app
WORKDIR /app

ADD ./package.json /app/
RUN npm install

ADD . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
