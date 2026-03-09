# Security & Compliance Posture (Expensy)

## 1. IAM (Identity & Access Management)
- We enforce Azure Role-Based Access Control (RBAC) to manage access to the AKS cluster.
- The CI/CD pipeline operates without root credentials; it uses an Azure Service Principal provisioned with least-privilege access (Contributor role).

## 2. Network Security
- Inbound traffic is strictly controlled. Only the NGINX Ingress Controller is exposed to the public internet (Ports 80/443).
- Internal communication between the Frontend, Backend, MongoDB, and Redis Pods is routed via isolated ClusterIPs, completely hidden from external networks.

## 3. Secrets Management
- Absolutely no passwords or connection strings are hardcoded into the source code or repository.
- We utilize `Kubernetes Secrets` (Opaque) to securely inject sensitive variables (e.g., MongoDB URIs and Redis passwords) into the containers at runtime.

## 4. Compliance (GDPR)
- All user data (MongoDB) is hosted within an Azure cluster located in the `West Europe` region.
- This architectural decision ensures that all data remains within the European Economic Area, strictly complying with the data residency and sovereignty requirements of the General Data Protection Regulation (GDPR).