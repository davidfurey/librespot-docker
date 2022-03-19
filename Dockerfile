FROM ubuntu:18.04

RUN set -eux; \
  apt-get update; \
  apt-get install -y rustc build-essential libjack-dev git; \
  git clone https://github.com/librespot-org/librespot.git; \
  cd librespot/; \
  cargo build --no-default-features --features "jackaudio-backend" --release; \
  cp target/release/librespot /usr/bin/; \
  rm -rf /var/lib/apt/lists/*;
