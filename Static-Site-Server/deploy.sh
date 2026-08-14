#!/bin/bash

rsync -avz -e "ssh -i ~/.ssh/aws-learning-key.pem" \
  ./ ec2-user@13.48.25.254:/var/www/Kasper/

