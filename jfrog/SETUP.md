# JFrog Artifactory Setup

## Prerequisites
- JFrog Artifactory instance (cloud or self-hosted)
- Admin access to create repositories and users

## Steps
1. Create a Docker repository named `microservices-docker`.
2. Generate user credentials for CI/CD (Jenkins/GitHub Actions).
3. Update Jenkins and GitHub Actions secrets with JFrog URL, user, and password.
4. Ensure your Kubernetes cluster can pull images from JFrog (network/firewall settings).
5. Replace `<JFROG_URL>` in manifests and pipelines with your actual JFrog URL.

## References
- [JFrog Docs](https://www.jfrog.com/confluence/)
