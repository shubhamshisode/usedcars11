# Step 1: Use OpenJDK 17 as base image
FROM openjdk:17-jdk-slim

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy Maven wrapper and project files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# Step 4: Make Maven wrapper executable
RUN chmod +x mvnw

# Step 5: Build the project inside container (skip tests for faster build)
RUN ./mvnw clean package -DskipTests

# Step 6: Expose server port
EXPOSE 8082

# Step 7: Run the Spring Boot JAR
CMD ["java", "-jar", "target/usedcars11-0.0.1-SNAPSHOT.jar"]
