FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:copy-dependencies -DskipTests

FROM eclipse-temurin:17
WORKDIR /app
COPY classes ./classes
COPY --from=build /app/target/dependency ./dependency
CMD ["java", "-cp", "classes:dependency/*", "Main"]
