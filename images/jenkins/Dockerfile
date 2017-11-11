FROM jenkinsci/jenkins:2.46.3

MAINTAINER Allan Selvan <allantony2008@gmail.com>
LABEL authors="Allan Selvan <allantony2008@gmail.com>"
LABEL version="2.46.3"
LABEL description="Docker container for Jenkins Master"

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

ENV JENKINS_OPTS "$JENKINS_OPTS --prefix=/jenkins"
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -server -XX:+AlwaysPreTouch"