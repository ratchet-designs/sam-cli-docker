#!/bin/bash

aws_cli_version='1.19.12'
sam_cli_version='1.18.2'
docker build . --build-arg "SAM_VERSION=${sam_cli_version}" --build-arg "AWS_CLI_VERSION=${aws_cli_version}" -t "ratchetdesigns/sam-cli:${sam_cli_version}"
