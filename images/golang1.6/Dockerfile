FROM git:2.4

# gcc for cgo
RUN apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
	&& rm -rf /var/lib/apt/lists/*

ENV GOLANG_VERSION 1.6.2
ENV GOLANG_DOWNLOAD_URL http://ftp.unicamp.br/pub/ppc64el/ubuntu/14_04/cloud-foundry/go-$GOLANG_VERSION-ppc64le.tar.gz

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& tar -C /usr/local -xzf golang.tar.gz \
	&& rm golang.tar.gz

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
#WORKDIR $GOPATH
