FROM python:3.14-slim-bookworm
RUN apt update -y && \
    apt install ffmpeg -y && \
    cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak && \
    sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|security.debian.org|security.mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    apt install pkg-config libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavdevice-dev -y && \
    pip install openai-whisper -i https://mirrors.aliyun.com/pypi/simple/ && \
    pip install faster-whisper -i https://mirrors.aliyun.com/pypi/simple/
