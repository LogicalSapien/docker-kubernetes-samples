#!/usr/bin/env bash

sudo swapoff -a

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update    


# sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.14.5-00 kubeadm=1.14.5-00 kubectl=1.14.5-00    

sudo apt-get install -y kubelet=1.14.5-00 kubeadm=1.14.5-00 kubectl=1.14.5-00    

# sudo apt-get install -y kubelet=1.14.5-00 kubeadm=1.14.5-00 kubectl=1.14.5-00    

# since windows virtual box has some issues, might need to insstall docker manullay

sudo apt-mark hold docker-ce kubeadm kubelet kubectl

echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo modprobe br_netfilter
sudo sysctl -p

sudo wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && sudo mv jq-linux64 /usr/bin/jq && sudo chmod +x /usr/bin/jq
