## Создание простого приложения на Java Servlet API

* Создать проект из [архетипа Maven](https://mvnrepository.com/artifact/org.apache.maven.archetypes/maven-archetype-webapp/1.5)

    ```
    mkdir .m2
    docker compose up -d --build
    docker exec -it openjdk17-noble bash
    mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-webapp -DarchetypeVersion=1.5
    'groupId': com.example
    'artifactId': ./
    ```

* После развертывания проекта в файле pom.xml заменить:

	```
    <artifactId>servlet-hello</artifactId>
    
    <finalName>ROOT</finalName>
    ```

* В pom.xml добавим зависимость:
[Jakarta Servlet](https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api/6.1.0)

* Для пересборки проекта использовать команду:

    ```
    mvn clean package
    cp ./target/ROOT.war /opt/tomcat/webapps
    ```

* Посмотреть логи контейнера

    ``` docker logs -f openjdk17-noble ```
