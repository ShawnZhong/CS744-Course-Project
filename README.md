# CS-744-Course-Project

## Documents

Paper: https://www.overleaf.com/read/qfvgwpjvvcbh

Poster: https://github.com/ShawnZhong/CS-744-Course-Project/blob/master/Poster.pdf


## SSH commands

##### Parallel scp

```sh
pscp -h slaves -O StrictHostKeyChecking=no src /users/szhong
```

##### Parallel ssh

```sh
pssh -i -h slaves -O StrictHostKeyChecking=no cmd
```

## Kubernetes

##### Reset Kubernetes

```sh
kubectl delete daemonsets,replicasets,services,deployments,pods,rc --all --grace-period=0 --force
```

##### Kill a topology

```sh
heron kill kubernetes WindowedWordCountTopology
```

##### Start proxy

```sh
kubectl proxy -p 8001
```

## Helm

##### Init

```sh
helm init

kubectl create serviceaccount tiller \
--namespace kube-system \

kubectl create clusterrolebinding tiller-cluster-rule \
--clusterrole cluster-admin \
--serviceaccount kube-system:tiller

kubectl patch deploy tiller-deploy \
--namespace kube-system \
--patch '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

## Flink

https://github.com/docker-flink/examples

```sh
helm package helm/flink/
helm install --name flink --set flink.num_taskmanagers=5 flink*.tgz
```

## Spark 

```sh
helm install --name spark stable/spark
```

## Kafka 
```sh
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm install --name my-kafka incubator/kafka
```

## Heron

##### Links to docs

https://apache.github.io/incubator-heron/docs/operators/deployment/schedulers/kubernetes/

https://github.com/apache/incubator-heron/tree/master/deploy/kubernetes/general

##### Helm

```sh
helm repo add heron-charts https://storage.googleapis.com/heron-charts

helm install heron-charts/heron \
--set platform=gke \
--name kubernetes \
--values https://raw.githubusercontent.com/apache/incubator-heron/master/deploy/kubernetes/gke/small.yaml
```

##### Link to Heron tracker

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-tracker:8888/proxy/topologies

##### Link to Heron UI

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-ui:8889/proxy

##### Link to Heron API Server

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-apiserver:9000/proxy/

http://localhost:8001/api/v1/namespaces/default/services/kubernetes-apiserver:9000/proxy/api/v1/version


##### Set Service URL

```sh
heron config kubernetes \
set service_url http://localhost:8001/api/v1/namespaces/default/services/kubernetes-apiserver:9000/proxy
```


##### Submit Topology

```sh
heron submit kubernetes \
~/.heron/examples/heron-streamlet-examples.jar \
com.twitter.heron.examples.streamlet.WindowedWordCountTopology \
wwc
```

```sh
heron submit kubernetes ~/.heron/examples/heron-api-examples.jar \
com.twitter.heron.examples.api.AckingTopology acking
```
