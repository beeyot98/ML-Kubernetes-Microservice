[![CircleCI](https://dl.circleci.com/status-badge/img/gh/beeyot98/project-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/beeyot98/project-ml-microservice-kubernetes/tree/main)

## Project Overview

In this project, I applied the skills acquired to operationalize a Machine Learning Microservice API. 

Given is a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.More about the data, which was initially taken from Kaggle, can be found on [the data source site](https://www.kaggle.com/c/boston-housing). This project showcases my ability to operationalize a Python flask app—in the file `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

The project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project I:
* Tested the project code using linting
* Completed a Dockerfile to containerize this application
* Deployed the containerized application using Docker and made a prediction
* Improved the log statements in the source code for this application
* Configured Kubernetes and created a Kubernetes cluster
* Deployed a container using Kubernetes and made a prediction
* Integrated it with CircleCI to indicate that the code has been tested


---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# Make sure Python 3.7 is available in the host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
1. Create a free docker account, choose a unique username and link your email to a docker account. The username is the unique docker ID.
2. Go to Docker's installation site on https://docs.docker.com/v17.12/install/, and choose the Community Edition (CE) for your operating system to install Docker's latest version (recommended).
3. Verify the installation by printing docker version on your terminal by typing:
`docker --version1

* Setup and Configure Kubernetes locally 
1. Download a virtual machine.
For Mac OS:
`brew cask install virtualbox`

2. Install Minikube. Thorough instructions here at https://kubernetes.io/docs/tasks/tools/install-minikube/.
For Mac OS:
`brew cask install minikube`

3. To start a local cluster, type the terminal command:
`minikube start`
4. You can check that you have one cluster running by typing:
`kubectl config view`

* Create Flask app in Container
1. Build the docker image from the Dockerfile; use the optional --tag parameter as described in the build documentation.
2. List the created docker images.
3. Run the containerized Flask app; publish the container’s port to a host port.

* Run via kubectl
1. Define a dockerpath which will be “/path”, this should be the same name as your uploaded repository
2. Run the docker container with `kubectl create deploy`; you’ll have to specify the container and the port
3. List the kubernetes pods with `kubectl get pods`
4. Forward the container port to a host port, using the same ports as before


### Repository Files
* Dockerfile creates a working directory, install dependencies, exposes port 80 and runs the application at container launch
* run_docker.sh contains steps that build, list and runs the image
* upload_docker.sh contains steps that upload the image to Docker Hub on the personal Docker ID
* run_kubernetes.sh contains steps run a docker image with kubernetes, lists the kubernetes pod, and forwards the container port to a host
* docker_out.txt contains saved log outputs of the application after prediction is made
* kubernetes_out.txt contains output after prediction is made
* config.yml inside the .cicrcleci folder, contains steps that check the project for errors
