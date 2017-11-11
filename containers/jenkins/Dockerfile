<<<<<<< HEAD:images/jenkins/Dockerfile
FROM jenkinsci/jenkins:2.46.3

MAINTAINER Allan Selvan <allantony2008@gmail.com>
LABEL authors="Allan Selvan <allantony2008@gmail.com>"
LABEL version="2.46.3"
LABEL description="Docker container for Jenkins Master"

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

ENV JENKINS_OPTS "$JENKINS_OPTS --prefix=/jenkins"
=======
FROM jenkinsci/jenkins:2.60.3

MAINTAINER Allan Selvan <allantony2008@gmail.com>
LABEL authors="Allan Selvan <allantony2008@gmail.com>"
LABEL version="2.60.3"
LABEL description="Docker container for Jenkins Master"

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

ENV JENKINS_OPTS "$JENKINS_OPT"
>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac:containers/jenkins/Dockerfile
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -server -XX:+AlwaysPreTouch"