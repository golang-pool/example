
FROM    golang:1.9.4-alpine3.6
#RUN     apk add -U git bash

#FROM golang:1.9.4
#RUN apt-get install git bash

#RUN     go get -d github.com/spf13/cobra
#RUN     go get -d github.com/spf13/pflag

RUN mkdir -p /go/src/github.com/golang-pool/example/exam1

WORKDIR /go/src/github.com/golang-pool/example/exam1
COPY . /go/src/github.com/golang-pool/example/exam1

RUN go build main.go
