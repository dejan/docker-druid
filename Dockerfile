FROM alpine:3.7

RUN apk --update add \
      bash \
      curl \
      perl \
      python \
      vim \
      openjdk8-jre && \
      rm -rf /var/cache/apk/*

RUN mkdir /opt && \
      cd /opt && \
      curl https://www-us.apache.org/dist/incubator/druid/0.13.0-incubating/apache-druid-0.13.0-incubating-bin.tar.gz -o apache-druid-0.13.0-incubating-bin.tar.gz && \
      tar -xzf apache-druid-0.13.0-incubating-bin.tar.gz

RUN cd /opt && \
      curl https://archive.apache.org/dist/zookeeper/zookeeper-3.4.11/zookeeper-3.4.11.tar.gz -o zookeeper-3.4.11.tar.gz && \
      tar -xzf zookeeper-3.4.11.tar.gz && \
      mv zookeeper-3.4.11 apache-druid-0.13.0-incubating/zk

EXPOSE 8081
EXPOSE 8082
EXPOSE 8083
EXPOSE 8090
EXPOSE 2181 2888 3888

WORKDIR /opt/apache-druid-0.13.0-incubating

CMD ["bin/supervise", "-c", "quickstart/tutorial/conf/tutorial-cluster.conf"]

