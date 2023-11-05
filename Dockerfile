FROM ubuntu:latest

COPY . /initialize/installed-package

WORKDIR /initialize/installed-package
RUN ./setup.sh docker

WORKDIR /root

ENTRYPOINT [ "/bin/bash" ] 
