# FROM ubuntu:18.04

# # Install wget
# RUN apt-get update && apt-get install -y wget
# RUN mkdir -p /java/agent
# WORKDIR /java/agent
# RUN apt-get install -qy default-jdk
# # Install maven
# RUN apt-get install -qy maven
# # Cleanup old packages
# RUN apt-get -qy autoremove
# RUN wget http://192.168.18.112:8080/jnlpJars/agent.jar
# # RUN java -jar agent.jar -jnlpUrl http://192.168.18.112:8080/manage/computer/ismaeel/jenkins-agent.jnlp -secret ea89e2312a656a820d6dfcf2ea98e5fc995bdcede09b29c618d2a339b442d862 -workDir "/"
# # RUN java -jar agent.jar -jnlpUrl http://localhost:8080/manage/computer/ismaeel/jenkins-agent.jnlp ->
# ENTRYPOINT ["java", "-jar", "/java/agent//agent.jar"]

###################### try 2 ###############
# # Base image
# FROM ubuntu:latest

# # Install necessary packages
# RUN apt-get update && \
#     apt-get install -y curl openjdk-11-jdk && \
#     rm -rf /var/lib/apt/lists/*

# # Install Docker
# RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
#     sh get-docker.sh

# # Set up Jenkins JNLP agent
# ARG JENKINS_URL
# ARG JENKINS_AGENT_VERSION=4.9
# ENV JENKINS_AGENT_HOME=/opt/jenkins
# ENV JENKINS_AGENT_WORKDIR=/home/jenkins/agent

# RUN useradd -m -d ${JENKINS_AGENT_HOME} jenkins

# RUN mkdir -p /usr/share/jenkins/agent && \
#     curl -fsSL http://192.168.18.191:8080/jnlpJars/agent.jar -o /usr/share/jenkins/agent/agent.jar

# COPY jenkins-agent.sh /usr/local/bin/jenkins-agent.sh
# RUN chmod +x /usr/local/bin/jenkins-agent.sh

# USER jenkins

# VOLUME ${JENKINS_AGENT_WORKDIR}
# WORKDIR ${JENKINS_AGENT_WORKDIR}

# ENTRYPOINT ["/usr/local/bin/jenkins-agent.sh"]






################### try 3 ##############
# Base image
# FROM ubuntu:latest

# # Install necessary packages
# RUN apt-get update && \
#     apt-get install -y curl openjdk-11-jdk && \
#     rm -rf /var/lib/apt/lists/*

# # Install Docker
# RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
#     sh get-docker.sh

# # Set up Jenkins JNLP agent
# ARG JENKINS_URL
# ARG JENKINS_AGENT_VERSION=4.9
# ENV JENKINS_AGENT_HOME=/opt/jenkins
# ENV JENKINS_AGENT_WORKDIR=/home/jenkins/agent_workspace

# # Create the necessary directories and set permissions
# RUN mkdir -p /home/jenkins/agent_workspace && \
#     chmod 777 /home/jenkins/agent_workspace && \
#     groupadd -g 1000 jenkins && \
#     useradd -u 1000 -g jenkins -m -d ${JENKINS_AGENT_HOME} jenkins

# RUN mkdir -p /usr/share/jenkins/agent && \
#     curl -fsSL ${JENKINS_URL}/jnlpJars/agent.jar -o /usr/share/jenkins/agent/agent.jar

# COPY jenkins-agent.sh /usr/local/bin/jenkins-agent.sh
# RUN chmod +x /usr/local/bin/jenkins-agent.sh

# USER jenkins

# VOLUME ${JENKINS_AGENT_WORKDIR}
# WORKDIR ${JENKINS_AGENT_WORKDIR}




# ENTRYPOINT ["/bin/bash"]
# # ENTRYPOINT ["/usr/local/bin/jenkins-agent.sh"]



############## try 4 ###################

FROM ubuntu

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk curl && \
    rm -rf /var/lib/apt/lists/*

# Set the Jenkins server URL and agent name
# ENV JENKINS_URL=http://username:password@192.168.18.191:8080

ENV JENKINS_URL=http://ismaeel:ismaeel@192.168.18.191:8080
ENV AGENT_NAME=docker-slave

# Download and install the Jenkins agent JAR
RUN curl -o agent.jar $JENKINS_URL/jnlpJars/agent.jar

# Start the Jenkins agent
CMD java -jar agent.jar -jnlpUrl $JENKINS_URL/computer/$AGENT_NAME/slave-agent.jnlp

