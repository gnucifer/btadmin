defmodule Btadmin.Repo do
  use Ecto.Repo,
    otp_app: :btadmin,
    adapter: Ecto.Adapters.Postgres
end
