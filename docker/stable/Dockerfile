FROM alpine
LABEL org.opencontainers.image.authors="salty"

COPY clean_collections.py /tmp/clean_collections.py
COPY execute.sh /execute.sh
COPY playbook.yml /playbook.yml

RUN set -x && \
    apk add --no-cache python3 py3-pip openssl-dev python3-dev libffi-dev ca-certificates gcc make musl-dev git yaml-dev rust cargo && \
    pip3 install -U pip && \
    pip3 install ansible jmespath netaddr && \
    rm -rf /root/.cache && \
    rm -rf /root/.cargo

RUN set -ex && apk --no-cache add sudo

RUN git clone -v -b master https://github.com/saltyorg/Saltbox.git /srv/git/saltbox
RUN git clone -v -b master https://github.com/saltyorg/Sandbox.git /opt/sandbox

CMD ["/bin/sh", "/execute.sh"]
