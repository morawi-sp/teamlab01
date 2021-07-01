#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

## Installing the 'minikube component' for the representing 'K8S' on a small environment that is portable.
## Please pay attention to the versions of the OS and software as we have only tested on these listed ones.


wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod 755 /usr/local/bin/minikube
minikube version


## configure the minikube driver to be 'KVM' this is a compatibility requirement with 'ISTIO'

minikube config set driver kvm2


## One might encounter issues here, I did and it was due to issues with the way KVM components access persmissions need to be setup.



## Use 'minikube tunnel' to have access to the services from within the vm that runs the environment.
## Make sure the one below is on a separate terminal as the terminal will lock.


minikube tunnel


# Open a new treminal here.

# Be careful with the amount of assigned ram, making sure that it would not deprive the laptop/work station from operational memory.This example assume total memory ram = 16 thus 10 given to vm and 7GB given to minikube.

sudo minikube start --driver=kvm2 --memory=10384 --cpus=4 --kubernetes-version=v1.20.2

# Create and expos 1st application example:


kubectl create deployment hello-minikube1 --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube1 --type=LoadBalancer --port=8080

# Copy istio components to the location from which they will be installed and the lab activity code would be based:

cp istio-1.10.2.zip /home/vgrant/istio-1.10.2.zip




