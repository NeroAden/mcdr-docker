FROM ubuntu
VOLUME [ "/server" ]
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get clean \
    && apt-get update \
    && apt-get install openjdk-8-jre -y \
    && apt-get install python3 -y \
    && apt-get install python3-pip -y \
    && apt-get clean \
    && pip3 install mcdreforged
WORKDIR /server
EXPOSE 25575
EXPOSE 25565
ENTRYPOINT [ "python3","-m","mcdreforged" ]
