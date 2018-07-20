FROM mongo:3.6.2

MAINTAINER Jaro Marval <jaro@tooldata.io>
LABEL maintaner="Jaro Marval <jaro@tooldata.io>"

COPY ./start.sh /start.sh
COPY ./create-user.sh /create-user.sh

RUN chmod +x /start.sh
RUN chmod +x /create-user.sh

EXPOSE 27017

CMD ["/start.sh"]
