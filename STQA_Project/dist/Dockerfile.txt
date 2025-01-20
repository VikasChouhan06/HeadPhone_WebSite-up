# Use the official GlassFish 4.1 base image
FROM glassfish:4.1

# Copy the WAR file into the GlassFish autodeploy directory
COPY STQA_Project.war /glassfish4/glassfish/domains/domain1/autodeploy/

# Expose port 8080 for HTTP traffic
EXPOSE 8080

# Start the GlassFish server
CMD ["/glassfish4/bin/asadmin", "start-domain", "-v"]
