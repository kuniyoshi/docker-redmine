#!/bin/bash
env \
    | grep DOCKER_ENV_ \
    | cut -d = -f 1 \
    | xargs -n 1 -I % perl -i -lpe 's{__%__}{$ENV{%}}g' config/*.yml

bundle exec rake generate_secret_token

exec /usr/local/bundle/bin/unicorn_rails -I lib -c unicorn.conf -o 127.0.0.1 -p 3000 -E production
