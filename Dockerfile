FROM gradle:alpine as builder

ADD --chown=gradle:gradle .   /app/
WORKDIR /app
RUN gradle clean build  --no-daemon 

FROM openjdk:13-slim

COPY --from=builder /app/build/libs/app-0.0.1-SNAPSHOT.jar  /
ENTRYPOINT [ "java" , "-jar" , "app-0.0.1-SNAPSHOT.jar" ]
