FROM ubuntu:latest

# Atualiza a lista de pacotes e instala o OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get clean;

# Define a variável de ambiente JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

# Define a variável de ambiente PATH
ENV PATH $JAVA_HOME/bin:$PATH

WORKDIR /ifce-minecraft-server

COPY . .

CMD ["java", "-Xmx8G", "-jar", "server.jar", "nogui"]
