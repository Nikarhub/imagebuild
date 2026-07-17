FROM node:25.6.0-slim
RUN sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    apt update && \
    apt install -y --no-install-recommends \
        wget git ripgrep fd-find tree jq \
        python3 python3-pip python3-dev build-essential \
        ruby-full && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY SunlineHaitechRootCA.crt /usr/local/share/ca-certificates/SunlineHaitechRootCA.crt

RUN update-ca-certificates

RUN pip3 install --break-system-packages --no-cache-dir \
    -i https://mirrors.aliyun.com/pypi/simple/ \
    pyyaml ruamel.yaml jinja2 tabulate boto3 minio harborapi

RUN npm config set registry https://registry.npmmirror.com && \
    npm install -g @openai/codex clawhub && \
    npm cache clean --force