defmodule WorkAppDemo.Repo do
  use Ecto.Repo,
    otp_app: :work_app_demo,
    adapter: Ecto.Adapters.Postgres
end
