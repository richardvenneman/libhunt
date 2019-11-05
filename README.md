# libhunt
 Explore the latest updated GitHub / GitLab projects

## Running the server

First make sure you've [installed Docker](https://docs.docker.com/install/). Once Docker is running you can simply start the server by running the following command from the project directory:

```shell
$ docker-compose up
```

The web server is running and you can navigate to [http://localhost:4567/libraries/](http://localhost:4567/libraries/) the access the libraries resource. Libhunt allows you to hunt for libraries written in a specific language. The default language is `Ruby`, but to specify your own language add a `language` parameter: [http://localhost:4567/libraries/?language=Elixir](http://localhost:4567/libraries/?language=Elixir).

## Running the executable (CLI)

You can use libhunt via the command line. To do so run the following command from the project directory:

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
