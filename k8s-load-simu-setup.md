# k8s-loader-cluster-setup

* Launch a kubernetes cluster that will host the application simulation. We use Amazon EKS using `eksctl`. 

```sh
eksctl create cluster -f eks-cluster-spec.yaml
```
Few assumptions: we use Spot instances to minimize the cost of compute. Note that the notations:

```yaml
...
  - name: spot
    labels:
      project: pgBufferContentLWLocks
      lifecycle: Ec2Spot
      aws.amazon.com/spot: "true"
    maxSize: 100
    minSize: 10
    ssh:
      allow: true
      publicKeyPath: ~/.ssh/id_rsa.pub
    instancesDistribution:
      instanceTypes: ["m5dn.4xlarge","c5a.4xlarge","r5b.4xlarge","r4.4xlarge","r5dn.4xlarge","r5.4xlarge","r5ad.4xlarge","r5n.4xlarge","c5.4xlarge","c5d.4xlarge","m5.4xlarge","m5a.4xlarge","m5n.4xlarge","c4.4xlarge","c3.4xlarge"]
      onDemandPercentageAboveBaseCapacity: 0
      onDemandBaseCapacity: 0
      spotAllocationStrategy: "capacity-optimized"
    taints:
      spotInstance: "true:PreferNoSchedule"
    tags:
      k8s.io/cluster-autoscaler/node-template/label/lifecycle: Ec2Spot
      k8s.io/cluster-autoscaler/node-template/label/project: pgBufferContentLWLocks
      k8s.io/cluster-autoscaler/node-template/taint/spotInstance: "true:PreferNoSchedule"
      k8s.io/cluster-autoscaler/node-template/label/aws.amazon.com/spot: "true"
...
```


* Deploy pgbouncer as follow:

Create secret that includes the DB creds. Populate the .secrets file e.g., `db-10-14-uuid-creds.secrets` and execute `pgbouncer-create-secrets`.
This step will create k8s secret that the simulation code and pgbouncer can use to connect the db. 

Create a network load balancer instance for hosting the pgbouncer k8s service. `kubectl apply -f pgbouncer-svc.yaml`

Deploy the pgbouncer k8s deploymnet. `kubectl apply -f pgbouncer-deploy.yaml`
Note: the `app` label set in the deployment spec (pgbouncer-deploy.yaml) must match the k8s service `selector` in case you wish to change the pgbouncer name. e.g., `pgbouncer-db-10-14-uuid` in our example.  

Configure the pgbouncer endpoint host in `bulk-inserts.yaml` under `DBHOST`

* Deploy bulk-inserts. `kubectl apply -f bulk-inserts.yaml`

Watch the DB size with `\dt+` or the logs 

```sh
kubectl logs `kubectl get po | grep bulk-inserts|awk '{print $1}'`
```

If all works well, scale the pgbouncer to accomodate the full simulation workload 

```sh
kubectl scale deploy `kubectl get deploy | grep pgbouncer-db-10-14-uuid | awk '{print $1}'` --replicas=20
```

* Deploy vacuum job to prevent wraparound

Create SQS queue to store pending orders. Populate the env variable `QUEUE_URL` in `app-insert.yaml` and `app-update.yaml`

* Deploy the Orders application simulator `kubectl apply -f app-insert.yaml` and `kubectl apply -f app-update.yaml`
