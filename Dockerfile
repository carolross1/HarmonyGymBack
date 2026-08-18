# --- Etapa 1: Construcción ---
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests

# --- Etapa 2: Ejecución ---
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copia el JAR
COPY --from=build /app/target/*.jar app.jar

# Copia el script de entrada y dale permisos de ejecución
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]