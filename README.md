🚀 Day-1 GKE Implementation Plan

Cloud-Native DevOps Platform Bootstrap

📌 Overview

This document defines the Day-1 implementation plan for bootstrapping a production-ready Google Kubernetes Engine (GKE) platform from scratch.

The goal of Day-1 is to deliver a secure, cost-optimized, CI/CD-ready Kubernetes foundation using Google Cloud Web Console (GUI) and Cloud Shell.

🎯 Day-1 Objectives

Provision a new GCP project and enable required services

Create isolated networking (VPC & subnet)

Configure IAM and service accounts

Bootstrap a private, regional GKE cluster

Prepare core cloud services required for application workloads

Ensure observability is enabled from Day-1

📦 Day-1 Scope
Included

GCP Project & Billing

VPC Networking

IAM & Service Accounts

Artifact Registry

Cloud SQL (Private)

GKE Cluster (Private, Autoscaling)

Kubernetes Baseline (Namespaces & Quotas)

Logging & Monitoring

Excluded

CI/CD pipelines

GitOps tools

Service mesh

Advanced security policies

Multi-region disaster recovery

🏗️ Day-1 Architecture Summary

Region: asia-southeast1 (Singapore)

Cluster Type: GKE Standard (Regional)

Networking: Private VPC

Scaling: Cluster Autoscaler enabled

Security: Private cluster + IAM least privilege

Readiness: CI/CD-ready baseline

1️⃣ Project & API Enablement
Web Console Steps

Create a new GCP project

Attach a billing account

Enable Required APIs

Kubernetes Engine API

Compute Engine API

Artifact Registry API

Cloud SQL Admin API

Cloud Logging API

Cloud Monitoring API

2️⃣ Networking – Custom VPC
Create VPC (Web Console)

Navigate to VPC Network → Create VPC

Select Custom mode

Create subnet:

Region: asia-southeast1

CIDR: 10.10.0.0/16

Private Google Access: Enabled

Firewall Rules

Allow internal traffic (10.10.0.0/16)

Allow Google Load Balancer health checks

3️⃣ IAM & Service Accounts
Create Service Account
sa-gke-node

Assign Minimum Roles

Kubernetes Engine Node Service Account

Artifact Registry Reader

Logging Writer

Monitoring Metric Writer

4️⃣ Artifact Registry
Create Repository (Web Console)

Open Artifact Registry

Create new repository

Configuration:

Format: Docker

Region: asia-southeast1

Repository path example:

asia-southeast1-docker.pkg.dev/<project-id>/app-repo

5️⃣ Cloud SQL (Private Access)
Web Console Steps

Create Cloud SQL instance (MySQL or PostgreSQL)

Disable public IP

Enable private IP

Attach instance to the custom VPC

Enable automated backups

6️⃣ GKE Cluster Creation (Day-1 Baseline)
Cluster Configuration
Setting	Value
Mode	Standard
Location	Regional
Region	asia-southeast1
Network	Custom VPC
Private Cluster	Enabled
Workload Identity	Enabled
Master Authorized Networks	Enabled
Node Pool Configuration

Machine type: e2-standard-4

Min nodes: 0

Max nodes: 3

Autoscaling: Enabled

Auto-repair & auto-upgrade: Enabled

7️⃣ Cloud Shell – Cluster Access
gcloud config set project <project-id>

gcloud container clusters get-credentials <cluster-name> \
  --region asia-southeast1


Verify access:

kubectl get nodes

8️⃣ Kubernetes Day-1 Baseline
Create Namespaces
kubectl create namespace dev
kubectl create namespace uat
kubectl create namespace prod

Apply Resource Quota (Example: prod)
apiVersion: v1
kind: ResourceQuota
metadata:
  name: prod-quota
  namespace: prod
spec:
  hard:
    cpu: "8"
    memory: 16Gi


Apply:

kubectl apply -f prod-quota.yaml

9️⃣ Logging & Monitoring
Enable Observability

Enable Cloud Operations for GKE

Enable Container Insights

Ensure Audit Logs are enabled

No dashboards or alerts configured on Day-1.

✅ Day-1 Completion Checklist

 GCP project created and billed

 Custom VPC and subnet configured

 IAM service accounts applied

 Artifact Registry ready

 Cloud SQL private instance created

 Private GKE cluster running

 Autoscaling enabled

 Namespaces isolated

 Logging and monitoring active

🚦 Day-1 Exit Criteria

Day-1 is complete when:

Developers can deploy workloads to GKE

Platform runs with minimal idle cost

Security baseline is enforced

CI/CD tools can be integrated without infrastructure changes

🔜 Next Phase (Not Included)

Infrastructure as Code (Terraform)

CI/CD pipeline integration

GitOps implementation

Advanced security hardening

High availability and DR

Performance and cost optimization

📌 Author: Zaw_Ye
📆 Phase: Day-1 Platform Bootstrap
☁️ Platform: Google Kubernetes Engine