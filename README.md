# README

## Run tests

```bash
RAILS_ENV=test rake db:migrate
rspec
```

## Deploy

```bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 225483135113.dkr.ecr.us-west-2.amazonaws.com
docker build --platform linux/amd64 -t recipe_fun .
docker tag recipe_fun:latest 225483135113.dkr.ecr.us-west-2.amazonaws.com/recipe_fun:latest
docker push 225483135113.dkr.ecr.us-west-2.amazonaws.com/recipe_fun:latest
```
