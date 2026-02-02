ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
# We use the generic HA base image or python. 
# Using python:3.11-alpine is easier for standalone, but HA addons usually use the build_from arg.
# Let's use python alpine for simplicity as requested in plan "Base image (alpine/python)"

FROM python:3.11-alpine

# Install system dependencies
# libgpiod is needed for gpiod package access to hardware
RUN apk add --no-cache libgpiod

WORKDIR /app

# Install the core package from GitHub
RUN pip install git+https://github.com/m00sfett/fanctrl.git@main

# Copy Add-on scripts
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD [ "/app/run.sh" ]
