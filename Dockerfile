FROM node:25.6.0-slim
RUN npm config set registry https://registry.npmmirror.com && npm install -g @openai/codex
COPY config.json /root/.codex/config.json