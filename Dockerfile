# Gunakan base image berdasarkan Java
FROM openjdk:11-jre-slim

# Set variabel lingkungan untuk HBase
ENV HBASE_VERSION=2.5.7
ENV HBASE_HOME=/opt/hbase

# Unduh dan ekstrak distribusi HBase
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz && \
    tar -xzvf hbase-$HBASE_VERSION-bin.tar.gz -C /opt/ && \
    rm hbase-$HBASE_VERSION-bin.tar.gz

# Set working directory
WORKDIR $HBASE_HOME

# Set environment variables for HBase configuration
ENV HBASE_ROOTDIR=file:///opt/hbase/data
ENV HBASE_ZOOKEEPER_DATA_DIR=/opt/hbase/zookeeper
ENV HBASE_UNSAFE_STREAM_CAPABILITY_ENFORCE=false

# Expose HBase ports
EXPOSE 16000 16010 16020 16030

# Menjalankan HBase
CMD ["./bin/start-hbase.sh", "foreground"]

