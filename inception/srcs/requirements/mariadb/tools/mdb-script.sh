#!/bin/bash
env

if [ -d "/var/lib/mysql/wordpress" ]; then
    echo "Base de données wordpress déjà initialisée."
else
    echo "Initialisation de MariaDB..."
    mysql_install_db --user=mysql --ldata=/var/lib/mysql

    # Démarrer MariaDB temporairement en arrière-plan
    mysqld_safe --skip-networking &
    sleep 5  # attendre que MariaDB démarre


    mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO '$SQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

    mysqladmin -u root shutdown
fi

exec mysqld --user=mysql
