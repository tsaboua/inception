FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install nginx -y
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Charente/L=Angouleme/O=42/OU=42/CN=tsaboua.42.fr/UID=tsaboua"
COPY /conf/default /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]
