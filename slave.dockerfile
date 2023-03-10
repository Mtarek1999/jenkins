FROM ubuntu
USER root
RUN mkdir -p jenkins_home
RUN chmod 777 jenkins_home
RUN apt-get update -qq
RUN apt-get install openjdk-8-jdk -qq
RUN apt-get install openssh-server -qq
RUN useradd -ms /bin/bash jenkins
RUN apt-get update -qq 
RUN apt-get install -qq apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                        $(lsb_release -cs)\
                        stable"
RUN apt-get update -qq \
    && apt-get install docker-ce -y
RUN usermod -aG docker jenkins 
USER jenkins
WORKDIR jenkins_home 
CMD ["/bin/bash"]
