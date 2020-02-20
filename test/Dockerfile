FROM postgres:9.6

ENV POSTGRES_DB="titanic" \
    POSTGRES_USER="titanic_admin" \
    POSTGRES_PASSWORD="password"

COPY titanic.csv /tmp/titanic.csv
    
COPY create-table.sql /tmp/create-table.sql
