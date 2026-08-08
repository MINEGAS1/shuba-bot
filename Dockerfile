FROM eclipse-temurin:17
COPY target/classes /app/classes
COPY target/dependency /app/dependency
WORKDIR /app
CMD ["java", "-cp", "classes:dependency/*", "Main"]
