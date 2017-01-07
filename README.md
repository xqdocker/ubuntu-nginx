# Ubuntu Nginx

A simple config for nginx on ubuntu system.

[![Ubuntu 14.04](https://img.shields.io/badge/ubuntu-14.04-brightgreen.svg)]()
[![Nginx 1.10.1](https://img.shields.io/badge/nginx-1.10.1-brightgreen.svg)]()
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/xqdocker/ubuntu-nginx.svg)](https://hub.docker.com/r/xqdocker/ubuntu-nginx/)
[![Docker Stars](https://img.shields.io/docker/stars/xqdocker/ubuntu-nginx.svg)](https://hub.docker.com/r/xqdocker/ubuntu-nginx/)
[![Docker image](https://images.microbadger.com/badges/image/xqdocker/ubuntu-nginx.svg)](https://microbadger.com/images/xqdocker/ubuntu-nginx)

## How to use this image

There are some methods to use this image.


### Launch a nginx container with a simple command.

1. Launch a container with default setting.

  ```
  $ docker run --name [my-nginx] -d xqdocker/ubuntu-nginx
  ```

2. Launch a container with static content.

  ```
  $ docker run --name [my-nginx] -v /my/static/content:/data/www -d xqdocker/ubuntu-nginx
  ```

3. Launch a container and exposing the port.

  ```
  $ docker run --name [my-nginx] -p 8080:80 -d xqdocker/ubuntu-nginx
  ```
  Then you can access `http://localhost:8080` or `http://host-ip:8080` in your browser.

4. Launch a container with config file.

  ```
  $ docker run --name [my-nginx] -v /my/nginx.conf:/etc/nginx/nginx.conf:ro -d xqdocker/ubuntu-nginx
  ```

  `:ro` It's define this directory is `read-only` in container.


### Launch a nginx container with Dockerfile.

* Step one: Create a simple Dockerfile like the following:

  ```
  FROM xqdocker/ubuntu-nginx

  COPY /my/static/content /data/www
  COPY /my/nginx.conf /etc/nginx/nginx.conf
  COPY /my/conf.d/default.conf /etc/nginx/conf.d/default.conf
  ```
* Step two: Build the docker image with this Dockerfile.

  ```
  $ docker build -t [my-ubuntu-nginx] .
  ```

* Run the docker image with the following command:

  ```
  $ docker run --name [my-nginx] -d [my-ubuntu-nginx]
  ```

### Launch a nginx container with Docker-Compose

* Step one: Create a simple docker-compose.yml file:

  ```
  my-nginx:
    image: ubuntu-nginx
    volumes:
      - /my/static/content:/data/www
      - /my/nginx.conf:/etc/nginx/nginx.conf
      - /my/conf.d/default.conf:/etc/nginx/conf.d/default.conf
    ports:
      - "8080:80"
    environment:
      - NGINX_HOST=example.com
      - NGINX_PORT=80
    command: /bin/bash -c "nginx -g 'daemon off;'"
  ```

* Step two: Build and run this docker-compose.yml with Docker-Compose command.

  ```
  $ docker-compose run my-nginx
  ```


## Reference

* [Nginx Official site](http://nginx.org/)
* [Nginx Config](http://nginx.org/en/docs/beginners_guide.html)


## License
Code is under the [MIT license](https://github.com/xqdocker/ubuntu-nginx/blob/master/LICENSE).
