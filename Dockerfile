FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install bash unzip software-properties-common systemd -y
RUN apt-get install curl jq gcc python3-setuptools python3-pip python3-dev -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-cache policy docker-ce
RUN apt-get install docker-ce -y
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN mkdir -p /drone/src
RUN chmod -R 777 /drone/src


ENTRYPOINT ["/bin/bash"]
