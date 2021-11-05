#!/bin/bash
#echo -n 'WorkerSubnets: ' && read workerSubnets
echo -n 'cluster 이름: ' && read cluster
echo -n 'region: ' && read region
echo -n 'k8s-version: ' && read version
echo -n 'node-group: ' && read nodeGroup
echo -n 'node-type: ' && read nodeType
echo -n 'worker-node 개수: ' && read nums
echo -n 'node-volume-size: ' && read VOLUME_SIZE
echo -n 'ssh-public-key: ' && read PUBLIC_KEY
#echo -n 'min-node: ' && read MIN
#echo -n 'max-node: ' && read MAX

eksctl create cluster \
	--name $cluster \
	--region $region \
	--version $version \
	--nodegroup-name $nodeGroup \
	--node-type $nodeType \
	--nodes $nums \
	--node-volume-size $VOLUME_SIZE \
	--ssh-public-key $PUBLIC_KEY \
	--with-oidc \
	--node-private-networking \
	--ssh-access \
	--managed
