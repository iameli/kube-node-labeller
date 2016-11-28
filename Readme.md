kube-node-labeller
==================

Very basic Kubernetes service, intended to be run as a DaemonSet, that copies the labels from an
EC2 instance to the cooresponding labels of its Kubernetes node.

Usage:

```
> kubectl create -f kube-node-labeller.yaml
```

Results:

```
> kubectl get nodes -o json | jq '.items[].metadata.labels'
{
  "Environment": "cluster-name.example.com",
  "KubernetesCluster": "cluster-name",
  "Name": "cluster-name-kube-aws-controller",
  "aws-autoscaling-groupName": "cluster-name-AutoScaleController-19K49D9QJI1R3",
  "aws-cloudformation-logical-id": "AutoScaleController",
  "aws-cloudformation-stack-id": "arn-aws-cloudformation-us-west-2-051932472482-stack-cluster-name-08",
  "aws-cloudformation-stack-name": "cluster-name",
  "beta.kubernetes.io/arch": "amd64",
  "beta.kubernetes.io/instance-type": "t2.small",
  "beta.kubernetes.io/os": "linux",
  "failure-domain.beta.kubernetes.io/region": "us-west-2",
  "failure-domain.beta.kubernetes.io/zone": "us-west-2b",
  "kubernetes.io/hostname": "ip-10-0-0-216.us-west-2.compute.internal"
}
{
  "Environment": "cluster-name.example.com",
  "KubernetesCluster": "cluster-name",
  "Name": "cluster-name-kube-aws-worker",
  "aws-autoscaling-groupName": "cluster-name-AutoScaleWorker-SII0CUIA8CD6",
  "aws-cloudformation-logical-id": "AutoScaleWorker",
  "aws-cloudformation-stack-id": "arn-aws-cloudformation-us-west-2-051932472482-stack-cluster-name-08",
  "aws-cloudformation-stack-name": "cluster-name",
  "beta.kubernetes.io/arch": "amd64",
  "beta.kubernetes.io/instance-type": "c4.2xlarge",
  "beta.kubernetes.io/os": "linux",
  "failure-domain.beta.kubernetes.io/region": "us-west-2",
  "failure-domain.beta.kubernetes.io/zone": "us-west-2b",
  "kubernetes.io/hostname": "ip-10-0-0-223.us-west-2.compute.internal"
}
{
  "Environment": "cluster-name.example.com",
  "KubernetesCluster": "cluster-name",
  "Name": "cluster-name-kube-aws-worker",
  "aws-autoscaling-groupName": "cluster-name-AutoScaleWorker-SII0CUIA8CD6",
  "aws-cloudformation-logical-id": "AutoScaleWorker",
  "aws-cloudformation-stack-id": "arn-aws-cloudformation-us-west-2-051932472482-stack-cluster-name-08",
  "aws-cloudformation-stack-name": "cluster-name",
  "beta.kubernetes.io/arch": "amd64",
  "beta.kubernetes.io/instance-type": "c4.2xlarge",
  "beta.kubernetes.io/os": "linux",
  "failure-domain.beta.kubernetes.io/region": "us-west-2",
  "failure-domain.beta.kubernetes.io/zone": "us-west-2b",
  "kubernetes.io/hostname": "ip-10-0-0-233.us-west-2.compute.internal"
}
```
