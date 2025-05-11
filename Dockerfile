# Stage 1: Build
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Run
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
