# Rails deployed on Heroku Example Application

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Using CockroachDB as part of a Ruby on Rails app is easy. Cockroach Labs maintains the [ActiveRecord Adapter Gem](https://github.com/cockroachdb/activerecord-cockroachdb-adapter), a direct extension of the PostgreSQL adapter. This makes it very straightforward to switch from a default option to CockroachDB. The full instructions are available via [https://www.cockroachlabs.com/blog/how-to-a-complete-web-app-with-rails-and-cockroachdb/](https://www.cockroachlabs.com/blog/how-to-a-complete-web-app-with-rails-and-cockroachdb/).

# Development
```bash
docker-compose build web
docker-compose up
```
Goto http://0.0.0.0:3000

# CockroachDB

```bash
docker-compose up crdb
```
Goto http://0.0.0.0:8080

```bash
docker-compose run crdb bash
>cockroach sql --insecure
>CREATE USER dev;
>CREATE DATABASE dev;
>GRANT ALL ON DATABASE dev TO dev WITH GRANT OPTION;
>SHOW GRANTS ON DATABASE dev;
```
