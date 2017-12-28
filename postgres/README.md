# PostgreSQL

This is a small test of PostgreSQL 10.1 in a NanoServer container.

```
docker build -t postgres .
docker run postgres postgres --help
docker run postgres psql --help
```

See also discussion in https://github.com/docker-library/postgres/issues/324
