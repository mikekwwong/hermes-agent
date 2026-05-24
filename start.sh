#!/bin/bash
# Hermes Agent 启动脚本 for Hugging Face Spaces

export HERMES_HOME=/opt/data
export GATEWAY_TOKEN=${GATEWAY_TOKEN:-""}
export PORT=${PORT:-7860}

# 尝试设置常见的端口环境变量
export HERMES_PORT=$PORT
export GATEWAY_PORT=$PORT
export GATEWAY_HOST="0.0.0.0"

# 设置允许开放访问（测试用）
export GATEWAY_ALLOW_ALL_USERS=${GATEWAY_ALLOW_ALL_USERS:-"true"}

if [ -z "$GATEWAY_TOKEN" ]; then
    echo "ERROR: GATEWAY_TOKEN is not set!"
    exit 1
fi

echo "Starting Hermes Agent Gateway on port $PORT..."

# 尝试带端口参数的启动方式
exec su - hermes -c "cd /opt/hermes && /opt/hermes/.venv/bin/hermes gateway run --port $PORT --host 0.0.0.0"
