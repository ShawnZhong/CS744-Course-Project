# CS-744-Course-Project

## Heron on Kubernetes

#### Link to docs

https://apache.github.io/incubator-heron/docs/getting-started/

https://github.com/apache/incubator-heron/tree/master/deploy/kubernetes/minikube

#### Link to Heron UI

http://localhost:8001/api/v1/namespaces/default/services/heron-ui:8889/proxy

#### Link to Heron API Server

http://localhost:8001/api/v1/namespaces/default/services/heron-apiserver/proxy/

#### Start proxy

```sh
kubectl proxy -p 8001
```

#### Submit WindowedWordCountTopology

```sh
heron submit kubernetes \
~/.heron/examples/heron-streamlet-examples.jar \
com.twitter.heron.examples.streamlet.WindowedWordCountTopology \
WindowedWordCountTopology
```

## Some useful commands

#### Parallel scp

```sh
pscp -h slaves -O StrictHostKeyChecking=no src /users/szhong
```

#### Parallel ssh

```sh
pssh -i -h slaves -O StrictHostKeyChecking=no cmd
```

