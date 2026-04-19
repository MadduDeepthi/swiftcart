# SwiftCart CI/CD Pipeline (DevOps Assignment)

##  Project Overview

This project demonstrates a simple **CI/CD pipeline** for SwiftCart, a mobile commerce application.

It includes:

* **Backend**: FastAPI (Python)
* **Frontend**: React Native (simulated build)
* **Infrastructure**: AWS (EKS, ECR, VPC) using Terraform
* **Deployment**: Kubernetes with Helm and ArgoCD (GitOps)

The goal is to automate the process from **code commit to deployment**.

---

##  Architecture (Simple View)

1. Developer pushes code to GitHub
2. GitHub Actions runs CI pipeline
3. Docker image is built and pushed to AWS ECR
4. Helm values are updated in Git
5. ArgoCD detects changes and deploys to Kubernetes (EKS)

---

##  CI/CD Pipeline

###  Backend Pipeline

Triggered when backend code changes:

Steps:

1. Checkout code
2. Install dependencies
3. Run tests (pytest)
4. Build Docker image
5. Scan image using Trivy
6. Push image to AWS ECR
7. Update Helm values for **dev environment**
8. ArgoCD automatically deploys to dev

---

###  Frontend Pipeline

* Simulates mobile build process
* Creates a dummy APK file
* Uploads it as an artifact

> Note: Real mobile build tools (Expo/Fastlane) can be added later.

---

##  Environments

| Environment | Deployment Type               |
| ----------- | ----------------------------- |
| Dev         | Automatic (Auto Sync enabled) |
| Staging     | Manual / Controlled           |
| Production  | Manual approval required      |

* **Dev** uses ArgoCD auto-sync
* **Staging & Production** require manual control using **GitHub Environment approval**

---

##  Deployment (GitOps using ArgoCD)

* ArgoCD monitors the Git repository
* Changes in Helm values trigger deployment

Sync strategy:

* Dev → Auto sync enabled
* Staging → Manual sync
* Production → Manual sync

---

##  Helm Features

* Configurable replicas
* Environment variables
* Liveness & readiness probes
* Rolling updates
* Horizontal Pod Autoscaling (HPA)

---

##  Infrastructure (Terraform)

Resources created:

* VPC with public & private subnets
* EKS cluster
* Node groups
* ECR repository
* IAM role for GitHub Actions (OIDC authentication)

---

##  Security

* No hardcoded AWS credentials (OIDC used)
* Docker image scanning using Trivy

---

##  Rollback Strategy

If something goes wrong:

* Revert Helm values in Git → ArgoCD redeploys previous version
* Deploy previous Docker image tag
* Use ArgoCD rollback to previous revision

---

##  How to Run

### 1. Setup Infrastructure

```bash
cd terraform
terraform init
terraform apply
```

### 2. Push Code

* Push changes to GitHub → CI/CD pipeline runs automatically

### 3. Deployment

* ArgoCD syncs and deploys to Kubernetes

---

##  Future Improvements

* Add real unit and integration tests
* Implement real frontend build (Expo/Fastlane)
* Add approval for staging environment
* Add monitoring (Prometheus, Grafana)
* Add automated rollback on failure

---

##  Key Learnings

* CI/CD pipeline design
* Docker and containerization
* Kubernetes deployment using Helm
* GitOps with ArgoCD
* Infrastructure as Code using Terraform
* Secure AWS access using OIDC

---

##  Branching Strategy (Best Practice)

For this assignment, changes were pushed directly to the `main` branch for simplicity.
However, in a real-world scenario, this is **not recommended**.

###  Recommended Workflow

1. **Create a new branch**
```bash
git checkout -b feature/my-change
```

2. **Make changes and commit**
```bash
git add .
git commit -m "Add new feature or fix"
```

3. **Push branch to GitHub**
```bash
git push origin feature/my-change
```

4. **Create Pull Request (PR)**

* Open GitHub repository
* Click "Compare & pull request"
* Add description and request review

5. **Code Review & Approval**

* Team reviews the changes
* Suggestions/changes are applied

6. **Merge to main**

* After approval, merge PR into `main`
* CI/CD pipeline gets triggered

---

###  Why this is important

* Prevents direct changes to production code
* Enables code review and collaboration
* Reduces risk of bugs in main branch
* Maintains clean version history

---


## Notes
This project was implemented as part of a DevOps assignment to demonstrate CI/CD pipeline design and GitOps deployment.
