#!/bin/bash
echo -n 'WorkerSubnets: ' && read workerSubnets
echo -n 'cluster 이름: ' && read cluster
echo -n 'region: ' && read region
echo -n 'k8s-version: ' && read version
echo -n 'node-group: ' && read nodeGroup
echo -n 'node-type: ' && read nodeType
echo -n 'worker-node 개수: ' && read nums
echo -n 'min-node: ' && read MIN
echo -n 'max-node: ' && read MAX

eksctl create cluster \
	--vpc-public-subnets $workerSubnets \
	--name $cluster \
	--region $region \
	--version $version \
	--nodegroup-name $nodeGroup \
	--node-type $nodeType \
	--nodes $nums \
	--nodes-min $MIN \
	--nodes-max $MAX
