# Portfolio Deployment using Docker, Jenkins, Ansible, and AWS EC2

This project demonstrates a CI/CD pipeline that builds and deploys a personal portfolio application using Docker, Jenkins, Ansible, and AWS EC2. The portfolio is packaged into a Docker image using Nginx, pushed to Docker Hub, and then pulled and deployed on an EC2 instance via an Ansible playbook.

---

## Architecture Flow

![image alt](https://github.com/dharaneesh5/DevopsProject/blob/d8c346deaf5b2f0071464805ae00806ac2e47e7e/docker-ansible/project3.png)

---

## Tech Stack

- Jenkins: CI/CD tool used to automate the pipeline
- Docker: Used to containerize the portfolio using Nginx
- Docker Hub: Central repository to store Docker images
- Ansible: Used to configure the remote EC2 instance and deploy the container
- AWS EC2: Hosts the deployed portfolio
- Nginx: Web server to serve the portfolio

---

## Project Workflow

1. Jenkins triggers the pipeline based on GitHub push or manually.
2. Dockerfile builds the Docker image with the portfolio and Nginx.
3. The image is pushed to Docker Hub.
4. Ansible playbook connects to the AWS EC2 Ubuntu instance using an inventory file.
5. Ansible pulls the Docker image from Docker Hub and runs the container on EC2.

---
