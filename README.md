# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Deploy

```bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 225483135113.dkr.ecr.us-west-2.amazonaws.com
docker build --platform linux/amd64 -t recipe_fun .
docker tag recipe_fun:latest 225483135113.dkr.ecr.us-west-2.amazonaws.com/recipe_fun:latest
docker push 225483135113.dkr.ecr.us-west-2.amazonaws.com/recipe_fun:latest
```