# FROM golang:1.16.7 AS build

# ARG TAG
# ENV TAG=${TAG:-dev}

# COPY . /go/src/metacontroller/
# WORKDIR /go/src/metacontroller/
# ENV CGO_ENABLED=0
# RUN make install

From docker.io/metacontrollerio/metacontroller:v2.0.4 as build

FROM alpine:3.19
COPY --from=build /usr/bin/metacontroller /usr/bin/metacontroller
RUN apk update && apk add --no-cache ca-certificates
CMD ["/usr/bin/metacontroller"]


# docker build . -t kubef/metacontroller:v2.0.4