FROM ubuntu:25.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /minecraft

RUN apt-get update && \
    apt-get install -y \
    openjdk-21-jdk \
    wget && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/4707d00eb834b446575d89a61a11b5d548d8c001/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

ENTRYPOINT [ "java" ]

CMD [ "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]