#!/bin/bash

export HERMES_HOME=/opt/data
export GATEWAY_TOKEN=${GATEWAY_TOKEN:-""}
# 1. 明确使用 Hugging Face 要求的端口
export PORT=${PORT:-7860}

# 2. 设置允许开放访问 (测试阶段可以启用，否则所有请求会被拒绝)
export GATEWAY_ALLOW_ALL_USERS=${GATEWAY_ALLOW_ALL_USERS:-"true"}

if [ -z "$GATEWAY_TOKEN" ]; then
    echo "ERROR: GATEWAY_TOKEN is not set!"
    exit 1
fi

echo "Starting Hermes Agent Gateway on 0.0.0.0:${PORT}..."

# 3. 核心修改：在执行命令时明确绑定到 0.0.0.0 和 7860 端口
exec su - hermes -c "/opt/hermes/.venv/bin/hermes gateway run --host 0.0.0.0 --port ${PORT}"
