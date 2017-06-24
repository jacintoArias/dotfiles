#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "getAwsDNS <instance-tag-name>"
    exit
fi

aws ec2 describe-instances --filters Name=tag:Name,Values=$1 --output text | grep ASSOCIATION | head -1 | awk '{print $3}'
