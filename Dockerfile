FROM node:25.6.0-slim
RUN npm config set registry https://registry.npmmirror.com && npm install -g @openai/codex && apt update -y && apt install wget git ripgrep fd-find tree jq -y
COPY config.toml /root/.codex/config.toml