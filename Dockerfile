FROM node:25.6.0-slim
RUN sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    apt update && \
    apt install -y --no-install-recommends \
        wget git ripgrep fd-find tree jq curl \
        python3 python3-pip python3-dev build-essential \
        ruby-full && \
        apt clean  && \
        rm -rf /var/lib/apt/lists/* 

COPY SunlineHaitechRootCA.crt /usr/local/share/ca-certificates/SunlineHaitechRootCA.crt

RUN update-ca-certificates

RUN pip3 install --break-system-packages --no-cache-dir \
    -i https://mirrors.aliyun.com/pypi/simple/ \
    pyyaml ruamel.yaml jinja2 tabulate boto3 minio harborapi

RUN npm config set registry https://registry.npmmirror.com && \
    npm install -g @openai/codex clawhub && \
    npm cache clean --force

RUN wget https://dl.k8s.io/release/v1.36.0/bin/linux/amd64/kubectl -O /usr/bin/kubectl && \
    wget https://get.helm.sh/helm-v4.2.3-linux-amd64.tar.gz && \
    tar -xvf helm-v4.2.3-linux-amd64.tar.gz && cp -ar linux-amd64/helm /usr/bin/helm  && \
    chmod +x /usr/bin/kubectl /usr/bin/helm  && \
    rm -rf /var/lib/apt/lists/* helm-v4.2.3-linux-amd64.tar.gz