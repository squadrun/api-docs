from ubuntu:focal

WORKDIR /srv/slate

VOLUME /srv/slate/source

EXPOSE 4567

COPY . /srv/slate

RUN ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential ruby nodejs ruby-dev zlib1g-dev \
        libxml2 libxml2-dev libxslt1.1 libxslt-dev \
    && echo 'gem: --no-rdoc --no-ri' > /root/.gemrc \
    && gem install bundler:1.16.2 \
    && bundle install \
    && apt-get remove -y build-essential \
        zlib1g-dev libxml2-dev libxslt-dev \
    && apt-get autoremove -y \
    && rm -rf /var/apt/cache/* \
    && rm -rf /var/lib/apt/lists/*

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
