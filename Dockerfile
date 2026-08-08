FROM eclipse-temurin:17
WORKDIR /app
COPY shubabot2-1.0-SNAPSHOT-jar-with-dependencies.jar ./bot.jar
CMD ["java", "-jar", "bot.jar"]
