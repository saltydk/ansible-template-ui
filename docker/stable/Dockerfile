FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="salty"

COPY clean_collections.py /tmp/clean_collections.py
COPY execute.sh /execute.sh
COPY playbook.yml /playbook.yml

RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
    python3 python3-pip curl openssl-dev python3-dev libffi-dev ca-certificates gcc make git yaml-dev rust cargo && \
    pip3 install -U pip setuptools wheel && \
    pip3 install ansible jmespath netaddr && \
    git clone -v -b master https://github.com/saltyorg/Saltbox.git /srv/git/saltbox && \
    git clone -v -b master https://github.com/saltyorg/Sandbox.git /opt/sandbox && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /root/.cache && \
    rm -rf /root/.cargo && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

CMD ["/bin/sh", "/execute.sh"]
