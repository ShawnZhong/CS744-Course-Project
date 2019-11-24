#### Parallel scp

```sh
pscp -h slaves -O StrictHostKeyChecking=no src /users/szhong
```



#### Parallel ssh

```sh
pssh -i -h slaves -O StrictHostKeyChecking=no cmd
```

