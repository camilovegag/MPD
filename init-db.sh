#!/bin/bash
set -e

# Wait for PostgreSQL to start
echo "Waiting for PostgreSQL to start..."
until pg_isready -U "$POSTGRES_USER"; do
  sleep 1
done

# Create the 'postgres' role if it doesn't exist
echo "Creating postgres role if it doesn't exist..."
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "DO \$\$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'postgres') THEN
      CREATE ROLE postgres WITH LOGIN SUPERUSER PASSWORD '$POSTGRES_PASSWORD';
   END IF;
END
\$\$;"

# Restore the database
echo "Restoring the database..."
pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" /docker-entrypoint-initdb.d/customerservice.sql

echo "Database restore complete."
