FROM alpine:3.16

RUN apk update && apk upgrade

RUN apk add --no-cache nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
