#!/bin/bash

# Jenkins URL and secret
# JENKINS_URL="http://192.168.18.191:8080"
AGENT_SECRET="ea89e2312a656a820d6dfcf2ea98e5fc995bdcede09b29c618d2a339b442d862"

# Jenkins JNLP agent parameters
# PARAMS="-jnlpUrl $JENKINS_URL/docker-slave.jnlp -workDir /home/jenkins/agent"
# PARAMS="-jnlpUrl $JENKINS_URL/computer/docker-slave/slave-agent.jnlp -workDir /home/jenkins/agent_workspace"

# Start the Jenkins JNLP agent
# java $JAVA_OPTS -jar /usr/share/jenkins/agent/agent.jar $PARAMS -secret $AGENT_SECRET



# 192.168.18.191


java -jar /usr/share/jenkins/agent/agent.jar -jnlpUrl http://192.168.18.191:8080/manage/computer/ismaeel/jenkins-agent.jnlp -secret $AGENT_SECRET 
