FROM beestation/byond:latest AS builder
RUN apt-get update && apt-get install -y git
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3:i386
WORKDIR /build
RUN git clone --depth 1 -b me-attempting-docker/sql https://github.com/Unionstation-13/Unionstation13.git .
RUN DreamMaker baystation12.dme

FROM beestation/byond:latest
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libmariadb3:i386 \
    libnsl2:i386 \
    libcrypt1:i386 && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /build /app
RUN ln -sf /usr/lib/i386-linux-gnu/libmariadb.so.3 /usr/lib/i386-linux-gnu/libmariadb.so && \
    ln -sf /usr/lib/i386-linux-gnu/libmariadb.so.3 /app/libmariadb.so && \
    echo "/app" > /etc/ld.so.conf.d/ss13.conf && \
    ldconfig
EXPOSE 8000
CMD ["bash", "-c", "sleep 15 && LD_PRELOAD=/usr/lib/i386-linux-gnu/libmariadb.so DreamDaemon baystation12.dmb 8000 -trusted"]
