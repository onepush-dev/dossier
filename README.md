# Dossier — self-hosted AI job-application workspace (CVs, cover letters, job tracking). Deploy on Railway with one click.

[Dossier](https://github.com/AienTech/dossier) (AGPL-3.0) keeps your CV, tailored cover letters, PDF exports and job applications in one private app. This template runs the official `ghcr.io/aientech/dossier:v1.10.0` image (wrapped as `ghcr.io/onepush-dev/dossier:1.10.0`) with Railway Postgres 18 and a `/data` volume for backups and exports.

## Services
| Service | Image | Port | Volume |
|---|---|---|---|
| Dossier | `ghcr.io/onepush-dev/dossier:1.10.0` | 3000 (public) | `/data` |
| Postgres | `ghcr.io/railwayapp-templates/postgres-ssl:18` | 5432 (private) | `/var/lib/postgresql/data` |

## Sign-in
Dossier wants an argon2id hash in `DOSSIER_PASSWORD`. The wrapper hashes `DOSSIER_LOGIN_PASSWORD` (generated at deploy) at start-up, so you sign in with the value shown in the Dossier service's Variables tab. To set your own, change `DOSSIER_LOGIN_PASSWORD` and redeploy.

## AI provider
The only optional input is `DOSSIER_AI_KEY` (OpenAI, Anthropic or Mistral key; pick with `DOSSIER_AI_PROVIDER`, default `openai`). The app runs without it; AI features need it. You can also enter the key in Settings → AI provider.

## License
Dossier is AGPL-3.0 by AienTech. This repo only holds Railway packaging.
