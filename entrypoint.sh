#!/bin/bash
set -e

# SSHサーバーをポート2222で立ち上げる
service ssh start

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# 起動時にマイグレーションを実行
if [[ $RAILS_ENV = 'production' ]]; then
  bin/rails db:migrate
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
