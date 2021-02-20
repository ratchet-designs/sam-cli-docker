FROM node:15.5.0-alpine3.10

ARG SAM_VERSION
ARG AWS_CLI_VERSION=1.19.12
ARG PIP_VERSION=21.0.1

ENV SAM_CLI_TELEMETRY=0

# installing nightly yarn to get fix for https://github.com/yarnpkg/yarn/issues/1961
RUN apk add --no-cache curl ca-certificates openssl gnupg build-base python3-dev py-pip && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk && \
    apk add glibc-2.32-r0.apk && \
    touch ~/.profile && \
    curl -o- -L https://yarnpkg.com/install.sh | sh -s -- --nightly && \
    pip3 install --upgrade pip==${PIP_VERSION} && \
    pip3 install aws-sam-cli=="${SAM_VERSION}" awscli=="${AWS_CLI_VERSION}" && \
    apk del curl build-base

VOLUME /home/sam/.aws /home/node/work

WORKDIR /home/node/work

USER node

EXPOSE 3000

ENTRYPOINT ["/usr/bin/sam"]
