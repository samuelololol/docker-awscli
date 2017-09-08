FROM centos:7
RUN yum install -y wget groff less mailcap &&\
    cd /tmp &&\
    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    cd /tmp &&\
    yum install -y ./*.rpm &&\
    rm -rf /tmp/*.rpm &&\
    yum install -y python-pip &&\
    pip --no-cache-dir install --upgrade pip &&\
    pip --no-cache-dir install --upgrade awscli s3cmd python-magic &&\
    yum clean packages &&\
    yum clean headers &&\
    yum clean metadata &&\
    yum clean all &&\
    rm -rf ~/.cache/pip &&\
    mkdir -p /root/.aws &&\
    mkdir -p /project
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
