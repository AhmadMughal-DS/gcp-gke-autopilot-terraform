# Architecture Diagram — GCP GKE Autopilot

## Lucid diagram

- **Master Lucid document (all 30 diagrams, icon style):** https://lucid.app/lucidchart/3da75ce3-ea66-4296-81b3-00d20a60435b/edit
- This project is **page 21** of that document.

## Lucid prompt (reusable)

```
Create a GCP architecture diagram titled "GCP GKE Autopilot Cluster".
A Developer uses kubectl against a GKE Autopilot Cluster that runs inside a custom VPC
with a subnet that has secondary ranges for pods and services. Label the arrows.
Clean, professional Google Cloud colors.
```

## Mermaid source

```mermaid
flowchart TB
    Dev([Developer / kubectl])
    Subnet[Subnet + pod/service ranges]
    GKE[GKE Autopilot Cluster]
    Dev -->|kubectl| GKE
    GKE --> Subnet
```
