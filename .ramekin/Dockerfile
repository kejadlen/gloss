FROM ramekin-agent
ARG TARGETARCH
RUN case "${TARGETARCH}" in \
      amd64) triple="x86_64-unknown-linux-gnu" ;; \
      arm64) triple="aarch64-unknown-linux-gnu" ;; \
      *) echo "unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac \
    && curl -fsSL -o /tmp/zizmor.tar.gz \
      "https://github.com/zizmorcore/zizmor/releases/download/v1.30.0/zizmor-${triple}.tar.gz" \
    && tar -xzf /tmp/zizmor.tar.gz -C /usr/local/bin zizmor \
    && rm /tmp/zizmor.tar.gz \
    && zizmor --version
