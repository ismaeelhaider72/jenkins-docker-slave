FROM ubuntu:18.04

# Install wget
RUN apt-get update && apt-get install -y wget

# Download the agent.jar file using wget
RUN wget -O /home/ubuntu/agent.jar http://localhost:8080/jnlpJars/agent.jar

RUN pwd
# Set the working directory
WORKDIR /home/ubuntu/

# Define the entry point command to launch the agent.jar
ENTRYPOINT ["java", "-jar", "/home/ubuntu/agent.jar"]
