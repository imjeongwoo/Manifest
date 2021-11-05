#!/bin/bash


# 파일 다운하고 ServiceAccount 부분 지우고
# 클러스터 이름 지정하기
# 그리고 실행

wget -O alb-ingress-controller.yaml https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.1/docs/install/v2_2_1_full.yaml &&
sed -i '546,554d' alb-ingress-controller.yaml &&
echo -n 'EKS 클러스터 이름: ' && read C_NAME
sed -i -e "s/        - --cluster-name=your-cluster-name/        - --cluster-name=$C_NAME/g" alb-ingress-controller.yaml

# 831, 847 번쨰 apiVersion: cert-manager.io/v1alpha2 부분을
# apiVersion: cert-manager.io/v1 으로 교체하고
# kubectl apply -f alb-ingress-controller.yaml
