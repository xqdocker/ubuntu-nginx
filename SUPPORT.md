# Ubuntu Nginx

## How to release this repo

* First: Change the version by VERSION file.

### Release this repo in git.

* Step one: Invoke release command to release in git.

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
