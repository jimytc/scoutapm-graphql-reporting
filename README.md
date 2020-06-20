# README

## Requirements

* Ruby 2.4.1
* docker 17.0
* docker-compose 2.4

### Configure your ScoutAPM key

Modify `docker-compose.yml` for `SCOUT_KEY`

```docker
# ...

    environment:
      SCOUT_KEY: <your_scoutapm_key>

# ...
```

### Install dependencies

```bash
$ bundle install
```

### Start services
```bash
$ docker-compose build
$ docker-compose up -d
```

### Send GraphQL requests

```bash
$ ruby scripts/batch_graphql_req.rb
```
