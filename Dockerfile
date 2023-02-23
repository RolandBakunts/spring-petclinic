FROM openjdk:17-jdk as builder

RUN mkdir -p /app/source

COPY . /app/source

WORKDIR /app/source

RUN ./mvnw clean package


FROM openjdk:17-jdk-alpine

COPY --from=builder /app/source/target/*.jar /app/app.jar

CMD ["java", "-jar",  "/app/app.jar"]

# For Monitoring
# CMD ["java -javaagent:./jmx_prometheus_javaagent-0.17.2.jar=8080:config.yaml -jar ./target/spring-petclinic-4.2.10-SNAPSHOT.jar"]