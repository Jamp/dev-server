FROM node:latest

MAINTAINER Jaro Marval <jaro@tooldata.io>
LABEL maintaner="Jaro Marval <jaro@tooldata.io>"

RUN mkdir -p /app
WORKDIR /app

ADD ./package.json /app/package.json
RUN yarn

ADD . .

EXPOSE 2000

CMD ["yarn", "run", "dev"]
