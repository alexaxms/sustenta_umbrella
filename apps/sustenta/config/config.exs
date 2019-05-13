# Since configuration is shared in umbrella projects, this file
# should only configure the :sustenta application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :sustenta,
  ecto_repos: [Sustenta.Repo]

import_config "#{Mix.env()}.exs"
