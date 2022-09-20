FROM alpine:3.14 AS Development

RUN apk add --no-cache maven && apk add --no-cache openjdk11-jdk && apk add --no-cache git

RUN adduser --disabled-password devops
USER devops
WORKDIR /home/devops 

RUN git clone https://github.com/spring-guides/gs-spring-boot-docker.git
WORKDIR gs-spring-boot-docker/complete
RUN pwd

RUN echo -e '#!/bin/sh \n echo "====VALIDATE====" \n mvn validate \n echo "====COMPILE====" \n mvn compile \n echo "====TEST===="  \n mvn test \n echo "====PACKAGE====" \n mvn package \n echo "====VERIFY====" \n mvn verify' > ENTRYPOINT_SCRIPT.sh
RUN chmod +x ENTRYPOINT_SCRIPT.sh
RUN cat ENTRYPOINT_SCRIPT.sh

RUN /home/devops/gs-spring-boot-docker/complete/ENTRYPOINT_SCRIPT.sh



FROM alpine:3.14 AS Production

RUN apk add --no-cache openjdk11-jre

RUN adduser --disabled-password devops
USER devops
WORKDIR /home/devops

COPY --from=Development /home/devops/gs-spring-boot-docker/complete/target/spring-boot-docker-complete-0.0.1-SNAPSHOT.jar /home/devops

ENTRYPOINT ["java","-jar","/home/devops/spring-boot-docker-complete-0.0.1-SNAPSHOT.jar"]
