FROM ubuntu:18.04

# Install wget
RUN apt-get update && apt-get install -y wget
RUN mkdir -p /java/agent
WORKDIR /java/agent
RUN apt-get install -qy default-jdk
# Install maven
RUN apt-get install -qy maven
# Cleanup old packages
RUN apt-get -qy autoremove
RUN wget http://192.168.18.112:8080/jnlpJars/agent.jar
RUN java -jar agent.jar -jnlpUrl http://localhost:8080/manage/computer/ismaeel/jenkins-agent.jnlp -secret ea89e2312a656a820d6dfcf2ea98e5fc995bdcede09b29c618d2a339b442d862 -workDir "/java/agent"
# RUN java -jar agent.jar -jnlpUrl http://localhost:8080/manage/computer/ismaeel/jenkins-agent.jnlp ->
ENTRYPOINT ["java", "-jar", "/java/agent//agent.jar"]
