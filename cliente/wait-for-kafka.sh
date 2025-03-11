#!/bin/bash

host="$1"
shift
cmd="$@"

echo "Esperando a que Kafka esté listo en $host..."

until curl -s "$host" > /dev/null; do
  echo "Kafka no está listo aún, esperando..."
  sleep 2
done

echo "Kafka está listo, iniciando la aplicación..."
exec $cmd