FROM debian:bookworm

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

EXPOSE 3306

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/create_db.sh .

RUN chmod +x create_db.sh

CMD ["./create_db.sh"]
