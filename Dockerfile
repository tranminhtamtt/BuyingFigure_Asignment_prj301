# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy WAR
COPY target/AttendenceSystem-1.0-SNAPSHOT.war app.war

# Expose port
EXPOSE 8080

# Run app
ENTRYPOINT ["java","-jar","app.war"]

FROM tomcat:10.1-jdk17
COPY target/AttendenceSystem-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
