FROM ubuntu:latest
COPY --from=denoland/deno:bin-2.1.7 /deno /usr/local/bin/deno

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    gzip \
    ca-certificates \
    openssl \
    git \
    unzip \
    libncursesw6 \
    build-essential \
    libc-dev \
    libstdc++-11-dev \
    libgcc-11-dev \
    netbase \
    libudev-dev

RUN deno install -A -r -g https://cli.fluentci.io -n fluentci

WORKDIR /app

ENV KAMAL_VERSION=1.9.0

RUN fluentci run --wasm kamal version

CMD ["fluentci"]
