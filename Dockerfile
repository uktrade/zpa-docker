FROM centos:7

ENV ZPA_VERSION=18.66.2

COPY zscaler.repo /etc/yum.repos.d/zscaler.repo
RUN yum check-update && \
    yum install -y zpa-connector-${ZPA_VERSION} && \
    rm -rf /var/lib/yum/*

USER zscaler:zscaler
WORKDIR /opt/zscaler/var
ENTRYPOINT ["/opt/zscaler/bin/zpa-connector"]