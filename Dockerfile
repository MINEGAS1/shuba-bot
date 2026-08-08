FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
RUN ls -la /app/target/

FROM eclipse-temurin:17
WORKDIR /app
COPY --from=build /app/target/*-jar-with-dependencies.jar ./bot.jar
RUN ls -la /app/
CMD ["java", "-jar", "bot.jar"]
