FROM centos:centos6.8

MAINTAINER Allan Selvan <allantony2008@gmail.com>
LABEL authors="Allan Selvan <allantony2008@gmail.com>"
LABEL version="6.8"
LABEL description="Docker container for Linux - CentOS"

ADD VERSION .

# Install extra pakages
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install tools
RUN yum -y install wget
RUN yum -y install gcc
RUN yum -y install passwd nano
RUN yum -y install openssh-server openssh-clients
RUN yum -y install zip unzip

# Install Java
RUN cd /opt/
RUN wget --no-cookies --no-check-certificate \
--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
RUN yum -y localinstall jdk-8u131-linux-x64.rpm
RUN java -version

# Networking
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Setup Login User
RUN echo 'root:welkom' | chpasswd

# Cleanup
RUN rm -rf /tmp/*

EXPOSE 22

<<<<<<< HEAD:images/centos/Dockerfile
CMD ["/bin/bash"]
=======
CMD ["bash"]
>>>>>>> 84ff5ceb59e0cff75162915e94c3f75dd4acc7ac:containers/centos/Dockerfile
