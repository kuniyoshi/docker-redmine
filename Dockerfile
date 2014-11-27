FROM ruby
MAINTAINER KUNIYOSHI kouji <kuniyoshi.kouji@gmail.com>

RUN apt-get update
RUN apt-get install -y libjpeg-dev libpng12-dev libgd-dev libpcre3-dev imagemagick libmagickwand-dev

RUN mkdir /opt/redmine
WORKDIR /opt/redmine
RUN git clone git://github.com/redmine/redmine.git
WORKDIR /opt/redmine/redmine
RUN bundle install --without development

RUN gem install mysql2
RUN gem install unicorn

RUN git clone git://github.com/ummm/redmine_chatwork_notifications.git plugins/redmine_chatwork_notifications
RUN cd plugins/redmine_chatwork_notifications && perl -i -lpe '$. == 1 and s{}{source "https://rubygems.org"}' Gemfile && bundle install

ADD config/database.yml config/settings.yml config/chatwork.yml /opt/redmine/redmine/config/
ADD unicorn.conf /opt/redmine/redmine/unicorn.conf
EXPOSE 3000
ADD redmine.sh /redmine.sh
ENTRYPOINT /redmine.sh
CMD cat /redmine.sh && echo && echo 'See redmine.sh above.'
