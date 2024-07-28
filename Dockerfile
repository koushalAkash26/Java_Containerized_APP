FROM koushalakash/myjava-maven:latest
ARG artifact=target/Koushal-0.0.1.jar

WORKDIR  /app
COPY src /app
COPY pom.xml /app

RUN mkdir src && \
    mv main src/ && \ 
    mv test src/ && \  
    mvn clean install && \
    cp $artifact app.jar 


ENTRYPOINT ["java"]
CMD ["-jar", "app.jar"]