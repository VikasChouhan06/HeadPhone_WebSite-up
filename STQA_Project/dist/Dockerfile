# Use the official OpenJDK 8 image as the base image
FROM openjdk:8-jdk-alpine

# Set the working directory inside the container
WORKDIR /opt

# Install GlassFish 4.1
RUN apk --no-cache add curl bash && \
    curl -L https://github.com/javaee/glassfish/releases/download/glassfish-4.1.2/glassfish-4.1.2.zip -o glassfish-4.1.2.zip && \
    unzip glassfish-4.1.2.zip && \
    rm glassfish-4.1.2.zip

# Set environment variables for GlassFish
ENV GLASSFISH_HOME=/opt/glassfish4
ENV PATH=$GLASSFISH_HOME/bin:$PATH

# Expose the default GlassFish ports (admin and HTTP)
EXPOSE 8080 4848

# Copy the WAR file to the GlassFish auto-deploy folder
COPY ./STQA_Project.war $GLASSFISH_HOME/glassfish/domains/domain1/autodeploy/

# Start GlassFish
CMD ["asadmin", "start-domain", "--verbose", "domain1"]
