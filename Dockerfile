FROM centos:7
RUN yum install -y wget
RUN cd /tmp; wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN cd /tmp; yum install -y ./*.rpm
RUN yum install -y python-pip
RUN pip install --upgrade pip
RUN pip install --upgrade awscli s3cmd python-magic
ENTRYPOINT ["aws"]
