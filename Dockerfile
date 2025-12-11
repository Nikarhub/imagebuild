FROM python:3.14-slim-bookworm
RUN apt update && apt install -y \
    ffmpeg \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    libavdevice-dev \
    python3-cython \
    python3-pip \
    wget \
    curl && \
    apt update -y && \
    apt install ffmpeg -y && \
    apt install pkg-config libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavdevice-dev -y && \
    cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak && \
    sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|security.debian.org|security.mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    pip install openai-whisper && \
    pip install faster-whisper && \
    rm -rf /var/lib/apt/lists/*