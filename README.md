# README

## Prerequisite

- [Ruby 3](https://www.ruby-lang.org/en/)
- [Ruby on Rails 7](https://rubyonrails.org/)
- [Postgres 15](https://postgresapp.com/)

## Run tests

```bash
rails db:create
RAILS_ENV=test rails db:migrate
rspec
```

## Deploy

```bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 225483135113.dkr.ecr.us-west-2.amazonaws.com
docker build --platform linux/amd64 -t recipe_fun .
docker tag recipe_fun:latest 225483135113.dkr.ecr.us-west-2.amazonaws.com/recipe_fun:latest
docker push 225483135113.dkr.ecr.us-west-2.amazonaws.com/recipe_fun:latest
```

## References

### Used programming languages and frameworks

- [Ruby 3](https://www.ruby-lang.org/)
- [Ruby on Rails 7](https://rubyonrails.org/)
- [PostgreSQL 15](https://www.postgresql.org/)
- [HTML5](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
- [SCSS](https://sass-lang.com/)
- [Docker](https://www.docker.com/)
- [Bootstrap](https://getbootstrap.com/)
- [Font Awesome](https://fontawesome.com/)

### Testing frameworks

- [RSpec](https://rspec.info/)
- [Shoulda Matchers](https://matchers.shoulda.io/)

### Used cloud services

- [AWS App Runner](https://aws.amazon.com/apprunner/)
- [AWS S3](https://aws.amazon.com/s3/)
- [AWS ECR](https://aws.amazon.com/ecr/)
- [AWS RDS](https://aws.amazon.com/rds/)
