FROM golang:1.18.5-alpine AS build

ARG UPSTREAM_VERSION

RUN apk add --update-cache \
        make \
        gcc \
        git \
        clang \
        libc-dev

WORKDIR /build
RUN git clone https://github.com/flashbots/mev-boost --single-branch --depth 1 --branch $UPSTREAM_VERSION

WORKDIR /build/mev-boost
RUN make build

FROM golang:1.18.5-alpine

COPY --from=build /build/mev-boost/mev-boost /mev-boost/mev-boost
WORKDIR /mev-boost
ENTRYPOINT ./mev-boost -addr 0.0.0.0:18550 -mainnet -relays $RELAYS