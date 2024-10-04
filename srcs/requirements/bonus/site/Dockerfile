FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx

RUN apk add --update nodejs npm git

RUN git clone https://github.com/Ramzy842/TEBSI-Landing-Page.git tebsi

#COPY /home/rchahban/project/srcs/requirements/bonus/site/tebsi/package.json .
WORKDIR /tebsi

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]


