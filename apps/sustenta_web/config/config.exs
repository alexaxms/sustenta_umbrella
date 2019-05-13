# Since configuration is shared in umbrella projects, this file
# should only configure the :sustenta_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :sustenta_web,
  ecto_repos: [Sustenta.Repo],
  generators: [context_app: :sustenta]

# Configures the endpoint
config :sustenta_web, SustentaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Uxy1HKa+mF0rL02CugmF/4Pnus0tRDRL+ASQBHnvzvwVjUD1BTZ/cWFr71FXdxPk",
  render_errors: [view: SustentaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SustentaWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Slim extension
config :phoenix_slime, :use_slim_extension, true
config :phoenix, :template_engines,
       slim: PhoenixSlime.Engine,
       slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
