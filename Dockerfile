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
RUN pip3 install flask==1.0.2 flask-restx>=0.2,<1.0.0 boto3>=1.9.40,<2.0.0 uwsgi==2.0.17.1 flask-cors==3.0.7 gremlinpython==3.4.7 docker==4.4.3
ENTRYPOINT ["/bin/bash"]
