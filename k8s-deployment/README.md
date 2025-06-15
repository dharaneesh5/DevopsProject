# 🕹 Tic Tac Toe Game - Kubernetes Deployment

> 🖼 *Architecture Diagram*

![Architecture Diagram](https://github.com/dharaneesh5/DevopsProject/blob/54944d55e157b22c5ca0d9caa02849b63de6198d/k8s-deployment/Architecture.jpg)

---

## 📖 About This Project

This project demonstrates how to **containerize and deploy a static web-based Tic Tac Toe game** using **Docker, Kubernetes, Ingress**, and **custom DNS (DuckDNS)**.

It offers hands-on experience with:

- Docker image creation and publishing
- Kubernetes deployments, services, and ingress
- Exposing applications to the internet using DNS
- CI/CD-ready architecture for DevOps engineers

---

## 🧩 Tech Stack

| Tool           | Purpose                                 |
|----------------|------------------------------------------|
| HTML/CSS/JS    | Game frontend                           |
| Docker         | Containerization                        |
| Docker Hub     | Image Registry                          |
| Kubernetes     | Orchestration & deployment              |
| Ingress-NGINX  | Expose app via HTTP                     |
| DuckDNS        | Free DNS mapping                        |
| GitHub         | Source code version control             |

---

## 🚀 Project Features

- 🎮 A responsive Tic Tac Toe web app built with pure HTML and JavaScript
- 🐳 Dockerfile to containerize the game
- 📦 Deployment using `kubectl`, `Deployment`, and `Service` YAML files
- 🌐 External access via `Ingress` and `NodePort` service
- 🧭 DNS resolution using **DuckDNS** and access on custom domain
- 🔄 Easily replicable for learning or demonstration purposes

---

## 📁 Folder Structure

.
├── README.md
└── k8s-deployment/
    ├── Dockerfile
    ├── index.html
    ├── deployment.yaml
    ├── service.yaml
    ├── ingress.yaml
    └── Architecture.jpg

---
🌐 TO Access the Application
🔗 http://dharanidevops.duckdns.org:31232


