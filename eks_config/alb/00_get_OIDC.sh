#!/bin/bash

# eksctl 명령어로 클러스터 생성할때 --with-oidc 옵션을 넣었으면 이미 생성되어있음
# IAM Open ID Connect provider is already associated with cluster "eks-test" in "ap-northeast-2"
# 위와 같은 결과가 나오면 이미 있다

AWS_REGION='ap-northeast-2'
eksctl utils associate-iam-oidc-provider \
    --region ${AWS_REGION} \
    --cluster eks-test \
    --approve

aws eks describe-cluster \
	--name eks-test \
       	--query "cluster.identity.oidc.issuer" \
       	--output text

