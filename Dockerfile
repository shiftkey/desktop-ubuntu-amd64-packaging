FROM ubuntu:18.04

COPY entrypoint.sh /entrypoint.sh

# baseline dependencies for all versions
RUN apt update && apt install -y software-properties-common lsb-release \
    sudo wget curl build-essential jq autoconf automake \
    pkg-config ca-certificates rpm

# add electron unit test dependencies
RUN apt install -y libasound2 libatk-bridge2.0-0 libatk1.0-0 \
    libatspi2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libdrm2 \
    libexpat1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 \
    libnss3 libpango-1.0-0 libx11-6 libxcb1 libxcomposite1 \
    libxdamage1 libxext6 libxfixes3 libxkbcommon0 libxrandr2 \
    libsecret-1-0
    
ENV AS=as
ENV STRIP=strip
ENV AR=ar
ENV CC=gcc
ENV CPP=cpp
ENV CXX=g++
ENV LD=ld
ENV FC=gfortran
ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
ENV npm_config_arch=x64

# This version supports older GLIBC (official builds required a minimum of GLIBC 2.28)
# this might break if you bump the `env.NODE_VERSION` version - ensure you are on the latest version
# of which ever major/minor release which should have this variant available
#
# See https://github.com/nodejs/unofficial-builds/ for more information on these versions.
#
RUN curl -sL 'https://unofficial-builds.nodejs.org/download/release/v18.16.1/node-v18.16.1-linux-x64-glibc-217.tar.xz' | xzcat | sudo tar -vx  --strip-components=1 -C /usr/local/
RUN npm install --global yarn

ENTRYPOINT ["/entrypoint.sh"]
