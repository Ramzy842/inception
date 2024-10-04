FROM debian:12


RUN apt update && apt upgrade -y


RUN apt install netdata  vim -y


RUN vim -c "%s/127.0.0.1/0.0.0.0/g | wq" /etc/netdata/netdata.conf


RUN service netdata restart


EXPOSE 9000


CMD ["netdata", "-D"]
