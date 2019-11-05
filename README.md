# libhunt
 Explore the latest updated GitHub / GitLab projects

## Running the server

First make sure you've [installed Docker](https://docs.docker.com/install/). Once Docker is running you can simply start the server by running `docker-compose up` from the project directory.

The web server is now available at [http://localhost:4567](http://localhost:4567). To access the libraries resource, navigate to [http://localhost:4567/libraries/](http://localhost:4567/libraries/). Libhunt allows you to hunt for libraries written in a specific language. The default language is `Ruby`, but to specify your own language add a `language` parameter: [http://localhost:4567/libraries/?language=Elixir](http://localhost:4567/libraries/?language=Elixir).

## Running the executable CLI

You can use libhunt via the command line. To do so run the following command from the project directory:

```bash
bin/libhunt

# Specify a language with the -l or --language parameter
bin/libhunt -l ClojureScript
```

## Running tests

- Navigate to the `app` subdirectory
- Run `rake test`
