# Master setup

* install k3s
curl -sfL https://get.k3s.io | sh -


* get token
sudo cat /var/lib/rancher/k3s/server/node-token

* install dashboard (create dashboard.yml file on master before)
sudo kubectl create -f dashboard.yml

sudo kubectl -n kubernetes-dashboard describe secret admin-user-token | grep ^token




# Worker setup

curl -sfL https://get.k3s.io | K3S_URL=https://<master-host>:6443
K3S_TOKEN=<node-token> sh -

# System Administrator setup

- Copy the content of the master node `/etc/rancher/k3s/k3s.yaml` to your
  `~/.kube/cluster` and replace localhost by the master node ip on your network.



Sources 

https://blog.tekspace.io/deploying-kubernetes-dashboard-in-k3s-cluster/


Helpers

Edit service
sudo k3s kubectl edit svc kubernetes-dashboard -n kubernetes-dashboard