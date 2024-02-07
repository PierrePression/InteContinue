FROM jenkins/jenkins:latest

USER root

# Installation des outils nécessaires pour télécharger et décompresser Maven
RUN apt-get update && apt-get install -y curl

# Télécharger et installer Maven
ENV MAVEN_HOME=/usr/share/maven
ENV MAVEN_URL=https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
RUN mkdir -p $MAVEN_HOME && \
    curl -fsSL $MAVEN_URL | tar -xzC $MAVEN_HOME --strip-components=1 && \
    ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn

USER jenkins