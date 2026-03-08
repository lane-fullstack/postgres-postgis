# PostgreSQL 18 + PostGIS (ARM64 & AMD64)

A lightweight Docker image based on the official **PostgreSQL 18** image with **PostGIS** installed.

This image is designed for modern cloud environments and supports:

- ARM64 (Apple Silicon / Oracle ARM / AWS Graviton)
- AMD64 (Intel / AMD servers)
- GitHub Container Registry (GHCR)
- Docker & Docker Compose deployments

Suitable for projects requiring **geospatial queries**, such as location-based services, maps, and nearby search.

---

# Features

- PostgreSQL 18
- PostGIS 3
- Multi-architecture image (ARM64 + AMD64)
- Automatic build via GitHub Actions
- Lightweight image size
- Easy initialization with extensions

---

# Dockerfile

```dockerfile
FROM postgres:18

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    postgresql-18-postgis-3 \
    postgresql-18-postgis-3-scripts \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 5432

Running with Docker
```bash
docker run -d \
  --name postgres \
  -e POSTGRES_DB=bianmin \
  -e POSTGRES_USER=bianmin \
  -e POSTGRES_PASSWORD=password \
  -p 5432:5432 \
  ghcr.io/lane-fullstack/postgres-postgis:latest

```
 
Running with Docker Compose
```
version: "3"

services:
  postgres:
    image: ghcr.io/lane-fullstack/postgres-postgis:latest
    container_name: postgres
    restart: always
    environment:
      POSTGRES_DB: bianmin
      POSTGRES_USER: bianmin
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql

volumes:
  pgdata:


```