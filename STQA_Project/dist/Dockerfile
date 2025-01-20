# Use OpenJDK 11 base image
FROM openjdk:11-jdk

# Install GlassFish server
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://github.com/eclipse-ee4j/glassfish/releases/download/5.1.0/glassfish-5.1.0.zip \
    && unzip glassfish-5.1.0.zip -d /opt \
    && rm glassfish-5.1.0.zip

# Remove default web applications (optional)
RUN rm -rf /opt/glassfish4/glassfish/domains/domain1/autodeploy/*

# Copy WAR file into GlassFish’s autodeploy directory
COPY STQA_Project/dist/STQA_Project.war /opt/glassfish4/glassfish/domains/domain1/autodeploy/ROOT.war

# Expose port 8080 (GlassFish default)
EXPOSE 8080

# Start GlassFish server
CMD ["/opt/glassfish4/bin/asadmin", "start-domain", "--verbose", "domain1"]
