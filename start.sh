#!/bin/bash
# Hermes Agent 启动脚本 for Hugging Face Spaces

export HERMES_HOME=/opt/data
export GATEWAY_TOKEN=${GATEWAY_TOKEN:-""}

if [ -z "$GATEWAY_TOKEN" ]; then
    echo "ERROR: GATEWAY_TOKEN is not set!"
    echo "Please add GATEWAY_TOKEN in Settings -> Variables and secrets"
    exit 1
fi

echo "Starting Hermes Agent Gateway..."
echo "GATEWAY_TOKEN is set (length: ${#GATEWAY_TOKEN})"

# 切换到 hermes 用户运行 gateway
exec su - hermes -c "/opt/hermes/.venv/bin/hermes gateway run"
