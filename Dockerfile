FROM startown/madgraph:3.5.17@sha256:2a5961f55907bd10036dda011d711cde8e49507553986d94e09d95164f34410c

WORKDIR /opt/serverless
COPY pyproject.toml uv.lock ./
RUN --mount=from=startown/uv:0.13.6@sha256:dbe377505ec7674eac78833436eba81cfa88ce7d0ebeae85188e1b5017ea62ba,source=/opt/uv/bin/uv,target=/usr/local/bin/uv \
    UV_PYTHON_DOWNLOADS=never uv sync --frozen --no-dev --no-install-project --python /usr/bin/python3 && \
    rm -rf /root/.cache/uv
COPY rp_handler.py ./

WORKDIR /work
CMD ["/opt/serverless/.venv/bin/python", "-u", "/opt/serverless/rp_handler.py"]
