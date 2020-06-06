#!/bin/bash

# docker build . -t ayushshanker/slate:0.3

docker run -d --rm --name slate -p 4567:4567 -v $(pwd)/build:/srv/slate/build -v $(pwd)/source:/srv/slate/source ayushshanker/slate:0.3


watchman-make -p source/** --run 'docker exec -it slate /bin/bash -c "bundle exec middleman build"'
