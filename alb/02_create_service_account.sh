#!/bin/bash
echo '==== 02_CREATE SERVICE ACCOUNT ===='
echo -n 'EKS 클러스터 이름: ' && read C_NAME

NG_ROLE=`kubectl -n kube-system describe configmap aws-auth | grep rolearn`
ACCOUNT_ID=${NG_ROLE:24:12}

eksctl create iamserviceaccount \
    --cluster $C_NAME \
    --namespace kube-system \
    --name aws-load-balancer-controller \
    --attach-policy-arn arn:aws:iam::$ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve


echo '=== 02_GET SERVICE ACCOUNT ==='
echo '생성이 완료되었으면 출력이 된다'

kubectl get sa aws-load-balancer-controller -n kube-system -o yaml
