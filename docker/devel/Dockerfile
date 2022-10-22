FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="salty"

COPY execute.sh /execute.sh
COPY playbook.yml /playbook.yml

RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
    python3 python3-pip curl libssl-dev python3-dev libffi-dev ca-certificates gcc make git libyaml-dev && \
    pip3 install -U pip setuptools wheel && \
    pip3 install jmespath netaddr && \
    pip3 install --no-compile ansible && \
    pip3 install -U https://github.com/ansible/ansible/archive/devel.tar.gz && \
    git clone -v -b master https://github.com/saltyorg/Saltbox.git /srv/git/saltbox && \
    git clone -v -b master https://github.com/saltyorg/Sandbox.git /opt/sandbox && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /root/.cache && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

CMD ["/bin/sh", "/execute.sh"]
