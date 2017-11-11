FROM ubuntu:latest

RUN apt-get update \
    && sudo apt-get -y install \
    curl \
    openssh-server \
    openssh-client \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    python-software-properties \
    git


# Install Java

RUN add-apt-repository ppa:webupd8team/java \
    && apt-get update \
    && apt-get -y install oracle-java8-installer

# Install docker

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"

RUN apt-get update \
    && apt-get -y install docker-ce

CMD tail -f /dev/null