# Imagen base de Amazon Corretto
FROM amazoncorretto:17.0.14-alpine3.20

# Instalar Maven usando apk (gestor de paquetes de Alpine)
RUN apk update && apk add --no-cache maven

WORKDIR /app

# Copiar el código fuente al contenedor
COPY . .

# Construir el JAR dentro del contenedor
RUN mvn clean package -DskipTests

# Renombrar el JAR generado dentro del contenedor
RUN mv target/cuenta-0.0.1-SNAPSHOT.jar app.jar

# Copiar un script de espera (lo crearemos a continuación)
COPY wait-for-kafka.sh .

# Hacer el script ejecutable
RUN chmod +x wait-for-kafka.sh

# Exponer el puerto del microservicio
EXPOSE 8082

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/urandom", "-jar", "app.jar"]