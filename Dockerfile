FROM eclipse-temurin:17
WORKDIR /app
COPY shubabot2-1.0-SNAPSHOT-jar-with-dependencies.jar ./bot.jar
RUN jar tf bot.jar | grep Main
CMD ["java", "-cp", "bot.jar", "Main"]
