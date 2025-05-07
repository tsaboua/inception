FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install mariadb-server -y
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /tools/mdb-script.sh /mdb-script.sh

RUN chmod +x /mdb-script.sh
CMD ["bash" ,"./mdb-script.sh"]