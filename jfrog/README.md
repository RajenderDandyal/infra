# JFrog Artifactory Usage

This folder contains configuration and documentation for storing and retrieving Docker images for Java microservices.

- Update your Jenkins and GitHub Actions pipelines to use the JFrog URL and credentials.
- Images are tagged per environment (dev, qa, prod) and pushed to the `microservices-docker` repository.
- Example image tags: `<JFROG_URL>/microservices:dev`, `<JFROG_URL>/microservices:qa`, `<JFROG_URL>/microservices:prod`
- Ensure your JFrog instance is accessible from your CI/CD runners and Kubernetes cluster.
