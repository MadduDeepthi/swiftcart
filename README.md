# SwiftCart DevOps Project

## Stack
- FastAPI
- Docker
- Kubernetes (EKS)
- Terraform
- GitHub Actions
- Argo CD

## Flow
1. Push code
2. CI builds Docker image
3. Image pushed to ECR
4. Helm updated
5. Argo CD deploys to EKS

## Features
- GitOps deployment
- Auto versioning
- Security scan (Trivy)
- OIDC authentication