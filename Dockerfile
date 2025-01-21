FROM denoland/deno:debian-2.1.6

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

RUN deno install -A -r -g https://cli.fluentci.io -n fluentci

WORKDIR /app

ENV KAMAL_VERSION=1.9.0

RUN fluentci run --wasm kamal version

CMD ["fluentci"]
