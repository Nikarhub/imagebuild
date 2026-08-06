FROM langgenius/dify-plugin-daemon:0.6.3-local
RUN sed -i 's|deb.debian.org|mirrors.aliyun.com|g' /etc/apt/sources.list.d/debian.sources && \
    apt update && \
    apt install -y --no-install-recommends \
        bash build-essential bzip2 coreutils curl fd-find file findutils gawk git grep gzip jq nodejs npm openssh-client pandoc poppler-utils python3 python3-dev python3-pip ripgrep rsync ruby-full sed tar tree unzip wget xz-utils zip \
        apt clean  && \
        rm -rf /var/lib/apt/lists/* 

COPY SunlineHaitechRootCA.crt /usr/local/share/ca-certificates/SunlineHaitechRootCA.crt

RUN update-ca-certificates

RUN pip3 install --break-system-packages --no-cache-dir \
    -i http://nexus.odc.sunline.cn/repository/aliyun-pypi-public/simple \
    pyyaml ruamel.yaml jinja2 tabulate boto3 minio harborapi

RUN wget https://dl.k8s.io/release/v1.36.0/bin/linux/amd64/kubectl -O /usr/bin/kubectl && \
    wget https://get.helm.sh/helm-v4.2.3-linux-amd64.tar.gz && \
    tar -xvf helm-v4.2.3-linux-amd64.tar.gz && cp -ar linux-amd64/helm /usr/bin/helm  && \
    chmod +x /usr/bin/kubectl /usr/bin/helm  && \
    rm -rf /var/lib/apt/lists/* helm-v4.2.3-linux-amd64.tar.gz