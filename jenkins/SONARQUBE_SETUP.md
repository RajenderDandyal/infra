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
4. Create a new project and generate a token for Jenkins.
5. Add the token as a Jenkins credential named `sonar-token`.
6. Update `sonar-project.properties` as needed.

## References
- [SonarQube Docs](https://docs.sonarqube.org/)
