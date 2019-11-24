# CS-744-Course-Project

## Heron

#### Kill a topology

```sh
heron kill kubernetes WindowedWordCountTopology
```


## Heron on Kubernetes

#### Reset Kubernetes

```sh
kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all --grace-period=0 --force
```

#### Link to docs

https://apache.github.io/incubator-heron/docs/operators/deployment/schedulers/kubernetes/

https://github.com/apache/incubator-heron/tree/master/deploy/kubernetes/general

#### Helm Deployment

```sh
helm init

helm repo add heron-charts https://storage.googleapis.com/heron-charts

kubectl create serviceaccount tiller \
--namespace kube-system \

kubectl create clusterrolebinding tiller-cluster-rule \
--clusterrole cluster-admin \
--serviceaccount kube-system:tiller

kubectl patch deploy tiller-deploy \
--namespace kube-system \
--patch '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

helm install heron-charts/heron \
--set platform=gke \
--name kubernetes \
--values https://raw.githubusercontent.com/apache/incubator-heron/master/deploy/kubernetes/gke/small.yaml
```

#### Start proxy

```sh
kubectl proxy -p 8001
```


#### Link to Heron tracker

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-tracker:8888/proxy/topologies

#### Link to Heron UI

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-ui:8889/proxy

#### Link to Heron API Server

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-apiserver:9000/proxy/

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-apiserver:9000/proxy/api/v1/version


#### Set Service URL

```sh
heron config kubernetes \
set service_url http://localhost:8001/api/v1/namespaces/default/services/kubernetes-apiserver:9000/proxy
```


#### Submit Topology

```sh
heron submit kubernetes \
~/.heron/examples/heron-streamlet-examples.jar \
com.twitter.heron.examples.streamlet.WindowedWordCountTopology \
WindowedWordCountTopology
```

```sh
heron submit kubernetes ~/.heron/examples/heron-api-examples.jar \
com.twitter.heron.examples.api.AckingTopology acking
```

#### Manual Deployment

```sh
kubectl create -f https://raw.githubusercontent.com/apache/incubator-heron/master/deploy/kubernetes/general/zookeeper.yaml

kubectl create -f https://raw.githubusercontent.com/apache/incubator-heron/master/deploy/kubernetes/general/bookkeeper.yaml

kubectl create -f https://raw.githubusercontent.com/apache/incubator-heron/master/deploy/kubernetes/general/tools.yaml

kubectl create -f https://raw.githubusercontent.com/ShawnZhong/incubator-heron/master/deploy/kubernetes/general/apiserver.yaml
```

## SSH commands

#### Parallel scp

```sh
pscp -h slaves -O StrictHostKeyChecking=no src /users/szhong
```

#### Parallel ssh

```sh
pssh -i -h slaves -O StrictHostKeyChecking=no cmd
```

