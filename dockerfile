FROM openjdk:8-jre-alpine

# Copy war file
COPY react-java-ecs/target/users-0.0.2-SNAPSHOT.jar /users.war

# run the app
CMD ["/usr/bin/java", "-jar", "/users.war"]
