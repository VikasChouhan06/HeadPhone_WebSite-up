# Install required packages
RUN apt-get update && apt-get install -y wget unzip

# Download GlassFish 5.0.1 from Softpedia
RUN wget https://www.softpedia.com/dyn-postdownload.php/1798e1a2cb68643caec4c8a1ad98b7ab/678e8a5d/2753d/0/1 -O glassfish-5.0.1.zip \
    && unzip glassfish-5.0.1.zip -d /opt \
    && rm glassfish-5.0.1.zip

# Remove default web applications (optional)
RUN rm -rf /opt/glassfish5/glassfish/domains/domain1/autodeploy/*

# Copy WAR file into GlassFish’s autodeploy directory
COPY STQA_Project/dist/STQA_Project.war /opt/glassfish5/glassfish/domains/domain1/autodeploy/ROOT.war

# Expose port 8080 (GlassFish default)
EXPOSE 8080

# Start GlassFish server
CMD ["/opt/glassfish5/bin/asadmin", "start-domain", "--verbose", "domain1"]
