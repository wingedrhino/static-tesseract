# Use an Ubuntu 18.04 LTS base image so that our build environment is identical
# to most cloud servers onto which we'd be doing the deploying.
FROM ubuntu:bionic

# Initial run of apt update
RUN apt update

# Install everything we'd need in a build environment within Docker
RUN apt install \
    wget \
    git \
    build-essential \
    curl \
    autoconf \
    automake \
    libtool \
    pkg-config \
    apt-transport-https \
    ppa-purge \
    zsh \
    screen \
    byobu \
    parallel \
    iperf3 \
    iotop \
    atop \
    nethogs \
    htop \
    software-properties-common \
    -y

################################################################################
###### Everything above this line can be part of a ubuntu-build base image #####
################################################################################

# Install Dependencies for the software we wish to compile
RUN apt install \
    libicu-dev \
    libpango1.0-dev \
    libcairo2-dev \
    libleptonica-dev \
    -y

# Download software and extract to a working directory
ADD https://github.com/tesseract-ocr/tesseract/archive/4.1.0.tar.gz /
RUN tar -xf 4.1.0.tar.gz

# Switch to this working directory
WORKDIR /tesseract-4.1.0

# Run build commands
RUN ./autogen.sh \
    && ./configure --disable-shared \
    && make \
    && make install \
    && cp `which tesseract` .

# This ensures the container never stops
CMD ["sleep", "infinity"]
