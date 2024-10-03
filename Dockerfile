FROM denoland/deno:debian-1.42.4

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    gzip \
    ca-certificates \
    openssl \
    git \
    unzip \
    libncursesw6 \
    build-essential

RUN deno install -A -r https://cli.fluentci.io -n fluentci

ENV KAMAL_VERSION=1.9.0

RUN fluentci run --wasm kamal install

CMD ["fluentci"]
