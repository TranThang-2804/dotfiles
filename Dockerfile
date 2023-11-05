FROM ubuntu:latest

WORKDIR /root

COPY . /root/installed-package

RUN cd /root/installed-package && \
  . ./setup.sh all

ENTRYPOINT ["/bin/bash", "nvim"]
CMD ["."]
