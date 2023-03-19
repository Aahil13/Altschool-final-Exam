<img align= "center" alt="Cover image" src="/images/sockshopappcoverimage.JPG">

# Sock Shop Appication

## Overview

Provision this Socks Shop example microservice application [here](https://microservices-demo.github.io/).

## How to use

The microservices sock shop application is a demo project by the weaveworks community. They have all the deployment files, from the Docker file, to Kubernetes and Prometheus.

This folder contains the complete kubernetes deployment file. Running this file creates all the services and deployments for the sock shop application. The deployments and services are created in the `eks` cluster created by `terraform` in the `Todo` app.

You can create this project using:
    ```
        kubectl apply -f kubernetes-deployment.yml
    ```

The live link to the project can be found [here](http://a0b973cb1f7bb41bf8a47842649301e4-1099069357.us-east-1.elb.amazonaws.com/)

## Credits

-  Weaveworks community created the project. The repository of the application can be found [here](https://github.com/microservices-demo/microservices-demo)

