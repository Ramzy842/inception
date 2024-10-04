FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install -y php8.2 php8.2-mysql wget unzip curl php8.2-common  php8.2-iconv php8.2-gd php8.2-curl php8.2-xml php8.2-mysqli php8.2-imap php8.2-cgi php8.2-pdo  php8.2-soap php8.2-posix php8.2-gettext php8.2-ldap php8.2-ctype php8.2-dom php8.2-simplexml
#RUN apt install -y php8.2 php8.2-mysql wget 

WORKDIR /var/www/html

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
mv adminer-4.8.1.php index.php && chown -R root:root /var/www/html

EXPOSE 8080

CMD [ "php", "-S", "[::]:8080", "-t", "/var/www/html" ]
