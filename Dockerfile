FROM openshift/jenkins-agent-nodejs-8-centos7:latest
MAINTAINER Ladislav Thon <lthon@redhat.com>

USER root

COPY files/google-chrome.repo /etc/yum.repos.d/

RUN yum -y install epel-release yum-plugin-copr && \
    yum -y copr enable alsadi/dumb-init && \
    yum -y install dumb-init jq xmlstarlet && \
    # Chrome is for Selenium tests, fonts are for Chrome to render properly
    yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm && \
    yum -y install google-chrome-stable msttcore-fonts-installer && \
    yum -y clean all && \
    rm -rf /var/cache/yum

USER 1001

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/usr/local/bin/run-jnlp-client"]
