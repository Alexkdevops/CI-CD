#Default image used for deployment


FROM debian:latest

RUN apt-get update
RUN apt-get install nginx -y
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]