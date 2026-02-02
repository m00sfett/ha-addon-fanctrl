ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
# We need python3 and pip (some base images might not have them)
# build-base, libgpiod-dev and python3-dev are needed for gpiod/logic compilation
# git is needed for pip install from github
RUN apk add --no-cache \
    python3 \
    py3-pip \
    libgpiod \
    py3-gpiod \
    git \
    build-base \
    libgpiod-dev \
    python3-dev

WORKDIR /app

# Install the core package from GitHub (Pinned to v0.3.5)
RUN pip install --break-system-packages git+https://github.com/m00sfett/fanctrl.git@v0.3.5

# Copy Add-on scripts
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]
