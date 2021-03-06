#!/bin/sh
curl https://cli-assets.heroku.com/install.sh | sh
heroku plugins:install @heroku-cli/plugin-container-registry
docker login -u _ --password=$HEROKU_API_KEY registry.heroku.com
heroku container:login
heroku container:push web --app $HEROKU_APP_NAME
heroku container:release web --app $HEROKU_APP_NAME