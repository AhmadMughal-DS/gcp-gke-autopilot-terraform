# GCP GKE Autopilot Cluster (Terraform)

> Fully managed Kubernetes on Google Cloud with GKE Autopilot on a VPC-native network — provisioned with Terraform.
> **Author:** Muhammad Ahmad · **IaC:** Terraform · **Cloud:** GCP

![Terraform CI](https://github.com/AhmadMughal-DS/gcp-gke-autopilot-terraform/actions/workflows/terraform.yml/badge.svg)
![Terraform](https://img.shields.io/badge/Terraform-1.6%2B-7B42BC?logo=terraform&logoColor=white)
![Security](https://img.shields.io/badge/scanned-tfsec%20%7C%20checkov-success)
![GCP](https://img.shields.io/badge/GCP-GKE%20Autopilot%20%7C%20VPC-4285F4?logo=googlecloud&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-GKE-326CE5?logo=kubernetes&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📌 Overview

- A custom **VPC** with a subnet that has **secondary ranges** for pods and services (VPC-native).
- A **GKE Autopilot** cluster — Google manages nodes, scaling, and security; you just run workloads and pay per pod.

## 🏗️ Architecture

> 🎨 **Interactive diagram (industry-standard icons):** [open in Lucid — page 21](https://lucid.app/lucidchart/3da75ce3-ea66-4296-81b3-00d20a60435b/edit)

```mermaid
flowchart TB
    Dev([Developer / kubectl])
    subgraph VPC["Custom VPC"]
        Subnet[Subnet + pod/service ranges]
        GKE[GKE Autopilot Cluster]
    end

    Dev -->|kubectl| GKE
    GKE --> Subnet
```

## 🚀 Deploy

```bash
cd terraform
gcloud auth application-default login
terraform init
terraform apply -var="project_id=YOUR_PROJECT_ID"

$(terraform output -raw get_credentials_command)
kubectl get nodes
```

## 🧹 Clean up

```bash
terraform destroy -var="project_id=YOUR_PROJECT_ID"
```

## 💰 Cost note

Autopilot bills for the **pod resources** you run plus a small cluster management fee. No idle node cost.

## 🔐 Production hardening (next steps)

- Make it a **private cluster** with authorized networks.
- Enable **Workload Identity** for GCP IAM access from pods.
- Add **Cloud NAT** for controlled egress.

---

*Built and maintained by **Muhammad Ahmad**.*
