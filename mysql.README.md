mysql
=====

INSTALL
-------

``` bash
  $ docker pull mysql
  $ mkdir -p /docker/mysql/var/lib/mysql /docker/mysql/etc
  $ echo >/docker/mysql/etc/my.cnf <<END_MY_CNF
  [mysqld]
  character-set-server    = utf8
  END_MY_CNF
```

RUN
---

``` bash
  $ docker run \
  -d \
  -e MYSQL_ROOT_PASSWORD=xxx \
  -p 3306:3306 \
  -v /docker/mysql/var/lib/mysql:/var/lib/mysql:rw \
  -v /docker/mysql/etc/my.cnf:/etc/my.cnf:ro \
  --name mysql \
  mysql
```
