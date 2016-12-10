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

### Pull and tag (optional)
```
docker pull skandyla/travis-cli
docker tag skandyla/travis-cli travis-cli
```

### Build on your own (optional)
```
docker build -t travis-cli .
```

## Travis cli usage
[travis-ci/travis.rb#readme](https://github.com/travis-ci/travis.rb#readme)  


### Running simple travis commands:
```
docker run -v $(PWD):/project --rm skandyla/travis-cli lint .travis.yml
docker run -v $(PWD):/project --rm skandyla/travis-cli status
```

### Working with travis commands, that require authentication:
1. first, change your working dir to the github repo you are working on:  
`cd your_git_project_dir`  

2. login interactively inside the container:  
`docker run -it --rm -v $(PWD):/project --entrypoint=/bin/sh skandyla/travis-cli`  

3. login to travis:  
`/project # travis login --org --github-token xxxxxxxxxxxxxxxxx`  
For generating github token see [personal-api-tokens](https://github.com/blog/1509-personal-api-tokens) and required permissions for them: [github-oauth-scopes](https://docs.travis-ci.com/user/github-oauth-scopes/)  

4. work like authenticated user with your current repository:
```
/project # travis whoami
/project # travis env set DOCKER_EMAIL mymail@example.com
```


## License
MIT
