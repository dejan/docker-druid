# docker-druid

Docker and docker-compose file for running Druid in development environment.

If you are running Docker in VM (i.e. you're on OSX), make sure to provide enough RAM (at least 8GB) to Docker engine.

## Usage

To run Druid:

    docker-compose up

To populate it with demo dataset:

    docker-compose exec druid bin/post-index-task --file quickstart/tutorial/wikipedia-index.json
