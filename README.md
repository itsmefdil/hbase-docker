### HBASE 2.5.7 Docker Image

## Build

```bash
docker build -t hbase:2.5.7 .
```

## Environment Variables

Default values are set in the Dockerfile. Override them in the .env file.

```bash
HBASE_ROOTDIR=file:///opt/hbase/data
HBASE_ZOOKEEPER_DATA_DIR=/opt/hbase/zookeeper
HBASE_UNSAFE_STREAM_CAPABILITY_ENFORCE=false
```

HDFS root dir

```
HBASE_ROOTDIR=hdfs://hadoop:9000
HBASE_ZOOKEEPER_DATA_DIR=/opt/hbase/zookeeper
HBASE_UNSAFE_STREAM_CAPABILITY_ENFORCE=false
```

## Run

Docker command:

```bash
docker run --env-file .env -p 16000:16000 -p 16010:16010 -p 16020:16020 -p 16030:16030 hbase:2.5.7
```

Docker Compose:

```bash
docker-compose up -d
```
