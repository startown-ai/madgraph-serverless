FROM startown/madgraph:3.8.1-7@sha256:16887ca4dc4e669df30729aa6ec7b1b388498a217cb08c4ae007869a7b9b8d98

WORKDIR /opt/serverless
COPY pyproject.toml uv.lock ./
RUN --mount=from=dhi.io/uv:0.13.6@sha256:bd970e6b048e8204d30e4a963486a1c33587e4f72ef81c719a2be158e6e28f40,source=/usr/local/bin/uv,target=/usr/local/bin/uv \
    UV_PYTHON_DOWNLOADS=never uv sync --frozen --no-dev --no-install-project --python /opt/python/bin/python3 && \
    rm -rf /root/.cache/uv
COPY rp_handler.py ./

WORKDIR /work
CMD ["/opt/serverless/.venv/bin/python", "-u", "/opt/serverless/rp_handler.py"]
