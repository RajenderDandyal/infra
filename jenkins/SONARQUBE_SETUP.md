# SonarQube Setup

## Prerequisites
- Docker installed (for local setup)
- PostgreSQL database

## Steps
1. Start SonarQube and PostgreSQL using `docker-compose.yml` in the `jenkins` folder:
   ```sh
   docker-compose up -d sonarqube db
   ```
2. Access SonarQube at `http://localhost:9000`.
3. Log in (default admin/admin), change password.
4. Create a new project for each NX React app (or use monorepo scanning).
5. Generate a token for Jenkins and add as a credential named `sonar-token`.
6. For NX monorepo, configure SonarQube scanning in each app's `project.json` or use a root-level config.
7. Update `sonar-project.properties` as needed for each app or the monorepo.

## References
- [SonarQube Docs](https://docs.sonarqube.org/)
