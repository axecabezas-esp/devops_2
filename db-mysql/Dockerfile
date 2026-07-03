FROM mysql:8.0

# Ya no ponemos ENV aqui. Kubernetes se encargará de inyectar MYSQL_ROOT_PASSWORD y MYSQL_DATABASE

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306