# Dossier on Railway: the official image plus a start wrapper that turns a plain generated
# DOSSIER_LOGIN_PASSWORD into the argon2id hash Dossier expects in DOSSIER_PASSWORD.
FROM ghcr.io/aientech/dossier:v1.10.0
COPY --chown=node:node railway/railway-start.sh /app/railway-start.sh
USER root
RUN chmod 755 /app/railway-start.sh && apt-get update && apt-get install -y --no-install-recommends gosu \
    && rm -rf /var/lib/apt/lists/*
ENV PORT=3000 HOSTNAME=:: DOSSIER_DATA_DIR=/data
EXPOSE 3000
CMD ["/app/railway-start.sh"]
