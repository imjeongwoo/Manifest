CPU=$1
MEMORY=$2

sed -i -e "s/              memory:/              memory: $MEMORY/g" zeppelin.yaml
sed -i -e "s/              cpu:/              cpu: $CPU/g" zeppelin.yaml

kubectl apply -f ~/script/zeppelin.yaml &&
sed -i -e "s/              memory: $MEMORY/              memory:/g" zeppelin.yaml
sed -i -e "s/              cpu: $CPU/              cpu:/g" zeppelin.yaml
