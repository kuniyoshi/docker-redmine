redmine
=======

INSTALL
-------

``` bash
  $ docker pull kuniyoshi/redmine
  $ mkdir -p /docker/redmine/files
```

SETUP
-----

Setup needs mysql.  See [mysql.README](mysql.README.md).

RUN
---

Before run, this redmine requires mysql, and nginx.
See [mysql.README](mysql.README.md), and [nginx.README](nginx.README.md) to run these images.

``` bash
  $ docker run \
  -d \
  -e DOCKER_ENV_CHATWORK_API_TOKEN=xxx \
  -e DOCKER_ENV_MYSQL_ROOT_PASSWORD=xxx \
  --net=host \
  -p 3000:3000 \
  -v /docker/redmine/files:/opt/redmine/redmine/files:rw
  --name redmine \
  redmine
```
