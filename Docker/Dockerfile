FROM beestation/byond:latest AS builder


RUN apt-get update && apt-get install -y git


RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3:i386

RUN apt-get update && apt-get install -y software-properties-common && \
    apt-get install -y --no-install-recommends libmysqlclient20:i386 || \
    apt-get install -y --no-install-recommends libmariadb-dev:i386

RUN cp /lib/i386-linux-gnu/libmariadb.so.3 /app/libmariadb.so

RUN ldconfig

WORKDIR /build


RUN git clone --depth 1 -b me-attempting-docker/sql https://github.com/Unionstation-13/Unionstation13.git .


RUN DreamMaker baystation12.dme


FROM beestation/byond:latest


RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3:i386 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app


COPY --from=builder /build /app

RUN cp /usr/lib/i386-linux-gnu/libmariadb.so.3 /app/libmariadb.so && \
    chmod 755 /app/libmariadb.so && \
    ldconfig

EXPOSE 8000

CMD ["bash", "-c", "sleep 15 && DreamDaemon baystation12.dmb 8000 -trusted"]
