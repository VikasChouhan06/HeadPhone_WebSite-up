# Use an official OpenJDK image with GlassFish
FROM glassfish:5.1-jdk11

# Remove default web applications (if needed)
RUN rm -rf /opt/glassfish4/glassfish/domains/domain1/autodeploy/*

# Copy WAR file into GlassFish’s autodeploy directory
COPY STQA_Project/dist/STQA_Project.war /opt/glassfish4/glassfish/domains/domain1/autodeploy/ROOT.war

# Expose port 8080 (GlassFish default)
EXPOSE 8080

# Start GlassFish server
CMD ["/opt/glassfish4/bin/asadmin", "start-domain", "--verbose", "domain1"]
