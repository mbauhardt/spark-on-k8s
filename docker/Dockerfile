FROM openjdk:8-alpine

ENV spark_ver 2.3.1

RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache bash tini libc6-compat curl

# Get Spark from US Apache mirror.
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://www.us.apache.org/dist/spark/spark-${spark_ver}/spark-${spark_ver}-bin-hadoop2.6.tgz | \
        tar -zx && \
    ln -s spark-${spark_ver}-bin-hadoop2.6 spark && \
    echo Spark ${spark_ver} installed in /opt


ADD spark-example_2.11-0.1.jar entrypoint.sh start-worker.sh start-master.sh /
RUN chmod +x /start-master.sh /start-worker.sh
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:/opt/spark/bin
ENTRYPOINT [ "/entrypoint.sh" ]
