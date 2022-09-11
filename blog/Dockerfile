FROM java:8
EXPOSE 9901

VOLUME /opt/docker/peiBlog

ENV TZ=Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/{TZ} /etc/localhosttime && echo "{TZ}" > /etc/timezone

ADD blog-1.0-SNAPSHOT.jar /app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","/app.jar"]