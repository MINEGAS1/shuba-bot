FROM eclipse-temurin:17
WORKDIR /app
COPY shubabot2-1.0-SNAPSHOT-jar-with-dependencies.jar ./bot.jar
RUN jar tf bot.jar | head -50
CMD ["java", "-cp", "bot.jar", "Main"]
