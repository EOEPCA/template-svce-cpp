FROM centos:7

COPY build/src/eoepca /usr/bin/eoepca

ENTRYPOINT ["/usr/bin/eoepca"]
