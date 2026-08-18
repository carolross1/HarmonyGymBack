#!/bin/bash
# Usa el puerto que Render asigna o 8080 por defecto
export SERVER_PORT=${PORT:-8080}
exec java -jar app.jar --server.port=$SERVER_PORT
