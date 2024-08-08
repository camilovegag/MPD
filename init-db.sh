#!/bin/bash
set -e

# Wait for PostgreSQL to start
echo "Waiting for PostgreSQL to start..."
until pg_isready -U "$POSTGRES_USER"; do
  sleep 1
done

echo "Restoring the database..."
pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" /docker-entrypoint-initdb.d/customerservice.sql

echo "Database restore complete."
