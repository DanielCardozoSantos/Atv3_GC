# Usa a imagem oficial do Jenkins como base
FROM jenkins/jenkins:lts

# Troca para o usuário root para poder instalar pacotes
USER root

# Instala o cliente Docker e dependências
RUN apt-get update && \
    apt-get install -y lsb-release && \
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Retorna para o usuário jenkins
USER jenkins