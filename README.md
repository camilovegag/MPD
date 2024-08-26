# Proyecto de Modelado y Persistencia de Datos

## Contenido

Este proyecto configura y ejecuta dos bases de datos utilizando Docker: MySQL y PostgreSQL. Incluye un archivo de configuración para Docker Compose y comandos para interactuar con las bases de datos.

## Configuración del Entorno
1. Clona el repositorio:

```bash
git clone https://github.com/camilovegag/MPD
cd MPD
```

2. Crea un archivo .env en la raíz del proyecto, puedes guiarte del `.env.example` o utilizar la siguiente configuración:

```sh
# MySQL
MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=classicmodels
MYSQL_USER=user
MYSQL_PASSWORD=password
MYSQL_PORT=3306

# Postgres
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_DB=customerservice
POSTGRES_PORT=5432
```

## Comando para Ejecutar Docker Compose

Para iniciar los servicios de base de datos, usa el siguiente comando:

```bash
docker compose up -d
```

## Comandos docker exec

### Conectar a MySQL

1. Para conectarse a la base de datos MySQL en el contenedor, usa el siguiente comando:
```bash
docker exec -it mysql_db mysql -u user -p
```
Ingresa la contraseña cuando se solicite.

2. Para listar las bases de datos en MySQL:

```sql
SHOW DATABASES;
```

3. Para usar una base de datos específica y listar sus tablas:

```sql
USE classicmodels;
SHOW TABLES;
```

### Conectar a PostgreSQL

1. Para conectarse a la base de datos PostgreSQL en el contenedor, usa el siguiente comando:

```bash
docker exec -it postgres_db psql -U user -d customerservice
```
Ingresa la contraseña cuando se solicite.


2. Para listar las bases de datos en PostgreSQL:

```bash
\l
```

3. Para usar una base de datos específica y listar sus tablas:

```bash
\c customerservice
\dt
```

## Notas Adicionales

- Asegúrate de que los archivos mysqlsampledatabase.sql y customerservice.sql estén en el mismo directorio que su archivo docker-compose.yml para que se carguen correctamente en los contenedores.

- Modifica los valores en el archivo .env según sea necesario para adaptarse a su entorno y configuración específica.
