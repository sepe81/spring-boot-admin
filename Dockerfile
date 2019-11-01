FROM adoptopenjdk/openjdk11:alpine-jre

ENV USER app

RUN addgroup $USER \
  && adduser -D -G $USER -S $USER

USER $USER
WORKDIR /home/$USER

COPY --chown=$USER build/libs/*.jar ./app.jar

ENTRYPOINT ["java","-XshowSettings:vm","-XX:MaxRAMPercentage=95","-jar","./app.jar"]
