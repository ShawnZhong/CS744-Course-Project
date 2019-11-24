# CS-744-Course-Project

## Heron

#### Link to Heron UI

http://localhost:8001/api/v1/namespaces/default/services/heron-ui:8889/proxy

#### Link to Heron API Server

http://localhost:8001/api/v1/namespaces/default/services/heron-apiserver/proxy/

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

