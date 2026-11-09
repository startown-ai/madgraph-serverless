FROM startown/madgraph:3.8.1-8@sha256:dfb55d6df8503c5f8436dca81375ee11f30475993d4e30e258ea54537d019887

WORKDIR /opt/serverless
COPY pyproject.toml uv.lock ./
RUN --mount=from=dhi.io/uv:0.13.6@sha256:bd970e6b048e8204d30e4a963486a1c33587e4f72ef81c719a2be158e6e28f40,source=/usr/local/bin/uv,target=/usr/local/bin/uv \
    UV_PYTHON_DOWNLOADS=never uv sync --frozen --no-dev --no-install-project --python /usr/bin/python3 && \
    rm -rf /root/.cache/uv
COPY rp_handler.py ./

WORKDIR /work
CMD ["/opt/serverless/.venv/bin/python", "-u", "/opt/serverless/rp_handler.py"]
