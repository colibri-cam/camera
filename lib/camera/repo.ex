defmodule Camera.Repo do
  use Ecto.Repo,
    otp_app: :camera,
    adapter: Ecto.Adapters.SQLite3
end
