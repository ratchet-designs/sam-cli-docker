# AWS SAM CLI in docker

[AWS SAM](https://github.com/awslabs/serverless-application-model) CLI.

## Running

Use the following volumes:
 - /home/node/work should be mounted with your working directory
 - /home/node/.aws should be mounted with your aws creds

By default, we run with uid of 1000. Change the user if you are not uid 1000.

```
docker run --rm -v "${HOME}/.aws:/home/node/.aws:ro" -v "$(pwd):/home/node/work" ratchetdesigns/sam-cli:1.18.2 <sam arguments>
```

## Building

Choose the version of the [SAM CLI](https://github.com/aws/aws-sam-cli/releases) and the [AWS CLI](https://github.com/aws/aws-cli/releases) you want from pip and set the versions in `build.sh`.

```
./build.sh
```
