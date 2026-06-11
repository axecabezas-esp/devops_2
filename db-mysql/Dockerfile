FROM mysql:8.0

ENV MYSQL_DATABASE=db_sistema
ENV MYSQL_USER=user_sistema
ENV MYSQL_PASSWORD=userpassword

COPY ./init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
