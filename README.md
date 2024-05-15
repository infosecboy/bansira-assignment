## Introduction
This is the repo to deploy the https://github.com/johnpapa/node-hello on a kubernetes cluster using ArgoCD for GitOps management. The image is built using Github actions and deployed on dockerhub for use.

## Prerequisite
    1. You should have a kubernetes cluster ready
    2. Only for deploying image to dockerhub - You should have a github repository and dockerhub account.

## Steps to build and push the image to dockerhub using Github Actions
    1. git clone https://github.com/infosecboy/bansira-assignment.git
    2. cd bansira-assignment
    3. rm -rf .git
    4. Sign in to your dockerhub and create a public repository with name bansira-assignment or anything else
    5. In the settings of dockerhub account generate an access token
    6. In the repo secrets in github create a secret with name DOCKERHUB_USERNAME with value set to your username and DOCKERHUB_TOKEN with value set to your password.
    7. Now the Github actions file is already there for deploying the image on a dockerhub repository. In the .github/workflows/docker-image.yaml file. This file will deploy your image to your docker repository. If you have not created your docker repository with name bansira-assignment then change it to your repository in tag under step Build and push Docker image.
    
    Once you push the code to your repository the github actions worklfow will run and will deploy the image to your dockerhub repository

## Steps to deploy the node app using the repository in kubernetes cluster
    1. git clone https://github.com/infosecboy/bansira-assignment.git
    2. cd bansira-assignment
    3. To Install ArgoCD run the following commands
      1. kubectl create namespace argocd
      2. kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
      
      Note: The installation is taken from the official documentaton of ArgoCD https://argo-cd.readthedocs.io/en/stable/getting_started/
    
    4. kubectl apply -f node-hello-argocd.yaml
    5. Now retrieve the initial password for ArgoCD using kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
    6. Run kubectl port-forward svc/argocd-server -n argocd 8080:443 to see the UI on https://localhost:8080
    7. You will see the application being deployed on the UI


