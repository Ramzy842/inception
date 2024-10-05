FROM debian:bookworm

RUN apt update && apt upgrade -y

RUN apt install -y php8.2-fpm php8.2 php8.2-mysql wget unzip curl

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY ./conf/wp-config-create.sh .

EXPOSE 9000

RUN mkdir -p /var/www/html

CMD ["sh", "./wp-config-create.sh"]
