nginx
=====

INSTALL
-------

``` bash
  $ docker pull nginx
  $ mkdir -p /docker/nginx/etc/nginx /docker/nginx/usr/share/nginx/html
  $ cp -a nginx/etc/ /docker/nginx/etc/nginx/
  $ cp nginx/html/* /docker/nginx/usr/share/nginx/html/
```

RUN
---

``` bash
  $ docker run \
  -d \
  --net=host \
  -p 443:443 \
  -v /docker/nginx/etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /docker/nginx/etc/nginx/ssl/server.key:/etc/nginx/ssl/server.key:ro \
  -v /docker/nginx/etc/nginx/ssl/server.crt:/etc/nginx/ssl/server.crt:ro \
  -v /docker/nginx/usr/share/nginx/html:/usr/share/nginx/html:ro \
  --name nginx \
  nginx
```
