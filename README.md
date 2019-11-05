# libhunt ![](https://github.com/richardvenneman/libhunt/workflows/Ruby/badge.svg)
 Explore the latest updated GitHub / GitLab projects

## Prerequisites

1. [Generate](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line) a GitHub personal access token with the `repo:public_repo` scope
2. Replace `YOUR_GITHUB_ACCESS_TOKEN_HERE` in `app/.env.example` with your generated token
3. Rename `app/.env.example` to `app/.env`

## Running the server

First make sure you've [installed Docker](https://docs.docker.com/install/). Once Docker is running you can simply start the server by running the following command from the project directory:

```shell
$ docker-compose up
```

The web server is running and you can navigate to [http://localhost:4567/libraries/](http://localhost:4567/libraries/) the access the libraries resource. Libhunt allows you to hunt for libraries written in a specific language. The default language is `Ruby`, but to specify your own language add a `language` parameter: [http://localhost:4567/libraries/?language=Elixir](http://localhost:4567/libraries/?language=Elixir).

### Running without Docker

It's also possible to run the web server without docker:

```shell
$ cd app
$ ruby server.rb
```

## Running the executable (CLI)

You can use libhunt via the command-line. To do so run the following command from the project directory:

```shell
$ bin/libhunt
```

When using the CLI it's also possible to specify a language with the `-l` or `--language` flag:

```shell
$ bin/libhunt -l ClojureScript
```

## Running tests

- Navigate to the `app` subdirectory
- Run `rake test`
