# JFrog Artifactory Setup

## Prerequisites
- JFrog Artifactory instance (cloud or self-hosted)
- Admin access to create repositories and users

## Steps
1. Create Docker repositories named `microservices-docker` and `nx-react`.
2. Generate user credentials for CI/CD (Jenkins).
3. Update Jenkins secrets with JFrog URL, user, and password.
4. Ensure your Kubernetes cluster can pull images from JFrog (network/firewall settings).
5. Replace `<JFROG_URL>` in manifests and pipelines with your actual JFrog URL.
6. For NX React monorepo, push images to `nx-react` repository using the Jenkinsfile.nx-react pipeline.

## References
- [JFrog Docs](https://www.jfrog.com/confluence/)
