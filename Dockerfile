FROM jenkins/jenkins:lts

USER root

# instalar Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm

# Render pasa el puerto en la variable de entorno PORT
ENV JENKINS_HOME=/var/jenkins_home

USER jenkins

# Comando de arranque: usar el puerto asignado por Render
CMD ["sh", "-c", "java -jar /usr/share/jenkins/jenkins.war --httpPort=$PORT"]