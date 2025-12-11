FROM python:3.14-slim-bookworm
ENV TZ=Asia/Shanghai
RUN apt update && apt install -y apt install pkg-config libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavdevice-dev -y && \
    rm -rf /var/lib/apt/lists/*
RUN cp /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak && \
    sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    sed -i 's|security.debian.org|security.mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --profile minimal && source ~/.profile
RUN pip install --upgrade pip setuptools wheel && pip install openai-whisper&& pip install faster-whisper