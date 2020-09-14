To Install K8s on local using Vagrant & VirtualBox

**Disbale swap**

```
sudo swapoff -a
```

(comment the swap in fstab)
```
sudo vi /etc/fstab
```

**Add docker repo**

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

**add kubernetes repo**

```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```

```
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

**install docker, kubeadmin, kubelet, kubectl**

```
sudo apt-get update
```
*(check for docker - https://docs.docker.com/engine/install/ubuntu/#set-up-the-repository)*

```
sudo apt-get install docker.io
docker version
sudo systemctl enable docker
sudo systemctl status docker
sudo systemctl start docker
```

```
sudo apt-get install kubeadm kubelet kubectl
```

*Alternative command*
```
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.14.5-00 kubeadm=1.14.5-00 kubectl=1.14.5-00
```

**Hold updates**
```
sudo apt-mark hold docker-ce kubeadm kubelet kubectl
```

**Enable iptables bridge**
```
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo modprobe br_netfilter
sudo sysctl -p
```

**Run on master**
```
sudo vi /proc/sys/net/ipv4/ip_forward
(Change from 0 to 1) 
```

*install jq if needed*
```
sudo wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && mv jq-linux64 /usr/bin/jq && chmod +x /usr/bin/jq
```


```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.56.30
```
*(--ignore-preflight-errors=NumCPU is required if CPU is low)*

Above code will give a toke that can be used by other nodes to join.  somehting like below:

*kubeadm join 192.168.56.30:6443 --token z21jg3.al7rkqpfch0dnade \
    --discovery-token-ca-cert-hash sha256:9016b5d1a9ee377c3a8302657d2ef32f89f66313295a3e1ff650789153aa4c1c*

**Set up local kubeconfig:**

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

**Install Flannel networking:**

```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

```
Note: If you are using Kubernetes 1.16 or later, use below

```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/3f7d3e6c24f641e7ff557ebcea1136fdf4b1b6a1/Documentation/kube-flannel.yml
```

run the join commmand in each node and verify
```
kubectl get nodes
```

