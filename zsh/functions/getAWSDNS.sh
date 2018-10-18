#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "getAwsDNS <instance-tag-name> <profile>"
    exit
fi

aws ec2 describe-instances --filters Name=tag:Name,Values=$1 --output text --profile $2 | grep ASSOCIATION | head -1 | awk '{print $3}'
