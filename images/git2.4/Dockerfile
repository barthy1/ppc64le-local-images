FROM ppc64le/ubuntu:trusty

RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		dh-autoreconf \
		zlib1g-dev \
		libcurl4-openssl-dev \
        build-essential \
        libssl-dev \
        libexpat1-dev \
        gettext \
        unzip \
        wget \
        openssl \
        ssl-cert \
        ca-certificates \
	&& rm -rf /var/lib/apt/lists/*

RUN cat /etc/ssl/certs/*.pem > /etc/ssl/certs/ca-certificates.crt

RUN wget http://ftp.unicamp.br/pub/ppc64el/ubuntu/14_04/cloud-foundry/jq-1.5-ppc64le -O /usr/local/bin/jq \
    && chmod +x /usr/local/bin/jq

RUN wget --no-check-certificate https://github.com/git/git/archive/v2.4.1.zip -O git.zip \
    && unzip git.zip

RUN cd ./git-* \
    && make prefix=/usr/local all \
    && make prefix=/usr/local install \
    && cd .. \
    && rm -rf git-2.4.1 git.zip \
    && git config --global http.sslVerify false

