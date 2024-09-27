FROM debian:bookworm


RUN apt update -y && apt install mariadb-server -y


EXPOSE 3306


COPY ./conf/create_db.sh .
RUN chmod +x create_db.sh

CMD ["./create_db.sh"]
