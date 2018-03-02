FROM openshift/jenkins-slave-nodejs-centos7:latest
MAINTAINER Ladislav Thon <lthon@redhat.com>

USER root

RUN yum -y install rh-nodejs8 rh-nodejs8-npm rh-nodejs8-nodejs-nodemon && \
    yum -y remove rh-nodejs4* && \
    sed -i -e 's/rh-nodejs4/rh-nodejs8/' /usr/local/bin/scl_enable && \
    yum -y install epel-release && \
    yum -y install jq && \
    yum clean all -y

ENV NODEJS_VERSION=8.6

USER 1001
