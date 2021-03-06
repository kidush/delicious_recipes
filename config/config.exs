# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :delicious_recipes, DeliciousRecipes.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "L9oW97mQZL5NdfgFINwloD5tUB5yYkwQmD6xuT264sIXoYrBATbWHMoR3ngI2sbb",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: DeliciousRecipes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Config Guardian
config :guardian, Guardian,
  issuer: "DeliciousRecipes",
  ttl: {30, :days},
  secret_key: "8VXpYvF/wNii4SfumbHoBeOEtJfS9dF4xwGjj5z/Oew4b0Y6GX3CmdW/42VLLEAR",
  serializer: DeliciousRecipes.GuardianSerializer
