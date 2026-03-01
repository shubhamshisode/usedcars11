# Use OpenJDK 21
FROM openjdk:21

# Set working directory
WORKDIR /app

# Copy Maven wrapper and project files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the project inside container (skip tests for speed)
RUN ./mvnw clean package -DskipTests

# Expose server port
EXPOSE 8082

# Run Spring Boot JAR
CMD ["java", "-jar", "target/usedcars11-0.0.1-SNAPSHOT.jar"]
