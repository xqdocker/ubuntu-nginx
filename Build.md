# Ubuntu Nginx

## How to release this repo

### Release this repo in git.

* Step one: Change the git version in Makefile

* Step two: Call release command to release in git.

  ```
  $ make git-release
  ```

### Release this repo in registry.

* Step one: Build a docker image in local.

  ```
  $ make image
  ```

* Step two: Publish the docker image to registry.

  ```
  $ make release
  ```

### end
