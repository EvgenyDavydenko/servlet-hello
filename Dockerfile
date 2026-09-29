# Use the official Java image as the base image
FROM eclipse-temurin:17-jdk-noble

RUN apt-get update && apt-get install -y curl zip unzip git mc

# Установка Maven
ENV MAVEN_VERSION=3.9.16
RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
    && curl -fsSL -o /tmp/apache-maven.tar.gz https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
    && rm -f /tmp/apache-maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Устанавливаем Tomcat
ENV TOMCAT_VERSION=10.1.60
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar -xvzf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat \
    && rm apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && chmod +x /opt/tomcat/bin/*.sh

# Делаем пользователя ubuntu владельцем директории
RUN chown -R ubuntu:ubuntu /opt/tomcat

# Устанавливаем рабочую директорию
WORKDIR /home/ubuntu/servlet-app

# Добавим путь к Tomcat в переменные окружения
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Открываем порт Tomcat
EXPOSE 8080

# Команда по умолчанию — запуск Tomcat
CMD ["catalina.sh", "run"]