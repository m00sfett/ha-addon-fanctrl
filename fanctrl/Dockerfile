ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
# We need python3 and pip
# build-base, libgpiod-dev and python3-dev are needed for compiling gpiod from pip
# git is needed for pip install from github
RUN apk add --no-cache \
    python3 \
    py3-pip \
    libgpiod \
    bash \
    git \
    build-base \
    libgpiod-dev \
    python3-dev

WORKDIR /app

# Install gpiod python bindings via pip (to avoid missing apk package 'py3-gpiod')
# And install the core package from GitHub (Pinned to 0.3.19)
RUN pip install --break-system-packages gpiod git+https://github.com/m00sfett/fanctrl.git@0.3.24

# Copy Add-on scripts
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Verify environment
RUN which bash && bash --version
RUN ls -l /run.sh && head -n 1 /run.sh

CMD [ "/run.sh" ]
