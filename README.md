# Loomly Backend

Loomly Backend is a **Ruby on Rails (API only)** application that provides the backend for a matching your soulmate app.  
It handles JWT authentication, user registration, profile management, and API documentation via Swagger.

---
## Requirements

- **Ruby**: 3.3.1  
- **Rails**: 8.0.3  
- **PostgreSQL**: >= 14  
- **Redis**: >= 7 (per Sidekiq, cache e lock manager)  
- **Bundler**: >= 2.5
---

## Configuration

Clone repository:

```bash
git clone https://github.com/Malstrom/loomly-backend.git
cd loomly-backend
```

### Configure credentials (JWT example)

```bin/rails credentials:edit```

add

```devise_jwt_secret_key: your-secret-key```

## DB

```
bin/rails db:create
bin/rails db:migrate
```

## Test

```bin/rails test```

## API-Docs

You need first to start server

```rails s```

after you can open in browser:

http://localhost:3000/api-docs

For regenerate api-doc you need to execute:

```
bundle exec rake rswag:specs:swaggerize
```
