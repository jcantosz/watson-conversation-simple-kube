# watson-conversation-simple-kube

This repository builds a Docker image containing the IBM Watson [conversation-simple](https://github.com/watson-developer-cloud/conversation-simple) sample which is automatically built and published to [hub.docker.com](https://hub.docker.com/r/adamkingit/watson-conversation-simple-kube/).

It is used in the [Bind a Watson Service to a Kubernetes Pod](https://developer.ibm.com/recipes/tutorials/bind-the-watson-conversation-service-to-a-bluemix-container-service-kubernetes-pod/) recipe.

## Using Drone
To run this repo (or a fork of it) in drone, the some values must be set.
``` bash
# Get code
git clone <repo_name>
cd <repo_name>

# Drone CLI setup
export DRONE_SERVER=<server.address>
export DRONE_TOKEN=<token>

# Add secrets
drone secret add --image=plugins/docker <repo_name> DOCKER_USERNAME <username>
drone secret add --image=plugins/docker <repo_name> DOCKER_PASSWORD <password>

drone secret add --image=jcantosz/k8s <repo_name> BM_ACCT <bluemix_account_number>
drone secret add --image=jcantosz/k8s <repo_name> BM_PASS <bluemix_password>

# Modify .drone.yml
## include your values for username, cluster name, etc

# Sign the yaml
drone sign <repo_name>

#push changes
git add .
git commit -s -a -m "drone build values updated"

```
