#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

if ! rails db:version > /dev/null 2>&1; then
  # If not, create the database
  rails db:create
fi

rails db:migrate
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"