# Jenkins GitHub Webhook Automation

## Prerequisites
- Jenkins server is accessible from GitHub
- GitHub plugin installed in Jenkins
- Multibranch Pipeline job created for your repo

## Automated Setup Steps

1. **Install Required Plugins**
   - Ensure `github` and `git` plugins are listed in `plugins.txt` (already present).

2. **Configure Jenkins Job**
   - Create a Multibranch Pipeline job in Jenkins.
   - Set the repository URL to your GitHub repo.
   - Under "Scan Multibranch Pipeline Triggers", enable "Scan by webhook".

3. **Expose Jenkins Webhook Endpoint**
   - Ensure Jenkins is reachable at `http://<jenkins-server>/github-webhook/` from GitHub.
   - If running locally, use a tool like [ngrok](https://ngrok.com/) to expose Jenkins to the internet:
     ```sh
     ngrok http 8080
     ```
   - Copy the public URL from ngrok and use it for the webhook.

4. **Create GitHub Webhook (Automated via API)**
   - Use GitHub API to create a webhook (replace values as needed):
     ```sh
     curl -u <username>:<token> \
       -X POST \
       -H "Accept: application/vnd.github.v3+json" \
       https://api.github.com/repos/<owner>/<repo>/hooks \
       -d '{
         "name": "web",
         "active": true,
         "events": ["push", "pull_request"],
         "config": {
           "url": "http://<jenkins-server>/github-webhook/",
           "content_type": "json"
         }
       }'
     ```

5. **Test the Integration**
   - Push a commit or open a PR in GitHub.
   - Jenkins should trigger a build automatically.

## Notes
- For production, secure Jenkins and use HTTPS for the webhook endpoint.
- Ensure Jenkins has permissions to access the repo if it is private.
