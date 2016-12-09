Docker-travis-cli
============

[![Build Status](https://travis-ci.org/skandyla/docker-travis-cli.svg?branch=master)](https://travis-ci.org/skandyla/docker-travis-cli)

## Summary

Repository name in Docker Hub: **[skandyla/travis-cli](https://hub.docker.com/r/skandyla/travis-cli/)**  
The purpose of this docker image is to skip ruby installation but have an ability to work with travis cli   

## Info

This docker image contains the following software stack:

- `ruby:alpine` image
- `travis` installed via ruby gem

## Docker image usage

### Pull and tag
```
docker pull skandyla/travis-cli
docker tag skandyla/travis-cli travis-cli
```
  
### Build(optional)
```
docker build -t travis-cli .
```
  
## Travis cli usage
[travis-ci/travis.rb#readme](https://github.com/travis-ci/travis.rb#readme)  


### Encrypting environment variables
```
docker run --rm -v $(PWD):/project travis-cli encrypt SECRET=123 -r org/repo
```

### Validating _.travis.yml_ with travis-lint
```
docker run --rm -v $(PWD):/project --entrypoint=travis-lint travis-cli .travis.yml
```

### run interactively inside the container
```
docker run -it --rm -v $(PWD):/project --entrypoint=/bin/sh travis-cli
```

## License
MIT
