FROM beestation/byond:latest AS builder


RUN apt-get update && apt-get install -y git


RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3:i386

WORKDIR /build


RUN git clone --depth 1 https://github.com/Unionstation-13/Unionstation13.git .


RUN DreamMaker baystation12.dme


FROM beestation/byond:latest


RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends libmariadb3:i386 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app


COPY --from=builder /build /app


EXPOSE 8000

CMD ["DreamDaemon", "baystation12.dmb", "8000", "-trusted"]
