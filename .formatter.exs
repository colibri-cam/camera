# Used by "mix format"
[
  import_deps: [:ecto, :ecto_sql, :phoenix],
  subdirectories: ["priv/*/migrations"],
  plugins: [Phoenix.LiveView.HTMLFormatter],
  inputs: [
    "*.{heex,ex,exs}",
    "{config,lib,test}/**/*.{heex,ex,exs}",
    "priv/*/seeds.exs",
    "{mix,.formatter}.exs",
    "{config,lib,test}/**/*.{ex,exs}",
    "rootfs_overlay/etc/iex.exs"
  ]
]
