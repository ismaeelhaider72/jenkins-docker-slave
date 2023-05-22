FROM ubuntu:18.04

# Make sure the package repository is up to date.
RUN apt-get update && \
    apt-get install -qy git && \
 # Install curl or wget (choose one based on your preference)
echo 'RUN apt-get update && apt-get install -y curl

# Download the agent.jar file using curl
RUN curl -o/home/ismaeel/agent.jar http://localhost:8080/jnlpJars/agent.jar


# Set the working directory
WORKDIR /home/ismaeel


# Define the entry point command to launch the agent.jar
ENTRYPOINT ["java", "-jar", "/home/ismaeel/agent.jar"]
