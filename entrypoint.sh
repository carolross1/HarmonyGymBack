#!/bin/bash
export SERVER_PORT=${PORT:-8080}
exec java -jar app.jar --server.port=$SERVER_PORT